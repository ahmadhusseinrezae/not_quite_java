package analysis.symboltable;

import analysis.typeinfo.*;
import notquitejava.ast.NQJVarDecl;

/**
 * Scope class provides abstract view for all scopes in program. 
 *
 * @author rezae, ahmad hussein  
 *     We have two scope type in program: Class Scope which contians 
 *     all contextual information exist in a scope of a class including: 
 *     class declaration, class name, extended classes, field information, 
 *     function declarations
 *
 * @see ClassScope 
 *     Function Scope which contains contextual information 
 *     for each block in a class or function
 *
 * @see FunctionScope
 */
public interface Scope {

    /**
     *.
     * lookupVar will lookup for varible with same name as passed to 
     *     function inside the current scope
     *
     * @param varUse, it is a target type which will be passed to be compared.
     *
     * @return FieldInfo, it is the result of lookup. It can be null 
     *     or an instance of FieldInfo
     *
     * @see FieldInfo
     *     for concrete implementation
     *
     * @see ClassScope
     *
     * @see FunctionScope
     */
    FieldInfo lookupVar(String varUse);

    /**
     *.
     * It will create a new Field Info instance for the new Var and 
     *     add it into current scope.
     *
     * @param varName It is the name of new Var. It is a String
     *
     * @param type It is the type of new Var.
     *
     * @see Type
     *
     * @param var It is the varible declaration for new Var.
     *
     * @see NQJVarDecl
     */
    void putVar(String varName, Type type, NQJVarDecl var);

    /**
     *.
     * It will make a copy of current scope. It will be used inside 
     *     Analyze class when it will enter into new block scope, 
     *     so it needs to have a copy of all varibles defined in parent 
     *     block scope
     *
     */
    Scope copy();
}
