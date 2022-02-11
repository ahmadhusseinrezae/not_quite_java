package analysis.symboltable;

import analysis.typeinfo.*;
import java.util.HashMap;
import java.util.Map;
import notquitejava.ast.NQJVarDecl;

/**
 * FunctionScopeImpl class provide implementation for functionScope class.
 *
 * @author rezae, ahmad hussein  
 *     It impelements
 * @see FunctionScope 
 *     It contains contextual information for the function and block scope.
 */
public class FunctionScopeImpl implements FunctionScope {

    /**
     *.
     * It is a map of field name to field information of all local variables 
     *     of this function or block scope.
     */
    private final Map<String, FieldInfo> fields;

    /** It is the return type of current function scope. */
    private Type returnType;

    /** It is the type of THIS variable for the current function or block scope. */
    private Type thisType;

    /**
     *.
     * It is one of constructor of class. It accept map of field which means 
     *     it can inherent fields from parent block when it is being created.
     *
     * @param fields it is map of fields which can be empty or map from parent block
     *
     * @param returnType it is the return type of function scope
     *
     * @param thisType it is type of this variable
     */
    public FunctionScopeImpl(Map<String, FieldInfo> fields, Type returnType, Type thisType) {
        this.fields = fields;
        this.returnType = returnType;
        this.thisType = thisType;
    }

    /**
     *.
     * It is another constructor of class where it is assumed that it is the 
     *     first block which does not have parent block, so it create an empty 
     *     field list.
     *
     * @param returnType It is the return type of function scope
     *
     * @param thisType it is type of this variable
     */
    public FunctionScopeImpl(Type returnType, Type thisType) {
        this.fields = new HashMap<>();
        this.returnType = returnType;
        this.thisType = thisType;
    }

    /**
     *.
     * It returns returnType of function scope
     *
     * @return Type
     */
    @Override
    public Type getReturnType() {
        return returnType;
    }

    /**
     *.
     * It return type of this variable
     *
     * @return Type
     */
    @Override
    public Type getThisType() {
        return thisType;
    }

    /**
     *.
     * It will check whether varible with given name exist in current function 
     *     or block scope
     *
     * @param varName It is name of variable
     * @return FieldInfo It will return FieldInfo of given varibale if it exists 
     *     in scope, otherwise it will return null
     */
    @Override
    public FieldInfo lookupVar(String varName) {
        return fields.get(varName);
    }

    /**
     *.
     * It will add new variable by given name into scope
     *
     * @param varName It is name of new variable
     *
     * @param type It is type if new variable
     *
     * @param var It is variable declaration of new variable
     */
    @Override
    public void putVar(String varName, Type type, NQJVarDecl var) {
        this.fields.put(varName, new FieldInfo(varName, type, var));
    }

    /**
     *.
     * It is implementation of copy function from scope interface
     *
     * @see Scope It will create a new Scope by current fields, return type, 
     *     and this type. We will use it in time of making a new child block
     * @return FunctionScope it is new functionScope created by this function
     */
    @Override
    public FunctionScope copy() {
        return new FunctionScopeImpl(new HashMap<>(this.fields), this.returnType, this.thisType);
    }

    /**
     *.
     * It set the type of this variable for the current scope block
     *
     * @param thisType it is the type of this varible
     */
    @Override
    public void setThisType(Type thisType) {
        this.thisType = thisType;
    }

    /**
     *.
     * It set the return type of current function scope
     *
     * @param returnType it is the return type
     */
    @Override
    public void setReturnType(Type returnType) {
        this.returnType = returnType;
    }
}
