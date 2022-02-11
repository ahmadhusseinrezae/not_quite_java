package analysis;

import analysis.helper.Helper;
import analysis.symboltable.*;
import analysis.typeinfo.*;
import analysis.typeinfo.nonPrimativeTypes.*;
import java.util.*;
import notquitejava.ast.*;

/**
 *.
 * Analysis is the core component of analysis process. It will intialize 
 *     and maintain the name
 *     table, Verify the main function, and visit differnet NQJ components 
 *     inlcuding class declaration,
 *     function declaration, variable declaration, and more. to see which 
 *     components it will visit see
 *
 * @see NQJElement.DefaultVisitor
 *     It will firstly create nameTable, Then call initNameTable from it
 * @see initNameTable this function will initialize name table and put 
 *     classes and their functions
 *     inside the table to be use during the Analysis process. 
 *     Then it will verify existance of Main
 *     method inside given program. Then it will start analysing 
 *     program with calling
 *     prog.accept(this);
 */
public class Analysis extends NQJElement.DefaultVisitor {

    /** 
     *.
     * It is a refrence to NQJProgram to be analyzed. */
    private final NQJProgram prog;

    /** 
     *.
     * it is a refrence to nametable. */
    private NameTable nameTable;

    /**
     * .
     * it is map of class name to classScope.
     * it is map of class name to classScope which track classes that
     *     have been already analyzed and
     *     to prevent analysis a class second time
     */
    private final HashMap<String, ClassScope> classScopes = new HashMap<>();

    /**
     * .
     * It is the current class scope. 
     * It is the current class scope, which will be accessible by 
     *     all component when analyzing the
     *     class so that each component can have access to all 
     *     contextual information avaliable for
     *     current class
     */
    private ClassScope currentClass;

    /**
     * .
     * it is a linked list of function and block scopes that are 
     *     under analyses process, we could use
     *     a stack for that and have same functionality, but since we 
     *     dont need to traverse inside this
     *     data structure, then linked list will be better.
     */
    private final LinkedList<FunctionScope> funcScopes = new LinkedList<>();

    /** 
     *.
     * it is a list of errors registered by differnet component
     *     during analysis process. */
    private final List<TypeError> typeErrors = new ArrayList<>();

    /**
     * .
     * It is default constructor for the class. it needs NQJProgram 
     *      as parameter to start analysing.
     */
    public Analysis(NQJProgram prog) {
        this.prog = prog;
    }

    /**
     * .
     * It is the main starting point for the analysis process. It 
     *     will first initiate and complete the
     *     name table. Then it will verify existance of Main function, 
     *     since it is needed for each program
     *     to have a main funciton to start executing. then it will 
     *     start type checking.
     */
    public void check() {

        nameTable = new NameTable(this);
        nameTable.initNameTable(this, prog);

        verifyMainMethod();

        prog.accept(this);
    }

    /**
     * .
     * It will check existance of main function in program, It will 
     *     call lookupFunction in name table
     *     to see if it has a global function with main name. If it does 
     *     not have, it will add error and
     *     stop. otherwise, it will check return type of main function, 
     *     it must be int, otherwise it will
     *     add an error. Then it will check the parameter of main function, 
     *     if there is not any, it will
     *     register an error. Then it will check whether main function has 
     *     return statment, If it does not
     *     have, it will register an error.
     */
    private void verifyMainMethod() {
        var main = nameTable.lookupFunction("main");
        if (main == null) {
            typeErrors.add(new TypeError(prog, 
                "Method int main() must be present"));
            return;
        }
        if (!(main.getReturnType() instanceof NQJTypeInt)) {
            typeErrors.add(
                    new TypeError(main.getReturnType(), 
                    "Return type of the main method must be int"));
        }
        if (!(main.getFormalParameters().isEmpty())) {
            typeErrors.add(
                    new TypeError(main.getFormalParameters(), 
                    "Main method does not take parameters"));
        }
        NQJStatement last = null;
        for (NQJStatement nqjStatement : main.getMethodBody()) {
            last = nqjStatement;
        }
        if (!(last instanceof NQJStmtReturn)) {
            typeErrors.add(
                    new TypeError(
                            main.getFormalParameters(),
                            "Main method does not have a return statement as the last statement"));
        }
    }

