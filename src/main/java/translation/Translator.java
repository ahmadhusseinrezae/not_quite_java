package translation;

import static frontend.AstPrinter.print;
import static minillvm.ast.Ast.*;

import analysis.typeinfo.PrimativeTypes;
import analysis.typeinfo.nonPrimativeTypes.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;
import minillvm.ast.*;
import notquitejava.ast.*;

/** 
 * It is the core class for translation process.*/
public class Translator {

    /**
     * It is a refrence to statment translator. 
     *
     * @see StmtTranslator
     */
    private final StmtTranslator stmtTranslator = new StmtTranslator(this);

    /**
     * It is a refrence to expression list matcher. 
     *
     * @see ExprLValue
     */
    private final ExprLValue exprLValue = new ExprLValue(this);

    /**
     * It is a refrence to expression matcher. 
     *
     * @see ExprRValue
     */
    private final ExprRValue exprRValue = new ExprRValue(this);

    /**
     * It is an initial program object with empty.
     *     struct list, global list, and procesidure list. 
     *
     * @see Prog
     */
    private final Prog prog = Prog(TypeStructList(), 
        GlobalList(), ProcList());

    /**
     * It is a refrence to NQJProgram to be translated. 
     *
     * @see NQJProgram
     */
    private final NQJProgram javaProg;

    /**
     * It is a map.
     * It is a map which contains list of variable declarations 
     *     to temporary variables created for it.
     */
    private final Map<NQJVarDecl, TemporaryVar> localVarLocation = new HashMap<>();

    /**
     * It is a map.
     * It is a map which contains list of function declarations 
     *     to llvm procedures created for it.
     */
    private final Map<NQJFunctionDecl, Proc> funcMap = new HashMap<>();

    /**
     * It is a map.
     * It is a map which contains list of checked types 
     *     to llvm type created for it.
     */
    private final Map<analysis.typeinfo.Type, Type> translatedType = new HashMap<>();

    /**
     * It is a map.
     * It is a map which contains list of LLVM types 
     *     to type struct created for it.
     */
    private final Map<Type, TypeStruct> arrayStruct = new HashMap<>();

    /**
     * It is a map.
     * It is a map which contains list of LLVM types 
     *     to array generator procedures for that type.
     */
    private final Map<Type, Proc> newArrayFuncForType = new HashMap<>();

    /**
     * It is a map.
     * It is a map which contains list of class names
     *     to class context created for it.
     */
    private Map<String, ClassContext> classes = new HashMap<>();

    /**
     * It is a current class context under translation.
     */
    private ClassContext currentClass;

    /**
     * It is a common temporary variable create for each class.
     */
    private TemporaryVar thisVar = TemporaryVar("this");

    /**
     * It is current procedure under transaltion.
     */
    private Proc currentProcedure;

    /**
     * It is current block under translation.
     */
    private BasicBlock currentBlock;


    /**
     * It is default constructor of translator class.
     *     It get NQJprogram to be analyzed.
     */
    public Translator(NQJProgram javaProg) {
        this.javaProg = javaProg;
    }

    
    /**
     * It is the main strating point.
     * It is the main strating point to translate the program to
     *     LLVM program.
     *     It first initiate classes, and their struct, and vtable
     *     then will translate global functions, 
     *     then will translate class functions,
     *     then it will translate main function,
     *     then it will build array generator procedures.
     */
    public Prog translate() {
        
        translateClasses();

        translateFunctions();

        translateClassesBody();

        this.currentClass = null;
        
        translateMainFunction();

        finishNewArrayProcs();

        return prog;
    }

    /**
     * It will create class context.
     * It will create class context for each class in program,
     *     then build struct for that class.
     */
    private void translateClasses() {
        for (NQJClassDecl classDecl : javaProg.getClassDecls()) {
            initClass(classDecl);
        }

        for (NQJClassDecl classDecl : javaProg.getClassDecls()) {
            buildStructClass(classDecl);
        }
    }


    /**
     * It will translate class fuctions.
     * It will translate class fuctions of each class in program,
     */
    private void translateClassesBody() {
        for (NQJClassDecl classDecl : javaProg.getClassDecls()) {
            translateClass(classDecl);
        }
    }


