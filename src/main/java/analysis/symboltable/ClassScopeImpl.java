package analysis.symboltable;

import analysis.*;
import analysis.helper.Helper;
import analysis.typeinfo.*;
import java.util.*;
import notquitejava.ast.*;

/**
 * ClassScopeImpl class provide implementation for the class scope.
 *
 * @author rezae, ahmad hussein
 * @see ClassScope It contains contextual information for the class scope. Including:
 * @see className
 * @see classDecl
 * @see extendedClasses
 * @see fields
 * @see functions
 */
public class ClassScopeImpl implements ClassScope {

    /** It is instance of central component of analyze process which is Analysis. */
    private final Analysis analysis;

    /** It is name of class. */
    private final String className;

    /** It is class delaration for class. */
    private final NQJClassDecl classDecl;

    /**
     * It is map of extended classes for current class.
     * Is is a map of class name as key, and ClassScope of extended class
     *     as value Since name of class must be unique we 
     *     can safly use them as key
     */
    private final Map<String, ClassScope> extendedClasses = new HashMap<>();

    /**
     * It is map of fields for current class. 
     * Since the name of field regardless of its type must be unique in each class,
     *     we can safly use it as key in that map and 
     *     FieldInfo is the value
     */
    private final Map<String, FieldInfo> fields = new HashMap<>();

    /**
     * It is a map of function for current class.
     * It is a map from function name to map of all overloading functions 
     *     with same name. the map of overloading function will use unique 
     *     signiture of function as key and function declration as value. Example: 
     *     [SomeFunctionName,[ {SomeFunctionName_Int, SomeFunctionDeclrationInt} 
     *     {SomeFunctionName_Bool, SomeFunctionDeclrationBool}] ]
     */
    private final Map<String, Map<String, NQJFunctionDecl>> functions = new HashMap<>();

    /**
     * It is the default constructor for the ClassScope.
     *
     * @param name It is the class name
     *
     * @param analysis It is instance of core component of analysis process
     *
     * @param classDecl It is class declaration for the classScope
     */
    public ClassScopeImpl(String name, Analysis analysis, NQJClassDecl classDecl) {
        this.className = name;
        this.analysis = analysis;
        this.classDecl = classDecl;
    }

    /**
     * It checks existance of field in local class.
     * It checks if current class localy contains a 
     *     field with given name, it is not checking the super classes.
     *
     * @param varName It is the name of field
     * @return boolean it is the result of localy looking up for variable
     */
    @Override
    public boolean containsField(String varName) {
        if (fields.containsKey(varName)) {
            return true;
        }
        return false;
    }

    /**
     * It will add a new field to fields map .
     * It will add a new field to fields map of current class if that field does not 
     *     exist localy in current class. It may exist in super class but in that case 
     *     that fields will be hided by this field. It is only required to have a unique 
     *     field name in each scope like here class scope. After checking the uniquness of 
     *     field, it will create a FieldInfo for the new field and insert it into map.
     *
     * @param name It is the name of field to be inserted
     *
     * @param field It is the type of field.
     * @see Type Type
     *
     * @param varDecl It is the variable declaration for the field to be added
     */
    @Override
    public void putVar(String name, Type field, NQJVarDecl varDecl) {
        if (!fields.containsKey(name)) {
            fields.put(name, new FieldInfo(name, field, varDecl));
        }
    }

    /**
     * It will look in context for variable.
     * It will look in context for variable. It will firstly check the local class scope, 
     *     because of shadowing strategy, if there is any field with same name, it will 
     *     return that field. but If there is not any local definition for the field, it 
     *     will call the same function in each super class. If there is any, it will return 
     *     it, otherwise it will return null as an indication of not found.
     *
     * @param name It is name of field to be found out.
     * @return FieldInfo If it found the field name in entire scope, it will return fieldInfo 
     *     of that field, otherwise it will return null.
     */
    @Override
    public FieldInfo lookupVar(String name) {
        if (fields.containsKey(name)) {
            return fields.get(name);
        } else {
            for (ClassScope extended : extendedClasses.values()) {
                if (extended.lookupVar(name) != null) {
                    return extended.lookupVar(name);
                }
            }
            return null;
        }
    }