    /**
     * .
     * It will analyze extended class of given class. It will check 
     *     whether class has extended any
     *     other class, If yes, it will check whether there exists any 
     *     class Type inside Name table with
     *     same name If there is any, it check if extended class already 
     *     analyzed, if it is not analyzed
     *     yet, it will change the current class to extended class and 
     *     start analyzing it. after
     *     analyzation has been finished, it will reset the current class 
     *     to previous one and continue
     *     with process.
     *
     * @param classDecl it is class declaration to be analyzed
     */
    private void analyzeExtendedClasses(NQJClassDecl classDecl) {

        NQJExtended extended = classDecl.getExtended();
        NQJExtendsClass extendedClass = Helper.matchExtendedClass(extended);

        if (extendedClass != null) {
            String extendedClassName = extendedClass.getName();
            if (nameTable.lookupClass(extendedClassName) != null) {
                if (!classScopes.containsKey(extendedClassName)) {
                    ClassScope currentClassScope = getCurrentClassScope();
                    NQJClassDecl extendedClassDecl = nameTable.lookupClass(extendedClassName);
                    extendedClassDecl.accept(this);
                    currentClass = currentClassScope;
                }
            } else {
                addError(classDecl, "The class with name " + extendedClassName + " does not exist");
            }
        }
    }

    /**
     * .
     * It will check field names in given class and add them into 
     *     class scope for later usage. First
     *     it will add a new field called THIS which has a type of current 
     *     class to class fields, then it
     *     will loop into class variables, and check if there is another 
     *     field with same name inside class
     *     scope, if yes, it will register an error, if no, it will add 
     *     it into class scope
     *
     * @param classDecl it is class declaration of a given class
     *
     * @param classScope it is class scope of a given class
     */
    private void analyzeClassVars(NQJClassDecl classDecl, ClassScope classScope) {
        NQJVarDecl thisVarDecl = NQJ.VarDecl(NQJ.TypeClass(currentClass.getClassName()), "this");
        classScope.putVar(thisVarDecl.getName(), type(thisVarDecl.getType()), thisVarDecl);

        for (NQJVarDecl varDecl : classDecl.getFields()) {
            String varName = varDecl.getName();
            if (classScope.containsField(varName)) {
                addError(classDecl, "Field with name " + varName + " already exists.");
            }
            classScope.putVar(varName, type(varDecl.getType()), varDecl);
        }
    }

    /**
     * .
     * It will loop inside class functions and start analyzing each one, 
     *     by visiting it by Analysis class
     *
     * @param classDecl it is class declaration of a given class
     *
     * @param classScope it is class scope of a given class
     */
    private void analyzeClassFuncs(NQJClassDecl classDecl, ClassScope classScope) {
        for (NQJFunctionDecl funDecl : classDecl.getMethods()) {
            funDecl.accept(this);
        }
    }

    /**
     * .
     * It will return current class scope
     *
     * @return ClassScope it is current class scope
     */
    public ClassScope getCurrentClassScope() {
        return currentClass;
    }

    /**
     * .
     * it will return current function or block scope. It will not 
     *     remove this block from linkedList,
     *     it will just get a refrence to it.
     *
     * @return FunctionScope it is current function or block scope
     */
    public FunctionScope getCurrentFunctionScope() {
        return funcScopes.peek();
    }

    /**
     * .
     * It will return classScope for given class name.
     *
     * @param name it is class name
     *
     * @return ClassScope It is class scope for given name 
     *     if it exist
     */
    public ClassScope getClassScope(String name) {
        return classScopes.get(name);
    }

    /**
     * .
     * It will return class declaration for given name
     *
     * @param className it is class name
     *
     * @return NQJClassDecl it is class declaration for given class 
     *     name if it exists
     */
    public NQJClassDecl lookupClassDecl(String className) {
        return nameTable.lookupClass(className);
    }

    /**
     * .
     * It will look for function inside given class. It 
     *     will get a list of valid function signatures
     *     and call lookupClassFunction from name table.
     *
     * @see lookupClassFunction
     *
     * @param className it is class name
     *
     * @param funcSigns it is list of valid function signatures
     *
     * @return NQJFunctionDecl it is function declaration of given 
     *     function if there is any matching item.
     */
    public NQJFunctionDecl lookupClassFunction(String className, 
        ArrayList<String> funcSigns) {
        return nameTable.lookupClassFunction(className, funcSigns);
    }

