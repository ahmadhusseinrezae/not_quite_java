package analysis.symboltable;

import analysis.typeinfo.*;

/**
 * FunctionScope class provide abstraction for the function and block
 *     scope.
 *
 * @author rezae, ahmad hussein  
 *     It extends Scope interface
 * @see Scope It contains contextual information for the function and 
 *     block scope. Only one class is implementing this class.
 * @see FunctionScopeImpl
 */
public interface FunctionScope extends Scope {

    /**
     *.
     * It will set the return type for the current function scope
     *
     * @param returnType returnType
     */
    void setReturnType(Type returnType);

    /**
     * .
     * It will return returnType of current function scope
     *
     * @return Type Type
     */
    Type getReturnType();

    /**
     *.
     * It will set the type of a varible called THIS.
     *
     * @param thisType thisType
     */
    void setThisType(Type thisType);

    /**
     *.
     * It will return type of This variable
     *
     * @return Type Type
     */
    Type getThisType();
}