    /**
     * It will initiate and translate global functions.
     * It will initiate and translate global functions in program,
     *     It will not translate main function which is an 
     *     exception case.
     */
    private void translateFunctions() {
        for (NQJFunctionDecl functionDecl : javaProg.getFunctionDecls()) {
            if (functionDecl.getName().equals("main")) {
                continue;
            }
            initFunction(functionDecl);
        }
        for (NQJFunctionDecl functionDecl : javaProg.getFunctionDecls()) {
            if (functionDecl.getName().equals("main")) {
                continue;
            }
            translateFunction(functionDecl);
        }
    }

    /**
     * It will translate main function.
     *     it will find the function declaration for it, 
     *     if there is not any, it will throw an exception.
     *     otherwise, it will create a procedure for it and ,
     *     strat translating it.
     */
    private void translateMainFunction() {
        NQJFunctionDecl f = null;
        for (NQJFunctionDecl functionDecl : javaProg.getFunctionDecls()) {
            if (functionDecl.getName().equals("main")) {
                f = functionDecl;
                break;
            }
        }

        if (f == null) {
            throw new IllegalStateException("Main function expected");
        }

        Proc proc = Proc("main", TypeInt(), ParameterList(), BasicBlockList());
        addProcedure(proc);
        funcMap.put(f, proc);

        setCurrentProc(proc);
        BasicBlock initBlock = newBasicBlock("init");
        addBasicBlock(initBlock);
        setCurrentBlock(initBlock);

        // allocate space for the local variables
        allocaLocalVars(f.getMethodBody());

        // translate
        translateStmt(f.getMethodBody());
    }

    /** 
     * it will initiate a class context for given declaration.
     *
     * @param classDecl it is the class declaration to be translated. */
    private void initClass(NQJClassDecl classDecl) {
        ClassContext classContext = new ClassContext(classDecl, this);
        classes.put(classDecl.getName(), classContext);
    }

    /** 
     * it will build a struct. 
     * it will build a struct and constructor procedure for class
     *     if it is not done already. 
     *
     * @param classDecl it is the class declaration to be translated. */
    private void buildStructClass(NQJClassDecl classDecl) {
        if (classes.get(classDecl.getName()) != null) {
            classes.get(classDecl.getName()).buildStruct();
            classes.get(classDecl.getName()).buildConstructor();
        }
    }

    /** 
     * it will translate class functions which have been already initiated.
     *
     * @param classDecl it is the class declaration to be translated. */
    private void translateClass(NQJClassDecl classDecl) {
        if (classes.get(classDecl.getName()) != null) {
            currentClass = classes.get(classDecl.getName());

            for (NQJFunctionDecl functionDecl : classDecl.getMethods()) {
                translateClassFunction(functionDecl);
            }
        }
    }

    /** 
     * it sets a class context as current context.
     *
     * @param classContxt current context. */
    public void setCurrentClass(ClassContext classContxt) {
        currentClass = classContxt;
    }

    /** 
     * It return current class context.
     *
     * @return ClassContext currentClass. */
    public ClassContext getCurrentClass() {
        return currentClass;
    }

    /**
     * It will look for class context for a given class name.
     *
     * @param className class name to get class context
     *
     * @return ClassContext class context of given class name.
     */
    public ClassContext getClassContext(String className) {
        return classes.get(className);
    }

    /**
     * It will look for procedure for a given function declaration.
     *
     * @param funcDecl  it is function declaration
     *
     * @return Proc
     */
    public Proc getProc(NQJFunctionDecl funcDecl) {
        return funcMap.get(funcDecl);
    }

    /**
     * It will initiate a procedure for given function declaraion.
     *     it first analyze the return type of function
     *     then find type for each of its parameters, 
     *     then it will create a procedure with analyzed types.
     *     then it will add it into function map.
     *
     * @param f function declaration. */
    public void initClassFunction(NQJFunctionDecl f) {
        Type returnType = translateType(f.getReturnType());
        ArrayList<Parameter> paramsWithThis = new ArrayList<>();
        paramsWithThis.add(Parameter(TypePointer(currentClass.getStruct()), 
            "this"));
        ArrayList<Parameter> params =
                f.getFormalParameters().stream()
                        .map(p -> Parameter(translateType(p.getType()), 
                            p.getName()))
                        .collect(Collectors.toCollection(ArrayList::new));
        paramsWithThis.addAll(params);
        ParameterList parameters = ParameterList(paramsWithThis);

        Proc proc = Proc(f.getName(), returnType, parameters, BasicBlockList());

        addProcedure(proc);
        funcMap.put(f, proc);
    }

