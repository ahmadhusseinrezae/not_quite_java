package analysis.symboltable;

import analysis.*;
import analysis.helper.Helper;
import analysis.typeinfo.*;
import analysis.typeinfo.nonPrimativeTypes.*;
import java.util.*;
import notquitejava.ast.*;

/**
 * NameTable class keeps track of all information for each
 *     symbole appear at each scope.
 *
 * @author Albert, ahmad hussein rezae 
 *     it include information including: Array type instance for each
 *     base type.
 * @see arrayTypes ClassType instance for each class name
 * @see classTypes List of global functions
 * @see globalFunctions List of class declaration for each class name
 * @see classDecls List of function declaration for each class name
 * @see classFuncDecls
 */
public class NameTable {

    /**
     *. 
     * It is map of base type to arrayType {int, someArrayType}, 
     *     {bool, someOtherArrayType} 
     */
    private final Map<Type, ArrayType> arrayTypes = new HashMap<>();

    /**
     *. 
     * It is map of class name to classType {"class_A", ClassType}, 
     *     {"class_B", ClassType} */
    private final Map<String, ClassType> classTypes = new HashMap<>();

    /** It is map of function name to function declaration */
    private final Map<String, NQJFunctionDecl> globalFunctions = new HashMap<>();

    /**
     *.
     * it is map of class name to class declaration. We have 
     *     already stored this class declaration in ClassScope of classType,
     *     but to make the code more readable and understandble we track a copy
     *     of refence to that declaration here as well.
     */
    private final Map<String, NQJClassDecl> classDecls = new HashMap<>();

    /**
     *.
     * It is a map of class name to map of function signiture to function 
     *     declaration. It has been added to bring understandablity and 
     *     readablity of code. It is already included inside class scope of class 
     *     type for each class name
     */
    private final Map<String, Map<String, NQJFunctionDecl>> classFuncDecls = new HashMap<>();

    /** It is a refrence to core component of analysis process */
    private final Analysis analysis;

    /**
     *.
     * It is the default constructor of NameTable it need analysis reference 
     *     and program as parameter.
     *
     * @param analysis it is a reference to analysis
     */
    public NameTable(Analysis analysis) {

        this.analysis = analysis;
    }

    /**
     *.
     * It is the starting point of building the name table. It start by building 
     *     class scopes, and map of class name to class declarations. Then it 
     *     builds information for extending classes for each class in program. 
     *     Then it check cycle conflict. Then it build class function scopes and 
     *     build classFunction maps. Then it build global functions and add them 
     *     into global function map.
     *
     * @param analysis it is a refrence to analysis
     *
     * @param prog it is a refrence to program to be analyse
     */
    public void initNameTable(Analysis analysis, NQJProgram prog) {

        initClasses(analysis, prog);

        initExtendingContext(analysis, prog);

        checkCycleConflict(analysis, prog);

        initClassFunctions(analysis, prog);

        initGlobalFunctions(analysis, prog);
    }

    /**
     *.
     * It will loop into all classes inside program and Create class scope 
     *     for each class Add that class scope to a class type Register this 
     *     class type inside classTypes with the class name
     *
     * @see classTypes Add class declaration into classDecls map
     * @see classDecls It will check if there is two classes with same name, 
     *     it will register an error
     *
     * @param analysis it is a refrence to analysis
     *
     * @param prog it is a refrence to program to be analyse
     */
    private void initClasses(Analysis analysis, NQJProgram prog) {

        for (NQJClassDecl classDecl : prog.getClassDecls()) {
            ClassScope classScope = new ClassScopeImpl(classDecl.getName(), analysis, classDecl);
            addClassType(classDecl.getName(), new ClassType(classScope));
            NQJClassDecl old = classDecls.put(classDecl.getName(), classDecl);
            if (old != null) {
                analysis.addError(
                        classDecl,
                        "There already is a class with name "
                                + classDecl.getName()
                                + " defined in "
                                + old.getSourcePosition());
            }
        }
    }

