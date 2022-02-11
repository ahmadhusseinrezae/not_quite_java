package analysis;

import analysis.helper.Helper;
import analysis.symboltable.*;
import analysis.typeinfo.*;
import analysis.typeinfo.nonPrimativeTypes.*;
import java.util.ArrayList;
import notquitejava.ast.*;

/** 
 *.
 * This class will match statment and return appropriot type for it. */
public class ExprChecker implements NQJExpr.Matcher<Type>, NQJExprL.Matcher<Type> {

    /** 
     *.
     * It is a refrence to analysis class. */
    private final Analysis analysis;

    /** 
     *.
     * It is a refrence to given function scope which contains 
     *     expression. */
    private final FunctionScope scope;

    /**
     * .
     * Default constructor of ExprChecker which needs.
     *
     * @param analysis refrence to analyzer
     *
     * @param scope refrence to function scope
     */
    public ExprChecker(Analysis analysis, FunctionScope scope) {
        this.analysis = analysis;
        this.scope = scope;
    }

    /**
     *.
     * It will find type of expression.
     *
     * @param e expression to check
     *
     * @return Type foundd type
     */
    public Type check(NQJExpr e) {
        return e.match(this);
    }

    /**
     *.
     * It will find type of expression.
     *
     * @param e expression to check
     *
     * @return Type foundd type
     */
    public Type check(NQJExprL e) {
        return e.match(this);
    }

    /**
     * .
     * It will check if expression has the same type as type of 
     *     expected, If it is not, it will
     *     register an error
     *
     * @param expr it is expression to be analyzed to find its type
     *
     * @param expected it is expected type
     */
    void expect(NQJExpr expr, Type expected) {
        Type actual = check(expr);
        if (actual != null && expected != null) {
            if (!actual.isSubtypeOf(expected)) {
                analysis.addError(
                                expr, "Expected expression of type " 
                                    + expected + " but found " + actual + ".");
            }
        }
    }

    /**
     * .
     * It will check if type of expression is Array, If it is not, 
     *     it will register an error
     *
     * @param expr it is expression to be analyzed to find its type
     *
     * @return Type it is actual type of expression
     */
    Type expectArray(NQJExpr expr) {
        Type actual = check(expr);
        if (!(actual instanceof ArrayType)) {
            analysis.addError(expr, "Expected expression of array type, but found " 
                + actual + ".");
            return SpecialType.EMPTY;
        } else {
            return actual;
        }
    }

    /**
     *.
     * case_ExprUnary.
     *
     * @param exprUnary  expression to check
     *
     * @return Type found type
     */
    @Override
    public Type case_ExprUnary(NQJExprUnary exprUnary) {
        return exprUnary
                .getUnaryOperator()
                .match(
                        new NQJUnaryOperator.Matcher<Type>() {

                            @Override
                            public Type case_UnaryMinus(NQJUnaryMinus unaryMinus) {
                                expect(exprUnary.getExpr(), PrimativeTypes.INT);
                                return PrimativeTypes.INT;
                            }

                            @Override
                            public Type case_Negate(NQJNegate negate) {
                                expect(exprUnary.getExpr(), PrimativeTypes.BOOL);
                                return PrimativeTypes.BOOL;
                            }
                        });
    }