    /**
     * it will look for temprary variable.
     * it will look for temprary variable created for given 
     *     varible declaration in current scope.
     *
     * @param varDecl variable declaration.
     *
     * @return TemporaryVar temporary variable created for varible declaraion
     */
    TemporaryVar getLocalVarLocation(NQJVarDecl varDecl) {
        return localVarLocation.get(varDecl);
    }

    /** 
     * It will give this temporary variable.
     *
     * @return TemporaryVar */
    TemporaryVar getThisVarLocation() {
        return thisVar;
    }

    /** 
     * It will generate array generator procedure for each type.
     *
     */
    private void finishNewArrayProcs() {
        for (Type type : newArrayFuncForType.keySet()) {
            finishNewArrayProc(type);
        }
    }

    /** 
     * It will create a procedure for each array type.
     *     and add them into map.
     *
     * @param componentType */
    private void finishNewArrayProc(Type componentType) {
        final Proc newArrayFunc = newArrayFuncForType.get(componentType);
        final Parameter size = newArrayFunc.getParameters().get(0);

        addProcedure(newArrayFunc);
        setCurrentProc(newArrayFunc);

        BasicBlock init = newBasicBlock("init");
        addBasicBlock(init);
        setCurrentBlock(init);
        TemporaryVar sizeLessThanZero = TemporaryVar("sizeLessThanZero");
        addInstruction(BinaryOperation(sizeLessThanZero, VarRef(size), 
            Slt(), ConstInt(0)));
        BasicBlock negativeSize = newBasicBlock("negativeSize");
        BasicBlock goodSize = newBasicBlock("goodSize");
        currentBlock.add(Branch(VarRef(sizeLessThanZero), 
            negativeSize, goodSize));

        addBasicBlock(negativeSize);
        negativeSize.add(HaltWithError("Array Size must be positive"));

        addBasicBlock(goodSize);
        setCurrentBlock(goodSize);

        // allocate space for the array

        TemporaryVar arraySizeInBytes = TemporaryVar("arraySizeInBytes");
        addInstruction(BinaryOperation(arraySizeInBytes, VarRef(size), 
            Mul(), byteSize(componentType)));

        // 4 bytes for the length
        TemporaryVar arraySizeWithLen = TemporaryVar("arraySizeWitLen");
        addInstruction(BinaryOperation(arraySizeWithLen, 
            VarRef(arraySizeInBytes), Add(), ConstInt(4)));

        TemporaryVar mallocResult = TemporaryVar("mallocRes");
        addInstruction(Alloc(mallocResult, VarRef(arraySizeWithLen)));
        TemporaryVar newArray = TemporaryVar("newArray");
        addInstruction(Bitcast(newArray, getArrayPointerType(componentType), 
            VarRef(mallocResult)));

        // store the size
        TemporaryVar sizeAddr = TemporaryVar("sizeAddr");
        addInstruction(
                GetElementPtr(sizeAddr, VarRef(newArray), 
                    OperandList(ConstInt(0), ConstInt(0))));
        addInstruction(Store(VarRef(sizeAddr), VarRef(size)));

        // initialize Array with zeros:
        final BasicBlock loopStart = newBasicBlock("loopStart");
        final BasicBlock loopBody = newBasicBlock("loopBody");
        final BasicBlock loopEnd = newBasicBlock("loopEnd");
        final TemporaryVar iVar = TemporaryVar("iVar");
        currentBlock.add(Alloca(iVar, TypeInt()));
        currentBlock.add(Store(VarRef(iVar), ConstInt(0)));
        currentBlock.add(Jump(loopStart));

        // loop condition: while i < size
        addBasicBlock(loopStart);
        setCurrentBlock(loopStart);
        final TemporaryVar i = TemporaryVar("i");
        final TemporaryVar nextI = TemporaryVar("nextI");
        loopStart.add(Load(i, VarRef(iVar)));
        TemporaryVar smallerSize = TemporaryVar("smallerSize");
        addInstruction(BinaryOperation(smallerSize, VarRef(i), 
            Slt(), VarRef(size)));
        currentBlock.add(Branch(VarRef(smallerSize), loopBody, loopEnd));

        // loop body
        addBasicBlock(loopBody);
        setCurrentBlock(loopBody);
        // ar[i] = 0;
        final TemporaryVar iAddr = TemporaryVar("iAddr");
        addInstruction(
                GetElementPtr(iAddr, VarRef(newArray), OperandList(ConstInt(0), 
                    ConstInt(1), VarRef(i))));
        addInstruction(Store(VarRef(iAddr), defaultValue(componentType)));

        // nextI = i + 1;
        addInstruction(BinaryOperation(nextI, VarRef(i), Add(), ConstInt(1)));
        // store new value in i
        addInstruction(Store(VarRef(iVar), VarRef(nextI)));

        loopBody.add(Jump(loopStart));

        addBasicBlock(loopEnd);
        loopEnd.add(ReturnExpr(VarRef(newArray)));
    }