    /**
     * It will get a function name.
     * It will get a function name, then find map of overloaded functions for that function 
     *     name. If there is any, it will check whethere that map already has a function 
     *     signiture equal to new function, If there is not any similar function signiture, 
     *     it will add it If there not any map for the function name, It will create a new 
     *     function name and add it to map. It will be check for having same function signiture 
     *     as super class in case of overriding latter in process.
     *
     * @param funcName It is the name of function to be added.
     *
     * @param funcSign It is the unique function signiture generated by Helper class.
     *
     * @param func It is the function declaration for new function.
     */
    @Override
    public void addFunction(String funcName, String funcSign, NQJFunctionDecl func) {
        if (!functions.containsKey(funcName)) {
            HashMap<String, NQJFunctionDecl> overloadingFuncs = new HashMap<>();
            overloadingFuncs.put(funcSign, func);
            functions.put(funcName, overloadingFuncs);
        } else {
            Map<String, NQJFunctionDecl> overloadingFuncs = functions.get(funcName);
            if (!overloadingFuncs.containsKey(funcSign)) {
                overloadingFuncs.put(funcSign, func);
            } else {
                analysis.addError(func, "Function with same signature " 
                    + funcSign + " already exists.");
            }
        }
    }

    /**
     * It will get the function name.
     * It will get the function name and regenrate the signiture for that function and 
     *     look for it firstly, because of overriding, in local scope of class, if there 
     *     is not any function with same signiture, look for it in each super class.
     *
     * @param functionName It is the function name to be found.
     * 
     * @param args It is list of arguments of function to help to find the exact function 
     *     localy or in all parents.
     * @return NQJFunctionDecl It will be null if there is not any function with wanted 
     *     signiture or a function declaration if there is any.
     */
    @Override
    public NQJFunctionDecl getFunction(String functionName, NQJExprList args) {
        String finalName = functionName;
        if (functions.containsKey(finalName)) {
            Map<String, NQJFunctionDecl> overriddenFuncs = functions.get(functionName);
            for (NQJExpr arg : args) {
                Type argType = analysis.checkExpr(analysis.getCurrentFunctionScope(), arg);
                finalName += "_" + argType.toString();
            }
            return overriddenFuncs.get(finalName);
        } else {
            for (ClassScope extended : extendedClasses.values()) {
                NQJFunctionDecl extendedFunc = extended.getFunction(functionName, args);
                if (extendedFunc != null) {
                    return extendedFunc;
                }
            }
            return null;
        }
    }

    /**
     * It will take function name.
     * It will take function name and return list of overloading function for that name
     *
     * @param functionName it is the function name
     * @return Map [String, NQJFunctionDecl] It will be either null or map of overloaded 
     *     function for the functions This map will be from function signiture to function 
     *     declration.
     */
    @Override
    public Map<String, NQJFunctionDecl> getFunction(
            String functionName) { // only check function in current class not parent one
        String finalName = functionName;
        if (functions.containsKey(finalName)) {
            Map<String, NQJFunctionDecl> overriddenFuncs = functions.get(functionName);
            return overriddenFuncs;
        } else {
            return null;
        }
    }

    /**
     * It will get the function name.
     * It will get the function name and list of valid function signiture, then 
     *     look localy in function map, if there is any map for that function, 
     *     get that overloaded map for that function, and look if there exist at 
     *     least one of valid signiture. if there is any, it will return it. if
     *     there is not any, it will call the same function for all parents and it 
     *     will continue recursivly until it reachs the top of inheratance tree. if 
     *     there not any function with same sigiture, it will return null.
     *
     * @param functionName It is the function name to be found.
     *
     * @param functionSignitures It is list of valid function signitures. it will be 
     *     created by Helper function. Helper will simply look for each param of function, 
     *     and if that param is a class type, then will loop in its inheretance tree and 
     *     generate a function signiture for each class name in inheretance tree of param. 
     *     Example: class B{} class A extends B{} class C {
     *     func1(Class A). ------> func1_A.class , func1_B.class. }
     *
     * @param analysis It is an instance of core component of anaylsis process.
     * @return NQJFunctionDecl It will return null if it does not found any same function 
     *     signiture in class localy or in all inherantance tree.
     */
    @Override
    public NQJFunctionDecl checkGetFunction(
            String functionName, ArrayList<String> functionSignitures, Analysis analysis) {

        if (functions.containsKey(functionName)) { 
            Map<String, NQJFunctionDecl> overriddenFuncs = functions.get(functionName);
            for (NQJFunctionDecl funcInClass : overriddenFuncs.values()) {
                ArrayList<String> finalFuncNames =
                        Helper.makeParentFuncSignature(
                                funcInClass.getName(), funcInClass.getFormalParameters(), analysis);
                for (String callerMethodName : functionSignitures) {
                    if (finalFuncNames.contains(callerMethodName)) {
                        return funcInClass;
                    }
                }
            }
        }
        for (ClassScope extended : extendedClasses.values()) {
            NQJFunctionDecl extendedFunc =
                    extended.checkGetFunction(functionName, functionSignitures, analysis);
            if (extendedFunc != null) {
                return extendedFunc;
            }
        }
        return null;
    }