    /**
     *.
     * It will add extended class information to each class Scope instance. 
     *     It will loop inside classes in program. Check if that class has 
     *     extended any class. If yes, it will take the extended class name 
     *     check if that extended class exists inside the classTypes which already
     *     initialized in initClasses.
     *
     * @see initClasses If that class does not exist, it will register an error 
     *     If extended class exists, It will find the class type of class that 
     *     extends the extended class Add extended class to class Scope.
     *
     * @param analysis it is a refrence to analysis
     *
     * @param prog it is a refrence to program to be analyse
     */
    private void initExtendingContext(Analysis analysis, NQJProgram prog) {

        for (NQJClassDecl classDecl : prog.getClassDecls()) {
            NQJExtended extended = classDecl.getExtended();
            NQJExtendsClass extendedClass = Helper.matchExtendedClass(extended);

            if (extendedClass != null) {
                String className = classDecl.getName();
                String extendedClassName = extendedClass.getName();
                if (lookupClass(extendedClass.getName()) != null) {
                    ClassType classType = getClassType(className);
                    ClassType extendedClassType = getClassType(extendedClassName);
                    classType
                            .getClassScope()
                            .addExtendedClass(extendedClassName, extendedClassType.getClassScope());
                    classType.addClassExtend(extendedClassType);

                } else {
                    analysis.addError(
                            classDecl, "The class with name " + extendedClassName 
                                + " does not exist");
                }
            }
        }
    }

    /**
     *.
     * It will check the cycle conflict in classes in program. Cycle conflict 
     *     will happend in two cases: 1- when class extend itself 2- when class 
     *     extend an another class which extend first class. example: class A 
     *     extends B{} class B extends C{} class C extends A{} It will loop inside
     *     classes inside program and call another private function checkCycleInheretance 
     *     for each class.
     *
     * @see checkCycleInheretance
     *
     * @param analysis it is a refrence to analysis
     *
     * @param prog it is a refrence to program to be analyse
     */
    private void checkCycleConflict(Analysis analysis, NQJProgram prog) {
        for (NQJClassDecl classDecl : prog.getClassDecls()) {
            checkCycleInheretance(analysis, classDecl);
        }
    }

    /**
     *.
     * It will find class scope of class declaration name call checkCycleConflict 
     *     of that scope.
     *
     * @see checkCycleConflict
     *
     * @param analysis it is a refrence to analysis
     *
     * @param classDecl it is a refrence to class declaration to be checked for 
     *     cycle dependancy
     */
    private void checkCycleInheretance(Analysis analysis, NQJClassDecl classDecl) {
        if (classTypes.get(classDecl.getName()) != null) {
            ClassScope classScope = classTypes.get(
                    classDecl.getName()).getClassScope();
            classScope.checkCycleConflict();
        }
    }

    /**
     * .
     * It will loop in classes in program and start initilizatin of 
     *     class function for each of classes
     *
     * @param analysis it is a refrence to analysis
     *
     * @param prog it is a refrence to program to be analyse
     */
    private void initClassFunctions(Analysis analysis, NQJProgram prog) {

        for (NQJClassDecl classDecl : prog.getClassDecls()) {
            initClassFunc(classDecl, analysis, prog);
        }
    }

