package analysis.typeinfo;

import analysis.typeinfo.nonPrimativeTypes.*;

/**
 *.
 * SpecialType class provides static members which are 
 *     implementation of Type class
 *
 * @author rezae, ahmad hussein 
 *
 * @see Type We have three special type: Null
 * @see Null Undefined
 * @see UNDEFINED Empty
 * @see EMPTY
 */
public abstract class SpecialType {

    /** 
     *.
     * Null type represent null in program */
    public static final Type NULL =
            new Type() {

                @Override
                public boolean isSubtypeOf(Type other) {
                    return other == this
                            || other instanceof ArrayType
                            || other instanceof ClassType
                            || other == EMPTY;
                }

                @Override
                public String toString() {
                    return "null";
                }
            };

    /** 
     *
     * Undefined type represent types which are not supported 
     *     by our current NQJ grammer */
    public static final Type UNDEFINED =
            new Type() {

                @Override
                public boolean isSubtypeOf(Type other) {
                    return false;
                }

                @Override
                public String toString() {
                    return "undefined type";
                }
            };

    /**
     *.
     * Empty type does not represent any type but it is a 
     *     placeholder which will be used when Analyser find a 
     *     type error Then analyzer will register an error and to 
     *     continue with analyzing process, it will use Empty type. 
     *     for a typical use case
     *
     * @see ExprChecker #case_FunctionCall()
     */
    public static final Type EMPTY =
            new Type() {

                @Override
                public boolean isSubtypeOf(Type other) {
                    return true;
                }

                @Override
                public String toString() {
                    return "empty";
                }
            };
}
