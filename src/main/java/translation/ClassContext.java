package translation;

import static minillvm.ast.Ast.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import minillvm.ast.*;
import notquitejava.ast.*;
import translation.lib.*;


/**
 *.
 * It will contains all information about class.
 */
public class ClassContext {

    /**
     *.
     * a refrence to transaltor instance.
     */
    private Translator translator;

    /**
     *.
     * class declaration.
     */
    private NQJClassDecl classDecl;

    /**
     *.
     * created llvm struct for class.
     */
    private TypeStruct classStruct;

    /**
     *.
     * create virtual table struct for this class.
     */
    private TypeStruct vTableStruct;

    /**
     *.
     *  global variale create for the virtual table of class.
     */
    private Global vtableGlob;

    /**
     *.
     * constructor procedure created for class.
     */
    private Proc constructorProc;

    /**
     *.
     * class fields.
     */
    private Map<Integer, NQJVarDecl> classFields 
        = new HashMap<>();

    /**
     *.
     * map of index of function to class function declaration.
     */
    private Map<Integer, NQJFunctionDecl> classFunctions 
        = new HashMap<>();

    /**
     *.
     * map of function index in parent class and their 
     *     function declaraion.
     */
    private Map<Integer, NQJFunctionDecl> parentFunctions = new HashMap<>();

    /**
     *.
     * total size of all functions of this class with its parents.
     */
    private int functionSize = 0;

    /**
     *.
     * if functions have been analyzed already.
     */
    private boolean analyzed = false;


    /**
     *.
     * default constructor for class.
     *
     * @param classDecl
     *
     * @param translator
     */
    ClassContext(NQJClassDecl classDecl, Translator translator) {
        this.classDecl = classDecl;
        this.translator = translator;
        this.classStruct = TypeStruct("class_" + classDecl.getName(), StructFieldList());
        this.vTableStruct = TypeStruct("vfTableStruct" + classDecl.getName(), StructFieldList());
        this.constructorProc = null;
        this.vtableGlob = null;
    }

    
    /** 
     *.
     * It will create a struct for class, 
     *     then create procedures signitures,
     *     then create virtual table for procedures, 
     *     then register this table into globals
     *
     * @return Type
     */
    public Type buildStruct() {

        buildClassStruct();

        initProcSignitures();

        buildVTableStruct();

        buildVTableGlobal();

        return classStruct;
    }


    /**
     *.
     * It will build a llvm struct for class. 
     */
    private void buildClassStruct() {
        ArrayList<StructField> structFields = new ArrayList<>();

        // adding a pointer to function list
        structFields.add(StructField(TypePointer(vTableStruct), 
            "procs_pointer"));

        // adding rest of fields
        ArrayList<NQJVarDecl> tempFields = new ArrayList<>();
        tempFields.addAll(getClassFields().values());
        for (NQJVarDecl field : tempFields) {
            structFields.add(StructField(translator.translateType(
                    field.getType()), field.getName()));
        }

        classStruct.setFields(StructFieldList(structFields));
        translator.addStruct(classStruct);
    }

    /**
     *.
     * It will initiate procidure signitures for extended class, 
     *     then procedure of this class.
     */
    public void initProcSignitures() {

        ClassContext extendedClass = getExtendedClass();
        if (extendedClass != null) {
            translator.setCurrentClass(extendedClass);
            extendedClass.initProcSignitures();
        }

        translator.setCurrentClass(this);
        if (!analyzed) {
            prepareClassFunctions();
            for (NQJFunctionDecl funcDecl : classFunctions.values()) {
                translator.initClassFunction(funcDecl);
            }
        }
    }

    /**
     *.
     * It will create virtual table struct for procidure of 
     *     this class. and add it into llvm program.
     */
    private void buildVTableStruct() {

        ArrayList<StructField> procStructFields = new ArrayList<>();
        int funcIndex = 0;
        while (funcIndex < functionSize) {
            NQJFunctionDecl localFunc = classFunctions.get(funcIndex);
            if (localFunc != null) { 
                TypeRefList paramTypeList =
                        TypeRefList(TypePointer(classStruct)); 
                Type returnType = translator.translateType(
                        localFunc.getReturnType());
                for (NQJVarDecl param : localFunc.getFormalParameters()) {
                    paramTypeList.add(translator.translateType(
                            param.getType()));
                }
                procStructFields.add(
                        StructField(TypePointer(TypeProc(
                                paramTypeList, returnType)), localFunc.getName()));

            } else { // if function is from super class
                NQJFunctionDecl parentFunc = parentFunctions.get(funcIndex);
                if (parentFunc != null) {
                    // get structField from super
                    StructField structField = getExtendedClass().getProcStructField(
                            funcIndex);
                    if (structField != null) {
                        procStructFields.add(structField);
                    }
                }
            }
            funcIndex += 1;
        }

        vTableStruct.setFields(StructFieldList(procStructFields));
        translator.addStruct(vTableStruct);
    }