    /**
     *.
     * It will analyze class functions and add them into class scope and 
     *     classFuncDecls in name table.
     *
     * @see classFuncDecls It will first check extended classes of given 
     *     class, If there is any extended class, it will find NQJExtendsClass 
     *     by Helper function
     *
     * @see matchExtendedClass If there is a extended class, it will check if 
     *     this extended class already exist in nameTable and it has not analyzed 
     *     its functions already. If it is true, it will find the classType for 
     *     extended class and call initClassFunc function for that class. After 
     *     analyzing functions for extended classes, It will analyzing class functions, It
     *     first check whether it already analyzed class functions. If it has not analyzed, 
     *     it will loop inside class's functions, make unique signiture for each function 
     *     by Helper function
     * @see makeFunctionSignature Then it will check for overriding. It will check 
     *     if current class is  correctly overriding the super function. If it is 
     *     overriding it must be same signiture as super function. Example: class 
     *     A{ int a(int some);} class B extends A{ int a(bool some)}
     *     This is wrong and will be catched by checkOverriding function
     * @see checkOverriding Then it will add the function signiture into class function 
     *     map. If there exists already some fucntion with same signiture, it will register 
     *     an error. At end it will add function into class scope and classFuncDecls
     *
     * @see classFuncDecls
     *
     * @param classDecl it is class declaration to analyze its functions
     *
     * @param analysis it is a refrence to analysis
     *
     * @param prog it is a refrence to program to be analyse
     */
    private void initClassFunc(NQJClassDecl classDecl, Analysis analysis, NQJProgram prog) {

        String className = classDecl.getName();
        NQJExtended extended = classDecl.getExtended();
        NQJExtendsClass extendedClass = Helper.matchExtendedClass(extended);
        if (extendedClass != null) {
            String extendedClassName = extendedClass.getName();
            if (lookupClass(extendedClassName) != null && 
                classFuncDecls.get(extendedClassName) == null) {
                ClassType extendedClassType = getClassType(extendedClassName);
                initClassFunc(extendedClassType.getClassScope().getClassDecl(), analysis, prog);
            }
        }
        if (classFuncDecls.get(className) == null) {
            Map<String, NQJFunctionDecl> classFunctions = new HashMap<>();
            ClassType classType = getClassType(className);
            ClassScope classScope = classType.getClassScope();
            for (NQJFunctionDecl funcDecl : classDecl.getMethods()) {

                String funcName = funcDecl.getName();
                String funcSign =
                        Helper.makeFunctionSignature(funcName, 
                            funcDecl.getFormalParameters(), analysis);
                checkOverriding(funcName, funcSign, classDecl, funcDecl);
                NQJFunctionDecl oldFunc = classFunctions.put(funcSign, funcDecl);
                if (oldFunc != null) {
                    analysis.addError(
                            classDecl,
                            "There already is a function with the same signiture "
                                    + funcSign
                                    + " defined in "
                                    + oldFunc.getSourcePosition());
                }
                classScope.addFunction(funcName, funcSign, funcDecl);
            }
            classFuncDecls.put(className, classFunctions);
        }
    }

    /**
     *.
     * It will loop inside global functions inside program. It will check if 
     *     already there exist some function with same name, If yes it will 
     *     register an error. If no it will add it inside
     *     globalFunctions
     *
     * @see globalFunctions
     *
     * @param analysis it is a refrence to analysis
     *
     * @param prog it is a refrence to program to be analyse
     */
    private void initGlobalFunctions(Analysis analysis, NQJProgram prog) {
        globalFunctions.put(
                "printInt",
                NQJ.FunctionDecl(
                        NQJ.TypeInt(),
                        "main",
                        NQJ.VarDeclList(NQJ.VarDecl(NQJ.TypeInt(), "elem")),
                        NQJ.Block()));
        for (NQJFunctionDecl f : prog.getFunctionDecls()) {
            var old = globalFunctions.put(f.getName(), f);
            if (old != null) {
                analysis.addError(
                        f,
                        "There already is a global function with name "
                                + f.getName()
                                + " defined in "
                                + old.getSourcePosition());
            }
        }
    }

    /**
     *.
     * It will check correct overriding roles to be applied. roles says 
     *     that if parent class has a function, and child class wnats to 
     *     define same function name, it must have same signature. Since we have 
     *     overloading concepts as well, then it is possible to have multiple function
     *     declaration with same name in parent class. in that case we need to 
     *     check if new function signature match at least one of parent overloaded 
     *     functions.
     *
     * It will loop inside extended classes and get map of overloaded functions 
     *     from it. then it will loop inside those overloaded functions. Then 
     *     it will create a list of valid function signature for each of functions 
     *     in extended class. then loop inside valid function signatures and check 
     *     whether new function signature is equal to function signature in loop. if find at
     *     least one, it will set matched variable to true, which indicated function 
     *     signiture matched a parent function.
     *
     *     At the end, if it did not find any matching parent function, it will 
     *     register an error.
     *
     * @param funcName it is the function name
     *
     * @param funcSign it is unique signiture of function
     *
     * @param classDecl it is class declaration which is has the function declaration
     */
    private void checkOverriding(String funcName, String funcSign, NQJClassDecl classDecl, NQJFunctionDecl sourceFuncDecl) {
        ClassType classType = getClassType(classDecl.getName());
        ClassScope classScope = classType.getClassScope();
        Map<String, ClassScope> extendedClasses = classScope.getExtendedClasses();
        boolean matched = false;
        boolean isFromParent = false;
        for (ClassScope extendedClass : extendedClasses.values()) {
            Map<String, NQJFunctionDecl> functionDecls = extendedClass.getFunction(funcName);
            if (functionDecls != null) {
                for (NQJFunctionDecl funcDecl : functionDecls.values()) {
                    String parentFuncSign =
                            Helper.makeFunctionSignature(
                                    funcDecl.getName(), funcDecl.getFormalParameters(), analysis);
                    if (funcSign.equals(parentFuncSign)) {
                            Type sourceReturnType = analysis.type(sourceFuncDecl.getReturnType());
                            Type parentReturnType = analysis.type(funcDecl.getReturnType());
                            if(sourceReturnType.isSubtypeOf(parentReturnType)){
                                matched = true;
                            }
                        }
                }
                isFromParent = true;
            }
        }
        if (!matched && isFromParent) {
            analysis.addError(
                    classDecl,
                    "Function declaration does not comply to parent function declarations" 
                        + funcName);
        }
    }