    /**
     * It will add a extended class. 
     * It will add a extended class with its contextual information which is 
     *     an instance of ClassScope to current class
     *
     * @param name It is the name of extended class
     *
     * @param classContx It is instance of classScope which has all information for extended class
     */
    @Override
    public void addExtendedClass(String name, ClassScope classContx) {
        if (!name.equals(className)) {
            extendedClasses.put(name, classContx);
        } else {
            analysis.addError(classDecl, "Class " + className + " is trying to extends itself.");
            throw new RuntimeException("Class " + className + " is trying to extends itself.");
        }
    }

    /**
     * It will get the extended class.
     * It will get the extended class name and return the classScope if it exist
     *
     * @param classNme It is the name of extended class
     * @return ClassScope It will be either null if current 
     *     class does not extend the param name or ClassScope of that param if 
     *     current class extend it.
     */
    @Override
    public ClassScope getExtendedClass(String classNme) {
        return extendedClasses.get(classNme);
    }

    /**
     * It will return map of extended classes.
     * It will return map of extended classes if there is any
     *
     * @return Map<String, ClassScope> It is a map of extended classes which is 
     *     from extended class name as key to extended ClassScope instance as value.
     */
    @Override
    public Map<String, ClassScope> getExtendedClasses() {
        Map<String, ClassScope> allExtendedClasses = extendedClasses;
        for (Map.Entry<String, ClassScope> scope : extendedClasses.entrySet()) {
            allExtendedClasses.putAll(scope.getValue().getExtendedClasses());
        }
        return allExtendedClasses;
    }

    /**
     * It will check the cycle inheretance.
     * It will check the cycle inheretance conflict in current class. It will call
     *     checkExtendedClasses with a simple map which initial has the current class 
     *     as only ancesstor
     *
     * @see checkExtendedClasses
     */
    @Override
    public void checkCycleConflict() {
        Map<String, ClassScope> ancesstor = new HashMap<>();
        ancesstor.put(className, this);
        checkExtendedClasses(ancesstor);
    }

    /**
     * It will get a map of ancesstors.
     * It will get a map of ancesstors, then it will loop into its extended classes 
     *     and check each one of them whether it exist inside ancesstors map it took 
     *     as parameter earlier. If ancesstors contains that entry, it will register 
     *     an error which indicate a cycle dependany. and it will throw an exception 
     *     because otherwise this dependancy will cause Stackoverflow problem which will 
     *     not be clear why it happend. If ancesstors does not contains that entry, it will 
     *     add that entry into ancesstors and call checkExtendedClasses from that entry 
     *     with that ancesstor map. It will recurrsivly continue until it reaches the 
     *     top of inheratance tree.
     *
     * @param ancesstors It is a map of ClassScopes which are ancesstors to current class.
     */
    @Override
    public void checkExtendedClasses(Map<String, ClassScope> ancesstors) {
        for (Map.Entry<String, ClassScope> scope : extendedClasses.entrySet()) {
            if (!ancesstors.containsKey(scope.getKey())) {

                ancesstors.put(scope.getKey(), scope.getValue());
                scope.getValue().checkExtendedClasses(ancesstors);
            } else {

                analysis.addError(
                        classDecl,
                        "Class "
                                + className
                                + " is trying to extends "
                                + scope.getKey()
                                + " which has a cycle dependency.");
                throw new RuntimeException(
                        "Class "
                                + className
                                + " is trying to extends "
                                + scope.getKey()
                                + " which has a cycle dependency.");
            }
        }
    }

    /**
     * It will return class declaration.
     * It will return class declaration for current class scope
     *
     * @return NQJClassDecl It is the class declaration for current class scope
     */
    @Override
    public NQJClassDecl getClassDecl() {
        return classDecl;
    }

    /**
     * It will return class name.
     *
     * @return String It is the name of class scope
     */
    @Override
    public String getClassName() {
        return className;
    }

    /**
     * It is the implementation for the copy function of abstract class Scope.
     *
     * @see Scope It will create a new ClassScopeImpl instance with its attributes.
     * @return ClassScope It is the newly created class scope object.
     */
    @Override
    public ClassScope copy() {
        return new ClassScopeImpl(className, analysis, classDecl);
    }
}
