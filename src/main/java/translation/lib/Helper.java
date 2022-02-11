package translation.lib;

import minillvm.ast.*;
import notquitejava.ast.*;

/**
 *.
 * It provided gerneral use functions in one place. 
 *
 */
public class Helper {

    /**
     *.
     * It matches extended class.
     *
     * @param extended It is extended information to match.
     */
    public static NQJExtendsClass matchExtendedClass(NQJExtended extended) {

        NQJExtendsClass extendedClass =
                extended.match(
                        new NQJExtended.Matcher<NQJExtendsClass>() {

                            @Override
                            public NQJExtendsClass case_ExtendsNothing(
                                    NQJExtendsNothing extendsNothing) {
                                return null;
                            }

                            @Override
                            public NQJExtendsClass case_ExtendsClass(
                                    NQJExtendsClass extendsClass) {
                                return extendsClass;
                            }
                        });
        return extendedClass;
    }

    /**
     *.
     * It will check if given expression is an array.
     *
     * @param expr it is expression to check. 
     *
     * @return boolean If it is array it will be true 
     */
    public static boolean isItArray(NQJExprL expr) {
        boolean isArray = false;
        isArray =
                expr.match(
                        new NQJExprL.Matcher<Boolean>() {

                            @Override
                            public Boolean case_ArrayLookup(
                                    NQJArrayLookup arrayLookup) {
                                return true;
                            }

                            @Override
                            public Boolean case_FieldAccess(
                                    NQJFieldAccess fieldAccess) {
                                return false;
                            }

                            @Override
                            public Boolean case_VarUse(
                                    NQJVarUse varUse) {
                                return false;
                            }
                        });
        return isArray;
    }

    /**
     *.
     * It will check if given expression is 
     *     new object expression.
     *
     * @param expr it is expression to check 
     *
     * @return boolean it will be true, if it is 
     *     new Object expression.
     */
    public static boolean isNewObject(NQJExpr expr) {
        boolean isNewObject = false;
        isNewObject =
                expr.match(
                        new NQJExpr.Matcher<Boolean>() {

                            @Override
                            public Boolean case_ExprBinary(
                                    NQJExprBinary exprBinary) {
                                return false;
                            }

                            @Override
                            public Boolean case_NewObject(
                                    NQJNewObject newObject) {
                                return true;
                            }

                            @Override
                            public Boolean case_ExprThis(
                                    NQJExprThis exprThis) {
                                return false;
                            }

                            @Override
                            public Boolean case_FunctionCall(
                                    NQJFunctionCall functionCall) {
                                return false;
                            }

                            @Override
                            public Boolean case_Read(NQJRead read) {
                                return false;
                            }

                            @Override
                            public Boolean case_ExprUnary(
                                    NQJExprUnary exprUnary) {
                                return false;
                            }

                            @Override
                            public Boolean case_ExprNull(
                                    NQJExprNull exprNull) {
                                return false;
                            }

                            @Override
                            public Boolean case_ArrayLength(
                                    NQJArrayLength arrayLength) {
                                return false;
                            }

                            @Override
                            public Boolean case_MethodCall(
                                    NQJMethodCall methodCall) {
                                return false;
                            }

                            @Override
                            public Boolean case_BoolConst(
                                    NQJBoolConst boolConst) {
                                return false;
                            }

                            @Override
                            public Boolean case_Number(
                                    NQJNumber number) {
                                return false;
                            }

                            @Override
                            public Boolean case_NewArray(
                                    NQJNewArray newArray) {
                                return false;
                            }
                        });
        return isNewObject;
    }

    /**
     *.
     * It will get size for given type.
     *
     * @param type it is the type to check its type. 
     *
     * @return int it is size of given type
     */
    public static Integer typeSize(Type type) {
        return type.match(
                new Type.Matcher<>() {
                    @Override
                    public Integer case_TypeByte(TypeByte typeByte) {
                        return 1;
                    }

                    @Override
                    public Integer case_TypeArray(
                            TypeArray typeArray) {
                        // assumtion is that array field will be only a pointer
                        // to someother place where real array will be stored
                        return 8;
                    }

                    @Override
                    public Integer case_TypeProc(
                            TypeProc typeProc) {
                        throw new RuntimeException("Not supported yet");
                    }

                    @Override
                    public Integer case_TypeInt(
                            TypeInt typeInt) {
                        return 8;
                    }

                    @Override
                    public Integer case_TypeStruct(
                            TypeStruct typeStruct) {
                        // assumtion is that struct field will 
                        //     be only a pointer to
                        //     someother place where real struct is stored
                        return 8;
                    }

                    @Override
                    public Integer case_TypeNullpointer(
                            TypeNullpointer typeNullpointer) {
                        return 8;
                    }

                    @Override
                    public Integer case_TypeVoid(
                            TypeVoid typeVoid) {
                        return 0;
                    }

                    @Override
                    public Integer case_TypeBool(
                            TypeBool typeBool) {
                        return 1;
                    }

                    @Override
                    public Integer case_TypePointer(
                            TypePointer typePointer) {
                        return 8;
                    }
                });
    }

    /**
     *.
     * It will check if variable declaration is 
     *     struct type.
     *
     * @param varDecl variable declaration to be checked.
     *
     * @return boolean it is true if variable is struct type
     */
    public static boolean isStruct(NQJVarDecl varDecl) {
        return isStruct(varDecl.getType());
    }

    /**
     *.
     * It checks if given type is struct type.
     *
     * @param type type to be checked
     *
     * @return boolean it is true if it is struct.
     */
    private static boolean isStruct(NQJType type) {
        boolean result =
                type.match(
                        new NQJType.Matcher<>() {
                            @Override
                            public Boolean case_TypeBool(
                                    NQJTypeBool typeBool) {
                                return false;
                            }

                            @Override
                            public Boolean case_TypeClass(
                                    NQJTypeClass typeClass) {
                                return true;
                            }

                            @Override
                            public Boolean case_TypeArray(
                                    NQJTypeArray typeArray) {
                                return true;
                            }

                            @Override
                            public Boolean case_TypeInt(
                                    NQJTypeInt typeInt) {
                                return false;
                            }
                        });
        return result;
    }
}