    /**
     * .
     * It will look for global function with given name by calling a 
     *     function in name table lookupFunction
     *
     * @see lookupFunction
     *
     * @param funcName it is function name
     *
     * @return NQJFunctionDecl it is function declaration of given 
     *     function if there is any matching item.
     *         
     */
    public NQJFunctionDecl lookupGlobalFunctionDecl(String funcName) {
        return nameTable.lookupFunction(funcName);
    }

    /**
     * .
     * It will return class Type for given class name.
     *
     * @param className it is class name
     *
     * @return ClassType it is class type of given class name if there 
     *     is any matching item.
     */
    public ClassType getClassType(String className) {
        return nameTable.getClassType(className);
    }

    /**
     * .
     * It will set a class scope as current class scope.
     *
     * @param currentScope  currentScope
     */
     
    public void setCurrentClassScope(ClassScope currentScope) {
        this.currentClass = currentScope;
    }

    /**
     * .
     * It will be called when there is a class declaration. 
     *     It will be called when there is a class declaration inside given 
     *     program. It will check if name
     *     table has that class name, If no, it will register an error. 
     *     If yes, it will whether it already
     *     analyzed it by looking at classScopes map
     *
     * @see classScopes 
     *     If it did not analyze it yet, it will proceed. It 
     *     will add class name and class scope into classScopes then 
     *     set it as current class 
     *     then it will first analyze
     *     extended classes of current class, because if all of 
     *     extended components must be available
     *     for this class before starting analyzing it.
     * @see analyzeExtendedClasses 
     *     then it will start analyzing 
     *     current class by analyzing class
     *     varibles and then class functions It will start by 
     *     analyzing varibles, to make them visible
     *     for class function,
     * @see analyzeClassVars
     *
     * @see analyzeClassFuncs And at end it will set the current class to null.
     *
     * @param classDecl it is the class declaration for the class being analyzed
     */
    @Override
    public void visit(NQJClassDecl classDecl) {

        String className = classDecl.getName();

        if (nameTable.lookupClass(className) != null) {
            if (!classScopes.containsKey(className)) {
                ClassScope classScope = nameTable.getClassType(className).getClassScope();
                classScopes.put(className, classScope);

                currentClass = classScope;

                analyzeExtendedClasses(classDecl);

                analyzeClassVars(classDecl, classScope);

                analyzeClassFuncs(classDecl, classScope);

                currentClass = null;
            }
        } else {
            addError(classDecl, "There is not a class with name: " + className);
        }
    }

    /**
     * .
     * It will be called if in time of visiting a function declaration. 
     *     It will firstly check if list
     *     of function or block scopes are empty or not, if yes, it will add 
     *     a new function scope if no,
     *     it will get a copy of parent block scope and use it. then it will 
     *     loop into function parameters
     *     inside function scope, and check if inside function local scope 
     *     exist any variable with same
     *     name, if yes, it will add an error, if no, it will check if variable 
     *     is a class Type, if no, it
     *     will add it into function scope, if yes, it will check if there 
     *     exist a class with name similar
     *     to that class type of variable, If there exist a class, it will 
     *     put variable into function
     *     scope, If not, it will register an error at end of loop of function 
     *     variables, it will set
     *     return type for function Then it will add function scope into 
     *     funcScopes
     *
     * @see funcScopes Then it will start analyzing function body After 
     *     analyzing of function body has
     *     been finished, it will removed function scope from funcScopes
     * 
     * @see funcScopes
     *
     * @param funcDecl it is the function declaration to be analyzed
     */
    @Override
    public void visit(NQJFunctionDecl funcDecl) {
        FunctionScope funcScope =
                funcScopes.isEmpty()
                        ? new FunctionScopeImpl(null, SpecialType.UNDEFINED)
                        : (FunctionScope) funcScopes.peek().copy();
        Set<String> paramNames = new HashSet<>();
        for (NQJVarDecl varDecl : funcDecl.getFormalParameters()) {
            String varName = varDecl.getName();
            NQJType varType = varDecl.getType();
            if (!paramNames.add(varName)) {
                addError(funcDecl, "Parameter with name " + varName + " already exists.");
            }
            if (varType instanceof NQJTypeClass) {
                if (nameTable.lookupClass(((NQJTypeClass) varType).getName()) != null) {
                    funcScope.putVar(varName, type(varType), varDecl);
                } else {
                    addError(
                            funcDecl,
                            "Parameter with name "
                                    + varName
                                    + " does not have any class definition for "
                                    + ((NQJTypeClass) varType).getName()
                                    + ".");
                }
            } else {
                funcScope.putVar(varName, type(varType), varDecl);
            }
        }

        funcScope.setReturnType(type(funcDecl.getReturnType()));
        funcScopes.push(funcScope);

        funcDecl.getMethodBody().accept(this);

        // exit method context
        funcScopes.pop();
    }