    /** 
     * It will create an empty procedure for given function declaraion.
     *
     * @param f function declaration. */
    private void initFunction(NQJFunctionDecl f) {
        Type returnType = translateType(f.getReturnType());
        ParameterList params =
                f.getFormalParameters().stream()
                        .map(p -> Parameter(translateType(p.getType()), p.getName()))
                        .collect(Collectors.toCollection(Ast::ParameterList));
        Proc proc = Proc(f.getName(), returnType, params, BasicBlockList());
        addProcedure(proc);
        funcMap.put(f, proc);
    }

    /** 
     * It will translate global function into procedure.
     *     It will create temporary variables for variable
     *     declaraions inside function and then translate body of 
     *     function.
     *
     * @param m  function declaration. */
    private void translateFunction(NQJFunctionDecl m) {
        Proc proc = funcMap.get(m);
        setCurrentProc(proc);
        BasicBlock initBlock = newBasicBlock("init");
        addBasicBlock(initBlock);
        setCurrentBlock(initBlock);

        localVarLocation.clear();

        // store copies of the parameters in Allocas, 
        // to make uniform read/write access possible
        int i = 0;
        for (NQJVarDecl param : m.getFormalParameters()) {
            TemporaryVar v = TemporaryVar(param.getName());
            addInstruction(Alloca(v, translateType(param.getType())));
            addInstruction(Store(VarRef(v), VarRef(proc.getParameters().get(i))));
            localVarLocation.put(param, v);
            i++;
        }

        // allocate space for the local variables
        allocaLocalVars(m.getMethodBody());

        translateStmt(m.getMethodBody());
    }

    /** 
     * It will translate class function declaration.
     *     It will first make temporary variables for 
     *     all parameters for procedure and assuming that
     *     first parameter will be always the this varible.
     *
     * @param m  function declaration.*/
    public void translateClassFunction(NQJFunctionDecl m) {
        Proc proc = funcMap.get(m);
        setCurrentProc(proc);
        BasicBlock initBlock = newBasicBlock("init");
        addBasicBlock(initBlock);
        setCurrentBlock(initBlock);

        localVarLocation.clear();

        // start from 1 since the first parameter is pointer to caller object
        int i = 1;
        for (NQJVarDecl param : m.getFormalParameters()) {
            TemporaryVar v = TemporaryVar(param.getName());
            addInstruction(Alloca(v, translateType(param.getType())));
            addInstruction(Store(VarRef(v), VarRef(proc.getParameters().get(i))));
            localVarLocation.put(param, v);
            i++;
        }

        // allocate space for the local variables
        allocaLocalVars(m.getMethodBody());

        translateStmt(m.getMethodBody());
    }

    /** 
     * It will translate statment to llvm instruction.
     *
     * @param s Statment. */
    void translateStmt(NQJStatement s) {
        addInstruction(CommentInstr(sourceLine(s) 
            + " start statement : " + printFirstline(s)));
        s.match(stmtTranslator);
        addInstruction(CommentInstr(sourceLine(s) 
            + " end statement: " + printFirstline(s)));
    }

