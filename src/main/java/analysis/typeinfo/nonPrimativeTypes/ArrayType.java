package analysis.typeinfo.nonPrimativeTypes;

import analysis.typeinfo.*;

/**
 *.
 * ArrayType class represent array type in program and contain
 *     all contextual information for its object It represent contextual 
 *     information by an only field called baseType 
 *
 * @author Albert, rezae, ahmad hussein 
 *
 * @see baseType It will represent the type of each item of array
 */
public class ArrayType extends Type {

    /** 
     *.
     * Type of each element of array */
    public final Type baseType;

    /**
     *.
     * Default constructor of ArrayType
     *
     * @param baseType It will be the base type for array which 
     *     is necessary in time of ArrayType initialization
     */
    public ArrayType(Type baseType) {
        this.baseType = baseType;
    }

    /**
     *.
     * It is implementation of isSubtypeOf method of abstract Type class. 
     *     It will check whether the target type is ArrayType or Empty type 
     *     Then it will check whether base type from target type is suptype 
     *     of base type of current type. It basically compares base types of 
     *     current and target type.
     *
     * @param other
     *
     * @return boolean is result of comparison
     */
    @Override
    public boolean isSubtypeOf(Type other) {
        if (other instanceof ArrayType) {
            ArrayType ct = (ArrayType) other;
            return baseType.isSubtypeOf(ct.baseType);
        }
        return other == SpecialType.EMPTY;
    }

    /** 
     *.
     * @return String It is name of basetype with an [] extension 
     *     which represent an array type */
    @Override
    public String toString() {
        return baseType.toString() + "[]";
    }

    /**
     *.
     * It will return the base type of array
     *
     * @return Type It is the base type of array
     */
    public Type getBaseType() {
        return baseType;
    }
}