    /**
     * .
     * It will be called if expression checker find a method call, It will first find 
     *     type of method call reciever, If type of reciever is not a class Type, 
     *     it will register an error. Otherwise, it will find the classScope for found 
     *     class type, then it will make valid function signitures for method call by a 
     *     Helper function.
     *
     * @see Helper.makeValidFuncSignature it will create list of valid signiture like Example:
     *     class B{} class A extends B{} class C { func1(Class A). ------> 
     *     func1_A.class , func1_B.class. }
     *     then it will check if class scope has similar function signature by calling
     *     callerScope.checkGetFunction
     * @see callerScope.checkGetFunction 
     *     if there is not any function with given signiture, it will
     *     register an error otherwise, it will find the return type of method call and 
     *     return that type.
     *
     * @param methodCall methodCall
     *
     * @return Type Type
     */
    @Override
    public Type case_MethodCall(NQJMethodCall methodCall) {
        Type type = analysis.checkExpr(analysis.getCurrentFunctionScope(), 
            methodCall.getReceiver());
        Type receiverType = null;
        Type returnType = null;

        if (type instanceof ClassType) {
            receiverType = (ClassType) type;
        } else {
            receiverType = type;
        }

        if (type instanceof ClassType) {
            ClassType callerType = (ClassType) receiverType;
            ClassScope callerScope = callerType.getClassScope();
            String className = callerScope.getClassName();
            String methodName = methodCall.getMethodName();
            NQJExprList methodArgs = methodCall.getArguments();
            ArrayList<String> validFuncSigns =
                            Helper.makeValidFuncSignature(methodName, 
                                methodArgs, this);
            NQJFunctionDecl funcDecl = callerScope.checkGetFunction(methodName, 
                validFuncSigns, analysis);
            methodCall.setFunctionDeclaration(funcDecl);
            // check for overloading
            if (funcDecl != null) {
                returnType = analysis.type(funcDecl.getReturnType());
                return returnType;
            } else {
                analysis.addError(
                            methodCall,
                            "Function with name "
                                            + methodName
                                            + " is not an defined in class with name "
                                            + className
                                            + ".");
                return null;
            }
        } else {
            analysis.addError(methodCall, "Caller is not an instance of class.");
        }
        return null;
    }

    /**
     * .
     * Type of array length will be always an Int
     *
     * @param arrayLength arrayLength
     *
     * @return Type Type
     */
    @Override
    public Type case_ArrayLength(NQJArrayLength arrayLength) {
        expectArray(arrayLength.getArrayExpr());
        return PrimativeTypes.INT;
    }

    /**
     * .
     * It will find current class scope from analysis, if there is not any, 
     *     it will return null and register an error, if there is any, it will 
     *     find classType of current class and return it.
     *
     * @param exprThis exprThis
     *
     * @return Type Type
     */
    @Override
    public Type case_ExprThis(NQJExprThis exprThis) {
        if (analysis.getCurrentClassScope() != null) {
            return analysis.getClassType(analysis.getCurrentClassScope().getClassName());
        } else {
            analysis.addError(exprThis, "Expression This is not pointing to any parent class");
            return null;
        }
    }

    /**
     * It check the binary expression.
     *
     * @param exprBinary exprBinary
     * @return Type Type
     */
    @Override
    public Type case_ExprBinary(NQJExprBinary exprBinary) {
        return exprBinary
                        .getOperator()
                        .match(
                                new NQJOperator.Matcher<>() {
                                    @Override
                                    public Type case_And(NQJAnd and) {
                                        expect(exprBinary.getLeft(), PrimativeTypes.BOOL);
                                        expect(exprBinary.getRight(), PrimativeTypes.BOOL);
                                        return PrimativeTypes.BOOL;
                                    }

                                    @Override
                                    public Type case_Times(NQJTimes times) {
                                        return case_intOperation();
                                    }

                                    @Override
                                    public Type case_Div(NQJDiv div) {
                                        return case_intOperation();
                                    }

                                    @Override
                                    public Type case_Plus(NQJPlus plus) {
                                        return case_intOperation();
                                    }

                                    @Override
                                    public Type case_Minus(NQJMinus minus) {
                                        return case_intOperation();
                                    }

                                    private Type case_intOperation() {
                                        expect(exprBinary.getLeft(), PrimativeTypes.INT);
                                        expect(exprBinary.getRight(), PrimativeTypes.INT);
                                        return PrimativeTypes.INT;
                                    }

                                    @Override
                                    public Type case_Equals(NQJEquals equals) {
                                        Type l = check(exprBinary.getLeft());
                                        Type r = check(exprBinary.getRight());
                                        if (!l.isSubtypeOf(r) && !r.isSubtypeOf(l)) {
                                            analysis.addError(exprBinary, "Cannot compare types " 
                                                + l + " and " + r + ".");
                                        }
                                        return PrimativeTypes.BOOL;
                                    }

                                    @Override
                                    public Type case_Less(NQJLess less) {
                                        expect(exprBinary.getLeft(), PrimativeTypes.INT);
                                        expect(exprBinary.getRight(), PrimativeTypes.INT);
                                        return PrimativeTypes.BOOL;
                                    }
                                });
    }

