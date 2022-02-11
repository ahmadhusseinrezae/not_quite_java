package analysis.typeinfo;

/**
 *.
 * PrimativeTypes class provides static members for primative 
 *     types which are implementation of Type class
 *
 * @author rezae, ahmad hussein 
 * @see Type We have two primative types: Int
 * @see INT Bool
 * @see BOOL
 */
public abstract class PrimativeTypes {

    /** 
     *.
     * INT represent int in program */
    public static final Type INT =
            new Type() {

                @Override
                public boolean isSubtypeOf(Type other) {
                    return other == this || other == SpecialType.EMPTY;
                }

                @Override
                public String toString() {
                    return "int";
                }
            };

    /** 
     *.
     * BOOL represent boolean in program */
    public static final Type BOOL =
            new Type() {

                @Override
                public boolean isSubtypeOf(Type other) {
                    return other == this || other == SpecialType.EMPTY;
                }

                @Override
                public String toString() {
                    return "boolean";
                }
            };
}
