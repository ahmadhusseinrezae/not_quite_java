package analysis.symboltable;

import analysis.typeinfo.*;
import notquitejava.ast.*;

/**
 * FieldInfo class represent variable in any scope.
 *
 * @author rezae, ahmad hussein  In each scope, 
 *     in case of field declaration or parameter registration, we create 
 *     an instance of this class to represent that variable. It contains all 
 *     information related to variable including: field type, field declaration, 
 *     field name
 */
public class FieldInfo {

    /** It is the type of field. */
    private final Type type;

    /** It is the variable declaration for the field. */
    private final NQJVarDecl varDecl;

    /** It is the name of field */
    private final String fieldName;

    /**
     *.
     * the default constructor for field info class. it need all attributes of 
     *     class, so all of them are necessary to create a field info instance.
     *
     * @param name It is the name of field
     *
     * @param type it is the type of field
     *
     * @param varDecl it is the variable declaration of the field
     */
    FieldInfo(String name, Type type, NQJVarDecl varDecl) {
        this.fieldName = name;
        this.type = type;
        this.varDecl = varDecl;
    }

    /**
     *.
     * it returns name of field
     *
     * @return String name
     */
    public String getName() {
        return fieldName;
    }

    /**
     *.
     * It returns type of field
     *
     * @return Type Type
     */
    public Type getType() {
        return type;
    }

    /**
     * .
     * It returns variable declaration of field
     *
     * @return NQJVarDecl NQJVarDecl
     */
    public NQJVarDecl getDecl() {
        return varDecl;
    }
}