    /**
     *.
     * exprNull .
     *
     * @param exprNull exprNull
     * @return Type
     */
    @Override
    public Type case_ExprNull(NQJExprNull exprNull) {
        return SpecialType.NULL;
    }

    /**
     * .
     * It will find function declaration and find its return type and return it. 
     *     since we can call a global function and current class functions with 
     *     an unqualified name, it will first generate valid function signature by 
     *     a Helper function
     *
     * @see Helper.makeValidFuncSignature 
     *     it will create list of valid signiture like Example: 
     *     class B{} class A extends B{} class C { func1(Class A). ------> 
     *     func1_A.class , func1_B.class. }
     *     then check current class scope for function declaration, if there is not 
     *     any class scope or function declaration for given function signatures, 
     *     it will check global functions, if there is any function, it will check 
     *     correctness of parameters from function call with function declaration then 
     *     it will return its return type, if there is not any, it will add an error at 
     *     the end it will add funtion declaration into function call for later use in
     *     translation phase.
     *
     * @param funcCall funcCall
     *
     * @return Type Type
     */
    @Override
    public Type case_FunctionCall(NQJFunctionCall funcCall) {
        NQJFunctionDecl funcDecl = null;

        if (analysis.getCurrentClassScope() != null) {

            String methodName = funcCall.getMethodName();
            NQJExprList methodArgs = funcCall.getArguments();
            ArrayList<String> validFuncSigns =
                            Helper.makeValidFuncSignature(methodName, methodArgs, this);
            ClassScope callerScope = analysis.getCurrentClassScope();
            funcDecl = callerScope.checkGetFunction(methodName, validFuncSigns, analysis);

            if (funcDecl == null) {
                funcDecl = analysis.getNameTable().lookupFunction(methodName);
            }
        } else {
            funcDecl = analysis.getNameTable().lookupFunction(funcCall.getMethodName());
        }

        if (funcDecl == null) {
            analysis.addError(funcCall, "Function " + funcCall.getMethodName() 
                + " does not exists.");
            return SpecialType.EMPTY;
        }
        NQJExprList args = funcCall.getArguments();
        NQJVarDeclList params = funcDecl.getFormalParameters();
        if (args.size() < params.size()) {
            analysis.addError(funcCall, "Not enough arguments.");
        } else if (args.size() > params.size()) {
            analysis.addError(funcCall, "Too many arguments.");
        } else {
            for (int i = 0; i < params.size(); i++) {
                expect(args.get(i), analysis.type(params.get(i).getType()));
            }
        }
        funcCall.setFunctionDeclaration(funcDecl);
        return analysis.type(funcDecl.getReturnType());
    }

    /**
     *.
     * case_Number.
     *
     * @param number number
     * @return Type Type
     */
    @Override
    public Type case_Number(NQJNumber number) {
        return PrimativeTypes.INT;
    }

    /**
     *.
     * case_NewArray.
     *
     * @param newArray newArray
     * @return Type Type
     */
    @Override
    public Type case_NewArray(NQJNewArray newArray) {
        expect(newArray.getArraySize(), PrimativeTypes.INT);
        ArrayType type = new ArrayType(analysis.type(newArray.getBaseType()));
        newArray.setArrayType(type);
        return type;
    }