    /**
     *.
     * It will look for global function inside globalFunctions amp
     *
     * @see globalFunctions
     *
     * @param funcName It is function name to look for it
     *
     * @return NQJFunctionDecl it is funtion declaratin of given function name, 
     *     if there exist any. otherwise, it will return null.
     */
    public NQJFunctionDecl lookupFunction(String funcName) {
        return globalFunctions.get(funcName);
    }

    /**
     *.
     * It will look for class declaration inside classDecls amp
     *
     * @see classDecls
     *
     * @param className it is class name to look for
     *
     * @return NQJClassDecl it is class declartion of given class name, 
     *     if there exist any. otherwise, it will return null.
     */
    public NQJClassDecl lookupClass(String className) {
        return classDecls.get(className);
    }

    /**
     *.
     * It will get a list of valid function signature and look 
     *     inside class function and check if there exists any function 
     *     with same signature.
     *
     * @param className it is class name of class declaration which 
     *     should has the function
     *
     * @param funcSigns it is a valid list of function signature which 
     *     it will loop into it and check if there exist any function 
     *     with that signature inside loop.
     *
     * @return NQJFunctionDecl it is a function declaration of wanted 
     *     function or null if there is not any.
     */
    public NQJFunctionDecl lookupClassFunction(String className, ArrayList<String> funcSigns) {
        for (String funcSign : funcSigns) {
            if (classFuncDecls.get(className).containsKey(funcSign)) {
                return classFuncDecls.get(className).get(funcSign);
            }
        }
        return null;
    }

    /**
     *.
     * It will get a type as base type and find or create an array 
     *     type for that base type from arrayTypes map
     *
     * @see arrayTypes
     *
     * @param baseType it is base type of array
     *
     * @return ArrayType it is new or existing array type for base type
     */
    public ArrayType getArrayType(Type baseType) {
        if (!arrayTypes.containsKey(baseType)) {
            arrayTypes.put(baseType, new ArrayType(baseType));
        }
        return arrayTypes.get(baseType);
    }

    /**
     *.
     * It will add class type if there is not any with same class 
     *     name in classTypes
     *
     * @see classTypes
     *
     * @param name it is the class name
     *
     * @param type it is the ClassType of class
     *
     * @return
     */
    public void addClassType(String name, ClassType type) {
        if (!classTypes.containsKey(name)) {
            classTypes.put(name, type);
        }
    }

    /**
     *.
     * it will find class type for given class name
     *
     * @param name it is class name
     *
     * @return ClassType it is classType if there is any, 
     *     if not, it will return null.
     */
    public ClassType getClassType(String name) {
        return classTypes.get(name);
    }

    /**
     *.
     * It will check whether there exists a classType insdie classTypes 
     *     with same name as parameter.
     *
     * @see classTypes
     *
     * @param name it is the class name to look for
     *
     * @return boolean it will true if there is a class type for given name, 
     *     otherewise, it will be false.
     */
    public boolean containsClassType(String name) {
        return classTypes.containsKey(name);
    }
}
