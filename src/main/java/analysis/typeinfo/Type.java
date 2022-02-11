package analysis.typeinfo;

/**
 *.
 * Type class provides abstract view for all types in program. 
 *
 * @author rezae, ahmad hussein
 *     We have three type groups: Primative type, which are Int 
 *     and Bool
 * @see PrimativeTypes 
 *     Non primative types
 * @see ArrayType
 * @see ClassType 
 *     Special type, which are Empty, null, undefined
 * @see SpecialType
 */
public abstract class Type {

    /**
     *.
     * isSubtypeOf will compare the current type object with 
     *     other type object passed as parameter. It will be implemented 
     *     by each classes
     *
     * @param other, it is a target type which will be passed 
     *     to be compared.
     *
     * @return boolean, it is the result of comparision 
     *     for concrete implementation
     *
     * @see PrimativeTypes
     * @see SpecialType
     * @see ArrayType
     * @see ClassType
     */
    public abstract boolean isSubtypeOf(Type other);

    /**
     *.
     * isEqualToType will compare current type object with other type 
     *     object to see whether they are subtype of each other or not.
     *
     * @param other, it is a target type which will be passed to 
     *     be compared.
     *
     * @return boolean, it is the result of comparision
     */
    public boolean isEqualToType(Type other) {
        return this.isSubtypeOf(other) && other.isSubtypeOf(this);
    }
}
