package translation.lib;

import analysis.typeinfo.Type;
import analysis.typeinfo.nonPrimativeTypes.ClassType;
import notquitejava.ast.*;
import translation.*;

/**
 *.
 * It will match a given NQJ component to find its given class context.
 */
public class ContxtFinder implements NQJExpr.Matcher<ClassContext>, NQJExprL.Matcher<ClassContext> {

    /**
     *.
     * a refrence to translator instance.
     */
    private Translator translator;


    /**
     *.
     * Default constructor for context finder class.
     *
     * @param translator refrence to translator.
     */
    public ContxtFinder(Translator translator) {
        this.translator = translator;
    }

    /**
     *.
     * It will find class context of array.
     *
     * @param arrayLookup arrayLookup
     *
     * @return ClassContext ClassContext
     */
    @Override
    public ClassContext case_ArrayLookup(NQJArrayLookup arrayLookup) {
        Type arrayBaseType = arrayLookup.getArrayType().getBaseType();
        if (arrayBaseType instanceof ClassType) {
            return translator.getClassContext(
                    ((ClassType) arrayBaseType).getClassScope().getClassName());
        }
        return null;
    }

    /**
     *.
     *
     * @param fieldAccess fieldAccess.
     *
     * @return ClassContext it will be null.
     */
    @Override
    public ClassContext case_FieldAccess(NQJFieldAccess fieldAccess) {
        return null;
    }

    /**
     *.
     * It will find class context of varible.
     *
     * @param varUse  varUse
     *
     * @return ClassContext ClassContext.
     */
    @Override
    public ClassContext case_VarUse(NQJVarUse varUse) {
        String className = getClassName(varUse.getVariableDeclaration().getType());
        return translator.getClassContext(className);
    }

    /**
     *.
     *
     * @param exprBinary exprBinary.
     *
     * @return ClassContext null.
     */
    @Override
    public ClassContext case_ExprBinary(NQJExprBinary exprBinary) {
        return null;
    }

    /**
     *.
     * It will give class context of new object.
     *
     * @param newObject newObject.
     *
     * @return ClassContext ClassContext.
     */
    @Override
    public ClassContext case_NewObject(NQJNewObject newObject) {
        return translator.getClassContext(newObject.getClassName());
    }

    /**
     *. 
     * It will give current class context.
     *
     * @param exprThis exprThis.
     *
     * @return ClassContext ClassContext.
     */
    @Override
    public ClassContext case_ExprThis(NQJExprThis exprThis) {
        return translator.getCurrentClass();
    }

    /**
     *.
     *
     * @param functionCall functionCall.
     *
     * @return ClassContext null.
     */
    @Override
    public ClassContext case_FunctionCall(NQJFunctionCall functionCall) {
        return null;
    }

    /**
     *.
     * It will give class context of read address.
     *
     * @param read read.
     *
     * @return ClassContext ClassContext.
     */
    @Override
    public ClassContext case_Read(NQJRead read) {
        return read.getAddress().match(this);
    }

    /**
     *.
     *
     * @param exprUnary exprUnary.
     *
     * @return ClassContext null.
     */
    @Override
    public ClassContext case_ExprUnary(NQJExprUnary exprUnary) {
        return null;
    }

    /**
     *. 
     *
     * @param exprNull exprNull.
     *
     * @return ClassContext null.
     */
    @Override
    public ClassContext case_ExprNull(NQJExprNull exprNull) {
        return null;
    }

    /**
     *.
     *
     * @param arrayLength arrayLength.
     *
     * @return ClassContext null.
     */
    @Override
    public ClassContext case_ArrayLength(NQJArrayLength arrayLength) {
        return null;
    }

    /**
     *. 
     * It will find class context of return type of method call.
     *
     * @param methodCall methodCall.
     *
     * @return ClassContext ClassContext.
     */
    @Override
    public ClassContext case_MethodCall(NQJMethodCall methodCall) {
        String className = getClassName(methodCall.getFunctionDeclaration().getReturnType());
        return translator.getClassContext(className);
    }

    /**
     *.
     *
     * @param boolConst  boolConst.
     *
     * @return ClassContext null.
     */
    @Override
    public ClassContext case_BoolConst(NQJBoolConst boolConst) {
        return null;
    }

    /**
     *.
     *
     * @param number number.
     *
     * @return ClassContext null.
     */
    @Override
    public ClassContext case_Number(NQJNumber number) {
        return null;
    }

    /**
     *.
     *
     * @param newArray newArray.
     * @return ClassContext null.
     */
    @Override
    public ClassContext case_NewArray(NQJNewArray newArray) {
        return null;
    }

    /**
     *.
     * It will check if type is class, then will find give its class name.
     *
     * @param type type.
     *
     * @return String String.
     */
    private String getClassName(NQJType type) {
        String result =
                type.match(
                        new NQJType.Matcher<>() {
                            @Override
                            public String case_TypeBool(NQJTypeBool typeBool) {
                                return null;
                            }

                            @Override
                            public String case_TypeClass(NQJTypeClass typeClass) {
                                return typeClass.getName();
                            }

                            @Override
                            public String case_TypeArray(NQJTypeArray typeArray) {
                                return null;
                            }

                            @Override
                            public String case_TypeInt(NQJTypeInt typeInt) {
                                return null;
                            }
                        });
        return result;
    }
}