    /**
     * .
     * It will be called when analyzor visit a return statment. It will 
     *     find the return type by calling checkExpr
     *
     * @see checkExpr then it will find return type of current function 
     *     scope then it check it type of
     *     return type is subtype of return type of current function 
     *     scope. If it is not, it will add an error
     *
     * @param stmtReturn it is a NQJStmtReturn
     */
    @Override
    public void visit(NQJStmtReturn stmtReturn) {
        Type actualReturn = checkExpr(funcScopes.peek(), stmtReturn.getResult());
        Type expectedReturn = funcScopes.peek().getReturnType();
        if (!actualReturn.isSubtypeOf(expectedReturn)) {
            addError(
                    stmtReturn,
                    "Should return value of type " + expectedReturn 
                    + ", but found " + actualReturn + ".");
        }
    }

    /**
     * .
     * It will be called when analyzor visit a assign statment. It will 
     *     find type of right and left
     *     hand side of assignment by calling checkExpr
     *
     * @see checkExpr Then it will check if type of right hand side of 
     *     assignment is subtype of left
     *     hand side. otherwise it will register an error.
     *
     * @param stmtAssign stmtAssign
     */
    @Override
    public void visit(NQJStmtAssign stmtAssign) {
        Type lt = checkExpr(funcScopes.peek(), stmtAssign.getAddress());
        Type rt = checkExpr(funcScopes.peek(), stmtAssign.getValue());
        if (rt != null && lt != null) {
            if (!rt.isSubtypeOf(lt)) {
                addError(stmtAssign.getValue(), 
                    "Cannot assign value of type " + rt + " to " + lt + ".");
            }
        }
    }

    /**
     * .
     * It will be called when analyzor visit a expression statment.
     *
     * @param stmtExpr stmtExpr
     */
    @Override
    public void visit(NQJStmtExpr stmtExpr) {
        checkExpr(funcScopes.peek(), stmtExpr.getExpr());
    }

    /**
     * .
     * It will be called when analyzor visit a while statment. it will 
     *     find type of while condition expression and check if it is boolean, 
     *     if it is not, it will register an error.
     *
     * @param stmtWhile stmtWhile
     */
    @Override
    public void visit(NQJStmtWhile stmtWhile) {
        Type ct = checkExpr(funcScopes.peek(), stmtWhile.getCondition());
        if (!ct.isSubtypeOf(PrimativeTypes.BOOL)) {
            addError(
                    stmtWhile.getCondition(),
                    "Condition of while-statement must be of type boolean, but this is of type " 
                        + ct + ".");
        }
        super.visit(stmtWhile);
    }

    /**
     * .
     * It will be called when analyzor visit a while statment. it will 
     *     find type of if condition expression and check if it is boolean, 
     *     if it is not, it will register an error.
     *
     * @param stmtIf stmtIf
     */
    @Override
    public void visit(NQJStmtIf stmtIf) {
        Type ct = checkExpr(funcScopes.peek(), stmtIf.getCondition());
        if (!ct.isSubtypeOf(PrimativeTypes.BOOL)) {
            addError(
                    stmtIf.getCondition(),
                    "Condition of if-statement must be of type boolean, but this is of type " 
                        + ct + ".");
        }
        super.visit(stmtIf);
    }