    /**
     * It will return source line of given element.
     *
     * @param e Element 
     *
     * @return int
     */
    int sourceLine(NQJElement e) {
        while (e != null) {
            if (e.getSourcePosition() != null) {
                return e.getSourcePosition().getLine();
            }
            e = e.getParent();
        }
        return 0;
    }

    /**
     * It will print statment.
     *
     * @param s statment.
     *
     * @return String
     */
    private String printFirstline(NQJStatement s) {
        String str = print(s);
        str = str.replaceAll("\n.*", "");
        return str;
    }

    /**
     * It will make a new llvm basic block and return it.
     *
     * @param name
     *
     * @return BasicBlock
     */
    public BasicBlock newBasicBlock(String name) {
        BasicBlock block = BasicBlock();
        block.setName(name);
        return block;
    }

    /**
     * It will add given llvm block into current procedure.
     *
     * @param block block.*/
    public void addBasicBlock(BasicBlock block) {
        currentProcedure.getBasicBlocks().add(block);
    }

    /** 
     * It will get the current block.
     *
     * @return BasicBlock current block.
     */
    public BasicBlock getCurrentBlock() {
        return currentBlock;
    }

    /** 
     * It will set a llvm basic block as current block. 
     *
     * @param currentBlock */
    public void setCurrentBlock(BasicBlock currentBlock) {
        this.currentBlock = currentBlock;
    }

    /** 
     * It will add given procedure into llvm program.
     *
     * @param proc Procedure.*/
    public void addProcedure(Proc proc) {
        prog.getProcedures().add(proc);
    }

    /** 
     * It will set the current llvm procedure.
     *
     * @param currentProc Procedure.
     */
    public void setCurrentProc(Proc currentProc) {
        if (currentProc == null) {
            throw new RuntimeException("Cannot set proc to null");
        }
        this.currentProcedure = currentProc;
    }

    /** 
     * It will create temporary variable.
     * It will create temporary variable for variable declaration
     *     inside given NQJBlock into current llvm block.
     *
     * @param methodBody NQJBlock. */
    private void allocaLocalVars(NQJBlock methodBody) {
        methodBody.accept(
                new NQJElement.DefaultVisitor() {
                    @Override
                    public void visit(NQJVarDecl localVar) {
                        super.visit(localVar);
                        TemporaryVar v = TemporaryVar(localVar.getName());
                        addInstruction(Alloca(v, translateType(localVar.getType())));
                        localVarLocation.put(localVar, v);
                    }
                });
    }

    /** 
     * It will add an llvm instruction into current block.
     *
     * @param instruction LLVM instruction.
     */
    public void addInstruction(Instruction instruction) {
        currentBlock.add(instruction);
    }

    /** 
     * It will add a llvm global variable into program.
     *
     * @param globalVar Global. 
     */
    public void addGlobal(Global globalVar) {
        prog.getGlobals().add(globalVar);
    }

    /**
     * It will get list of global variables.
     *
     *  @return GlobalList List of global variables.
     */
    public GlobalList getGlobal() {
        return prog.getGlobals();
    }

    /**
     * It will translate a NQJType into corresponding LLvm type.
     *
     * @param type NQJType
     *
     * @return Type translated llvm type.
     */
    public Type translateType(NQJType type) {
        return translateType(type.getType());
    }

    /**
     * It will translate a type analyzed.
     * It will translate a type analyzed from type checking phase
     *     into a llvm type. It will give a pointer type in case of 
     *     array and class type. 
     *
     * @param t type from type checking phase.
     *
     * @return Type llvm type.
     */
    Type translateType(analysis.typeinfo.Type t) {
        Type result = translatedType.get(t);
        if (result == null) {
            if (t == PrimativeTypes.INT) {
                result = TypeInt();
            } else if (t == PrimativeTypes.BOOL) {
                result = TypeBool();
            } else if (t instanceof ArrayType) {
                ArrayType at = (ArrayType) t;
                result = TypePointer(getArrayStruct(translateType(
                        at.getBaseType())));
            } else if (t instanceof ClassType) {
                ClassType ct = (ClassType) t;
                result = TypePointer(getClassContext(
                        ct.getClassScope().getClassName()).getStruct());
            } else {
                throw new RuntimeException("unhandled case " + t);
            }
            translatedType.put(t, result);
        }
        return result;
    }