    /**
     * .
     * It will find class declaration for given class name of new object, If 
     *     there exists any class with same name, it will check if class has 
     *     been analyzed already, if no, it will analyzed it first. then it will 
     *     add class declaration to new object and return class type If there does not
     *     exist any class with that name , it will register an error.
     *
     * @param newObject new object to be analyzed to find its true type
     *
     * @return Type
     */
    @Override
    public Type case_NewObject(NQJNewObject newObject) {
        String className = newObject.getClassName();
        if (analysis.lookupClassDecl(className) != null) {
            if (analysis.getClassType(className) != null) {
                newObject.setClassDeclaration(
                                analysis.getClassType(className).getClassScope().getClassDecl());
                return analysis.getClassType(className);
            } else {
                ClassScope currentClsScope = analysis.getCurrentClassScope();
                analysis.lookupClassDecl(className).accept(analysis);
                analysis.setCurrentClassScope(currentClsScope);
                return analysis.getClassType(className);
            }
        } else {
            analysis.addError(newObject, "Class has not been implemeted!");
            return null;
        }
    }

    /**
     * case_BoolConst.
     *
     * @param boolConst boolConst
     * @return Type Type
     */
    @Override
    public Type case_BoolConst(NQJBoolConst boolConst) {
        return PrimativeTypes.BOOL;
    }

    /**
     * case_Read.
     *
     * @param read read
     * @return Type Type
     */
    @Override
    public Type case_Read(NQJRead read) {
        return read.getAddress().match(this);
    }

    /**
     * .
     * It will check if current class has field with same given name If it does not have, 
     *     it will add error if it has, it will add variable declaration to field usage 
     *     and return the type
     *
     * @param fieldAccess fieldAccess
     * @return Type Type
     */
    @Override
    public Type case_FieldAccess(NQJFieldAccess fieldAccess) {
        String varName = fieldAccess.getFieldName();
        FieldInfo classVar = null;
        if (analysis.getCurrentClassScope() != null) {
            classVar = analysis.getCurrentClassScope().lookupVar(varName);
        }

        if (classVar == null) {
            analysis.addError(fieldAccess, "Variable " + varName + " is not defined.");
            return SpecialType.EMPTY;
        }
        fieldAccess.setVariableDeclaration(classVar.getDecl());
        return classVar.getType();
    }

    /**
     * .
     * It will check if varible with same name is defined either current function scope, 
     *     or class scope. It will first check if varible exist in function scope, if yes, 
     *     it will add varible declaration to varible use, if no, it will check varible 
     *     exist in class scope, If yes, it will add variable declaration to varible use, 
     *     if no, it will add error and return empty type.
     *
     * @param varUse varUse
     * @return Type Type
     */
    @Override
    public Type case_VarUse(NQJVarUse varUse) {
        String varName = varUse.getVarName();
        FieldInfo varRef = scope.lookupVar(varName);
        FieldInfo classVar = null;
        if (analysis.getCurrentClassScope() != null) {
            classVar = analysis.getCurrentClassScope().lookupVar(varName);
        }

        if (varRef == null && classVar == null) {
            analysis.addError(varUse, "Variable " + varName + " is not defined.");
            return SpecialType.EMPTY;
        }
        if (varRef == null) { 
            varUse.setVariableDeclaration(classVar.getDecl());
            return classVar.getType();
        } else { // local var
            varUse.setVariableDeclaration(varRef.getDecl());
            return varRef.getType();
        }
    }

    /**
     * case_ArrayLookup.
     *
     * @param arrayLookup arrayLookup
     * @return Type Type
     */
    @Override
    public Type case_ArrayLookup(NQJArrayLookup arrayLookup) {
        Type type = analysis.checkExpr(scope, arrayLookup.getArrayExpr());
        expect(arrayLookup.getArrayIndex(), PrimativeTypes.INT);
        if (type instanceof ArrayType) {
            ArrayType arrayType = (ArrayType) type;
            arrayLookup.setArrayType(arrayType);
            return arrayType.getBaseType();
        }
        analysis.addError(arrayLookup, "Expected an array for array-lookup, but found " + type);
        return SpecialType.EMPTY;
    }
}