    /**
     * .
     * It will be called when analyzor visit a while statment. It will 
     *     loop into statments of block and check if statment is a variable 
     *     declration, then check if the current block contains a varible 
     *     declaration with same name, If yes, it will add an error, If no, 
     *     it will check type of variable, if it is classType, it will check 
     *     if the class has been analyzed already, and if name table has that 
     *     class name, if name table does not have it, it will register an error, 
     *     If it has, it will add the variable into block scope. at end of loop, 
     *     it will add the block scope as current scope then analyze it, after 
     *     analyzation has been completed, it will remove the block from list 
     *     funcScopes
     *
     * @see funcScopes
     *
     * @param block block
     */
    @Override
    public void visit(NQJBlock block) {
        FunctionScope blockScope = (FunctionScope) funcScopes.peek().copy();
        for (NQJStatement stmt : block) {
            // could also be integrated into the visitor run
            if (stmt instanceof NQJVarDecl) {
                NQJVarDecl varDecl = (NQJVarDecl) stmt;
                String varName = varDecl.getName();
                NQJType varType = varDecl.getType();
                FieldInfo varRef = blockScope.lookupVar(varName);
                if (varRef != null) {
                    addError(varDecl, "A variable with name " + varName + " is already defined.");
                }
                if (varType instanceof NQJTypeClass) {
                    if (nameTable.lookupClass(((NQJTypeClass) varType).getName()) != null) {
                        if (nameTable.getClassType(((NQJTypeClass) varType).getName()) != null) {
                            blockScope.putVar(varName, type(varType), varDecl);
                        } else {
                            ClassScope currentClsScope = getCurrentClassScope();
                            nameTable.lookupClass(((NQJTypeClass) varType).getName()).accept(this);
                            currentClass = currentClsScope;
                            blockScope.putVar(varName, type(varType), varDecl);
                        }
                    } else {
                        addError(
                                block,
                                "Parameter with name "
                                        + varName
                                        + " does not have any class definition for "
                                        + ((NQJTypeClass) varDecl.getType()).getName()
                                        + ".");
                    }
                } else {
                    blockScope.putVar(varName, type(varType), varDecl);
                }
            } else {
                // enter block context
                funcScopes.push(blockScope);
                stmt.accept(this);
                // exit block context
                funcScopes.pop();
            }
        }
    }

    /**
     * .
     * Variable declaration has already been taken care in function 
     *     and block declaration parts
     *
     * @param varDecl varDecl
     */
    @Override
    public void visit(NQJVarDecl varDecl) {
        throw new RuntimeException(); 
    }

    /**
     * .
     * It will find and return type of given expression. 
     *     It will create an object of ExprChecker
     *
     * @see ExprChecker To find what sort of expression it will 
     *     be matched by this class see
     * @see NQJExpr.Matcher
     *
     * @param funcScope it is function scope which will be used 
     *     to find type of given expression
     *
     * @param e it is expression which it is type must be found
     * @return Type
     */
    public Type checkExpr(FunctionScope funcScope, NQJExpr e) {
        return e.match(new ExprChecker(this, funcScope));
    }

    /**
     * .
     * It will find type of fieldAccess, Arraylookup, or variable
     *     used. It will create an object of ExprChecker
     *
     * @see ExprChecker
     *
     * @param funcScope it is function scope which will be used 
     *     to find type of given expression
     *
     * @param e it is expression which it is type must be found
     * @return Type
     */
    public Type checkExpr(FunctionScope funcScope, NQJExprL e) {
        return e.match(new ExprChecker(this, funcScope));
    }

    /**
     * .
     * It will return refrence of name tabel
     *
     * @return NameTable
     */
    public NameTable getNameTable() {
        return nameTable;
    }

    /**
     * .
     * It will register an error into typeErrors
     *
     * @see typeErrors
     *
     * @param element It is element which error happend inside it
     *
     * @param message It is an error message
     */
    public void addError(NQJElement element, String message) {
        typeErrors.add(new TypeError(element, message));
    }

    /**
     * .
     * It will return type error
     *
     * @see typeErrors
     * @return List  list of type errors
     */
    public List<TypeError> getTypeErrors() {
        return new ArrayList<>(typeErrors);
    }

    /**
     * .
     * It will find type of given NQJType by a helper function.
     *
     * @see Helper.matchType It will add found type into NQJType 
     *     for later usage
     *
     * @param type type
     * @return Type found type
     */
    public Type type(NQJType type) {
        Type result = Helper.matchType(type, nameTable);

        type.setType(result);
        return result;
    }

    /**
     * It will set the name Table.
     *
     * @param nameTable the nameTable to set
     */
    public void setNameTable(NameTable nameTable) {
        this.nameTable = nameTable;
    }

}