    /**
     *.
     * This will create and register an object from virtual table of 
     *     class and register it in globals.
     */
    private void buildVTableGlobal() {

        ConstList procPointers = ConstList();
        int procIndex = 0;
        while (procIndex < functionSize) {
            NQJFunctionDecl localFunc = classFunctions.get(procIndex);
            if (localFunc != null) { 
                ProcedureRef procRef = ProcedureRef(
                        translator.getProc(localFunc));
                procPointers.add(procRef.copy());

            } else { // if function is from super class
                NQJFunctionDecl parentFunc = parentFunctions.get(procIndex);
                if (parentFunc != null) {
                    ProcedureRef procRef = ProcedureRef(
                            translator.getProc(parentFunc));
                    procPointers.add(procRef.copy());
                }
            }
            procIndex += 1;
        }

        vtableGlob =
                Global(
                        vTableStruct,
                        "vtableGVar" + classDecl.getName(),
                        false,
                        ConstStruct(vTableStruct, procPointers));
        translator.addGlobal(vtableGlob);
    }

    
    /** 
     *.
     * It will create a constructor procedure for the class.
     *
     * @return Proc constructor procedure.
     */
    public Proc buildConstructor() {
        constructorProc =
                Proc(
                        "newClass" + classDecl.getName(),
                        TypePointer(classStruct),
                        ParameterList(),
                        BasicBlockList());

        translator.addProcedure(constructorProc);
        translator.setCurrentProc(constructorProc);

        BasicBlock init = translator.newBasicBlock("init");

        translator.addBasicBlock(init);
        translator.setCurrentBlock(init);

        // calculating size for struct
        ArrayList<NQJVarDecl> fieldsDecls = new ArrayList<>();
        fieldsDecls.addAll(getClassFields().values());
        TemporaryVar sizeOfStruct = TemporaryVar("sizeOfStruct");

        // 8 byte for pointer to struct
        Integer size = 8;
        for (NQJVarDecl field : fieldsDecls) {
            size += Helper.typeSize(
                    translator.translateType(field.getType()));
        }
        translator.addInstruction(BinaryOperation(
                sizeOfStruct, ConstInt(0), Add(), ConstInt(size)));

        // allocating memory for struct
        TemporaryVar mallocResult = TemporaryVar("mallocRes");
        translator.addInstruction(Alloc(mallocResult,
            VarRef(sizeOfStruct)));
        TemporaryVar newObject = TemporaryVar("newObject");
        translator.addInstruction(Bitcast(newObject, 
            TypePointer(classStruct), VarRef(mallocResult)));

        // storing pointer to vfTable
        final TemporaryVar iAddr = TemporaryVar("iAddr");
        translator.addInstruction(
                GetElementPtr(iAddr, VarRef(newObject), 
                    OperandList(ConstInt(0), ConstInt(0))));
        translator.addInstruction(Store(VarRef(iAddr), 
            GlobalRef(vtableGlob)));

        // returning new created object to caller
        init.add(ReturnExpr(VarRef(newObject)));

        return constructorProc;
    }

    
    /** 
     *.
     * It will create a struct field for given index of class functions.
     *
     * @param index index of class function.
     *
     * @return StructField created struct field for function.
     */
    public StructField getProcStructField(int index) {
        NQJFunctionDecl localFunc = classFunctions.get(index);
        if (localFunc != null) { 
            TypeRefList paramTypeList =
                    TypeRefList(TypePointer(classStruct)); 
            Type returnType = translator.translateType(localFunc.getReturnType());
            for (NQJVarDecl param : localFunc.getFormalParameters()) {
                paramTypeList.add(translator.translateType(param.getType()));
            }
            return StructField(TypePointer(TypeProc(
                    paramTypeList, returnType)), localFunc.getName());
        } else {
            NQJFunctionDecl parentFunc = parentFunctions.get(index);
            if (parentFunc != null) {
                // get structField from super
                StructField structField = 
                    getExtendedClass().getProcStructField(index);
                return structField;
            } else {
                return null;
            }
        }
    }

    
    /** 
     *.
     * It will return class struct.
     *
     * @return Type struct of class.
     */
    public Type getStruct() {

        return classStruct;
    }

    
    /** 
     *.
     * It will give struct of virtual table.
     *
     * @return TypeStruct vtable struct.
     */
    public TypeStruct getVTableStruct() {
        return vTableStruct;
    }

    
    /** 
     *.
     * It will give constructor procedure.
     *
     * @return Proc Proc.
     */
    public Proc getClassConstructor() {
        return constructorProc;
    }

    
    /** 
     *.
     * It will give class declaration of class.
     *
     * @return NQJClassDecl NQJClassDecl.
     */
    public NQJClassDecl getClassDecl() {
        return classDecl;
    }

    
    /** 
     *.
     * It will get extended class of this class.
     *
     * @return ClassContext ClassContext.
     */
    public ClassContext getExtendedClass() {
        NQJExtended extended = classDecl.getExtended();
        NQJExtendsClass extendedClass = Helper.matchExtendedClass(extended);

        if (extendedClass != null) {
            ClassContext extendedClassContxt = 
                translator.getClassContext(extendedClass.getName());
            return extendedClassContxt;
        } else {
            return null;
        }
    }

    
    /** 
     *.
     * It will give map of class fields, which is from class and its parents.
     *
     * @return Map<Integer, NQJVarDecl>
     */
    public Map<Integer, NQJVarDecl> getClassFields() {

        NQJExtended extended = classDecl.getExtended();
        NQJExtendsClass extendedClass = Helper.matchExtendedClass(extended);

        if (extendedClass != null) {
            ClassContext extendedClassContxt = 
                translator.getClassContext(extendedClass.getName());
            if (extendedClassContxt != null) {
                int index = 1;
                for (Map.Entry<Integer, NQJVarDecl> entry :
                        extendedClassContxt.getClassFields().entrySet()) {
                    classFields.put(entry.getKey(), entry.getValue());
                    index++;
                }
                for (NQJVarDecl varDecl : classDecl.getFields()) {
                    classFields.put(index++, varDecl.copy());
                }
            }
            return classFields;
        } else {
            int index = 1;
            for (NQJVarDecl varDecl : classDecl.getFields()) {
                classFields.put(index++, varDecl.copy());
            }
            return classFields;
        }
    }

    
    /** 
     *.
     * It will give index of variale declarion in class.
     *
     * @param varDecl NQJVarDecl.
     *
     * @return int index of field.
     */
    public int getClassField(NQJVarDecl varDecl) {
        for (Map.Entry<Integer, NQJVarDecl> entry : classFields.entrySet()) {
            if (entry.getValue().getName().equals(varDecl.getName())) {
                return entry.getKey();
            }
        }
        // -1 means not found the var inside class vars
        return -1;
    }

    
    /** 
     *.
     * It wiil give procedure index in class.
     *
     * @param funcDecl function declaration.
     * @return int  index of function.
     */
    public int getProcIndex(NQJFunctionDecl funcDecl) {
        int index = 0;
        while (index < functionSize) {
            NQJFunctionDecl entry = classFunctions.get(index);
            if (entry != null) {
                if (entry == funcDecl) {
                    return index;
                }
            } else {
                NQJFunctionDecl superEntry = parentFunctions.get(index);
                if (superEntry != null) {
                    if (superEntry == funcDecl) {
                        return index;
                    }
                }
            }
            index++;
        }
        // -1 means no result
        return -1;
    }

    
    /** 
     *.
     * It will exact class context of caller of function.
     *
     * @param funcDecl NQJFunctionDecl.
     * @return ClassContext ClassContext.
     */
    public ClassContext getProcCallerContxt(NQJFunctionDecl funcDecl) {
        int index = 0;
        while (index < functionSize) {
            NQJFunctionDecl localFunc = classFunctions.get(index);
            if (localFunc != null) {
                if (localFunc == funcDecl) {
                    return this;
                }
            } else {
                NQJFunctionDecl parentFunc = parentFunctions.get(index);
                if (parentFunc != null) {
                    if (parentFunc == funcDecl) {
                        return getExtendedClass().getProcCallerContxt(funcDecl);
                    }
                }
            }
            index++;
        }
        return null;
    }

    
    /** 
     *.
     * It will give class and its parent functions and their indexes.
     *
     * @return map of finctions and their indexes.
     */
    public Map<Integer, NQJFunctionDecl> prepareClassFunctions() {
        if (!analyzed) {
            NQJExtended extended = classDecl.getExtended();
            NQJExtendsClass extendedClass = 
                Helper.matchExtendedClass(extended);

            int index = 0;
            if (extendedClass != null) {
                ClassContext extendedClassContxt = 
                    translator.getClassContext(extendedClass.getName());
                if (extendedClassContxt != null) {
                    parentFunctions.putAll(
                            extendedClassContxt.prepareClassFunctions());
                    index = parentFunctions.size();
                    functionSize = parentFunctions.size();
                }
            }

            for (NQJFunctionDecl function : classDecl.getMethods()) {
                boolean isInParent = false;
                if (parentFunctions.size() > 0) {
                    for (Map.Entry<Integer, NQJFunctionDecl> entry : parentFunctions.entrySet()) {
                        if (function.getName().equals(entry.getValue().getName())) {
                            classFunctions.put(entry.getKey(), function);
                            isInParent = true;
                        }
                    }
                    if (!isInParent) {
                        classFunctions.put(index++, function);
                        functionSize += 1;
                    }
                } else {
                    classFunctions.put(index++, function);
                    functionSize += 1;
                }
            }
            analyzed = true;
            return classFunctions;
        }
        return classFunctions;
    }
}