    /** 
     * It will get this paramter from current procedure. 
     *     this will be always first paramter of procedure.
     *
     * @return Parameter this parameter.*/
    Parameter getThisParameter() {
        return currentProcedure.getParameters().get(0);
    }

    /**
     * It will match expression list. 
     *
     * @param e expression list to be matched.
     * @return Operand found operand.
     */
    Operand exprLvalue(NQJExprL e) {
        return e.match(exprLValue);
    }

    /**
     * It will match expression.
     *
     * @param e expression
     *
     * @return Operand
     */
    Operand exprRvalue(NQJExpr e) {
        return e.match(exprRValue);
    }

    /**
     * It will a null check llvm block of instruction for given array address.
     *
     * @param arrayAddr array address, pointer.
     * @param errorMessage error massage for null part.
     */
    void addNullcheck(Operand arrayAddr, String errorMessage) {
        TemporaryVar isNull = TemporaryVar("isNull");
        addInstruction(BinaryOperation(isNull, arrayAddr.copy(), Eq(), 
            Nullpointer()));

        BasicBlock whenIsNull = newBasicBlock("whenIsNull");
        BasicBlock notNull = newBasicBlock("notNull");
        currentBlock.add(Branch(VarRef(isNull), whenIsNull, notNull));

        addBasicBlock(whenIsNull);
        whenIsNull.add(HaltWithError(errorMessage));

        addBasicBlock(notNull);
        setCurrentBlock(notNull);
    }

    /**
     * It will get array lenght of given array pointer. 
     *     it will be the first element of array in memory.
     *
     * @param arrayAddr pointer to array.
     *
     * @return Operand refrence to temporary variable which holds 
     *     length of array.
     */
    Operand getArrayLen(Operand arrayAddr) {
        TemporaryVar addr = TemporaryVar("length_addr");
        addInstruction(GetElementPtr(addr, arrayAddr.copy(), 
            OperandList(ConstInt(0), ConstInt(0))));
        TemporaryVar len = TemporaryVar("len");
        addInstruction(Load(len, VarRef(addr)));
        return VarRef(len);
    }

    /**
     * It will return array generator for particular type.
     *
     * @param componentType type of array.
     *
     * @return Operand procedure refrence.
     */
    public Operand getNewArrayFunc(Type componentType) {
        Proc proc = newArrayFuncForType.computeIfAbsent(componentType, 
            this::createNewArrayProc);
        return ProcedureRef(proc);
    }

    /**
     * It will create a new procedure.
     * It will create a new procedure to create an array for 
     *     a type. 
     * 
     *
     * @param componentType array type.
     *
     * @return Proc created procedure for array.
     */
    private Proc createNewArrayProc(Type componentType) {
        Parameter size = Parameter(TypeInt(), "size");
        return Proc(
                "newArray", getArrayPointerType(componentType), 
                    ParameterList(size), BasicBlockList());
    }

    /**
     * It will give a pointer to arrary struct for particular type.
     *
     * @param componentType  array type.
     *
     * @return Type pointer to array struct.
     */
    private Type getArrayPointerType(Type componentType) {
        return TypePointer(getArrayStruct(componentType));
    }

    /**
     * It will create or get a struct for given type of array.
     *
     * @param type type of array.
     *
     * @return TypeStruct created array struct.
     */
    TypeStruct getArrayStruct(Type type) {
        return arrayStruct.computeIfAbsent(
                type,
                t -> {
                    TypeStruct struct =
                            TypeStruct(
                                    "array_" + type,
                                    StructFieldList(
                                            StructField(TypeInt(), "length"), 
                                                StructField(TypeArray(type, 0), "data")));
                    prog.getStructTypes().add(struct);
                    return struct;
                });
    }

    /** 
     * It will add a given struct to llvm program.
     *
     * @param struct struct. 
     */
    public void addStruct(TypeStruct struct) {
        prog.getStructTypes().add(struct);
    }

    /**
     * It will add a cast blcok.
     * It will add a cast blcok of instruction if it is needed to current 
     *     block.
     *
     * @param value
     * @param expectedType
     * @return Operand
     */
    Operand addCastIfNecessary(Operand value, Type expectedType) {
        if (expectedType.equalsType(value.calculateType())) {
            return value;
        }
        TemporaryVar castValue = TemporaryVar("castValue");
        addInstruction(Bitcast(castValue, expectedType, value));
        return VarRef(castValue);
    }

    /** 
     * unreachableBlock.
     *
     * @return BasicBlock */
    BasicBlock unreachableBlock() {
        return BasicBlock();
    }

    /** 
     * It will return type of current procedure.
     *
     * @return Type return type current procedure. */
    Type getCurrentReturnType() {
        return currentProcedure.getReturnType();
    }

    /**
     * It will return procedure for function declaration. 
     *
     * @param functionDeclaration function declaration.
     * @return Proc created procedure.
     */
    public Proc loadFunctionProc(NQJFunctionDecl functionDeclaration) {
        return funcMap.get(functionDeclaration);
    }

    /** return the number of bytes required by the given type. */
    public Operand byteSize(Type type) {
        return type.match(
                new Type.Matcher<>() {
                    @Override
                    public Operand case_TypeByte(TypeByte typeByte) {
                        return ConstInt(1);
                    }

                    @Override
                    public Operand case_TypeArray(TypeArray typeArray) {
                        // assumtion is that array field will be only a pointer
                        // to someother place where real
                        // array will be stored
                        return ConstInt(8);
                    }

                    @Override
                    public Operand case_TypeProc(TypeProc typeProc) {
                        // pointer to proc
                        return ConstInt(8);
                    }

                    @Override
                    public Operand case_TypeInt(TypeInt typeInt) {
                        return ConstInt(4);
                    }

                    @Override
                    public Operand case_TypeStruct(TypeStruct typeStruct) {
                        // assumtion is that struct field will be only a pointer 
                        // to someother place where real
                        // array will be stored
                        return ConstInt(8);
                    }

                    @Override
                    public Operand case_TypeNullpointer(TypeNullpointer typeNullpointer) {
                        return ConstInt(8);
                    }

                    @Override
                    public Operand case_TypeVoid(TypeVoid typeVoid) {
                        return ConstInt(0);
                    }

                    @Override
                    public Operand case_TypeBool(TypeBool typeBool) {
                        return ConstInt(1);
                    }

                    @Override
                    public Operand case_TypePointer(TypePointer typePointer) {
                        return ConstInt(8);
                    }
                });
    }

    /**
     * It will provide default values for given type.
     *
     * @param componentType
     * @return Operand
     */
    private Operand defaultValue(Type componentType) {
        return componentType.match(
                new Type.Matcher<>() {
                    @Override
                    public Operand case_TypeByte(TypeByte typeByte) {
                        throw new RuntimeException("TODO implement");
                    }

                    @Override
                    public Operand case_TypeArray(TypeArray typeArray) {
                        throw new RuntimeException("TODO implement");
                    }

                    @Override
                    public Operand case_TypeProc(TypeProc typeProc) {
                        throw new RuntimeException("TODO implement");
                    }

                    @Override
                    public Operand case_TypeInt(TypeInt typeInt) {
                        return ConstInt(0);
                    }

                    @Override
                    public Operand case_TypeStruct(TypeStruct typeStruct) {
                        throw new RuntimeException("TODO implement");
                    }

                    @Override
                    public Operand case_TypeNullpointer(TypeNullpointer typeNullpointer) {
                        return Nullpointer();
                    }

                    @Override
                    public Operand case_TypeVoid(TypeVoid typeVoid) {
                        throw new RuntimeException("TODO implement");
                    }

                    @Override
                    public Operand case_TypeBool(TypeBool typeBool) {
                        return ConstBool(false);
                    }

                    @Override
                    public Operand case_TypePointer(TypePointer typePointer) {
                        return Nullpointer();
                    }
                });
    }
}
