package analysis.typeinfo.nonPrimativeTypes;

import analysis.symboltable.ClassScope;
import analysis.typeinfo.*;
import java.util.ArrayList;

/**
 *.
 * ClassType class represent class type in program and contain all
 *     contextual information for its object
 *
 * @author rezae, ahmad hussein  
 *     It represent contextual information in two components
 *     1- class_scope, it has information about methods, and fields
 *
 * @see class_scope 
 *     2- extended_classes, it represents all class types for extended 
 *     classes which each one has its own contextual information for 
 *     particular class
 * 
 * @see extended_classes
 */
public class ClassType extends Type {

    /**
     *.
     * class_scope contains information including: class declaration, 
     *     class name, extended classes, field information, function 
     *     declarations
     *
     * @see ClassScope
     */
    public ClassScope class_scope;

    /** 
     *.
     * extended_classes contains class types for all classes that 
     *     current class extends them */
    public ArrayList<ClassType> extended_classes;

    /**
     *.
     * the default value for extended classes is empty list at this 
     *     point since an instance of this class with be generated 
     *     at time when analyzer start making singiture of each class.
     *
     * @param class_contxt it is an initial contextual information which 
     *     will be passed when analyzer start analyzing classes
     */
    public ClassType(ClassScope class_contxt) {
        this.class_scope = class_contxt;
        this.extended_classes = new ArrayList<>();
    }

    /**
     *.
     * It is implementation of isSubtypeOf method of abstract Type class. 
     *     It will check whether the target type is classType or Empty 
     *     type Then it will check whether target type is equal to current 
     *     type or one of its extending classes or their extended classes It 
     *     will call isSubtypeOf for each classes of its extended classes to 
     *     check each node of its inheratance tree
     *
     * @param other
     *
     * @return boolean is result of comparison
     */
    @Override
    public boolean isSubtypeOf(Type other) {
        if (other instanceof ClassType) {
            ClassType ct = (ClassType) other;
            if (ct == this) {
                return true;
            }
            for (ClassType extended : extended_classes) {
                if (extended.isSubtypeOf(other)) {
                    return true;
                }
            }
        }
        return other == SpecialType.EMPTY;
    }

    /** 
     *.
     * @return String It is name of class with an .class extension */
    @Override
    public String toString() {
        return class_scope.getClassName() + ".class";
    }

    /**
     *.
     *
     * @return ClassScope It is an instance of ClassScope which contains 
     *    all contextual information for the object.
     *
     * @see ClassScope
     */
    public ClassScope getClassScope() {
        return class_scope;
    }

    /**
     *.
     * It will take an instance of ClassType and add it into 
     *     list of extended classes
     *
     * @param ct It is an instance of ClassType
     *
     * @see ClassType
     */
    public void addClassExtend(ClassType ct) {
        if (!extended_classes.contains(ct)) {
            extended_classes.add(ct);
        }
    }

    /**
     *.
     * It will return list of extended classes
     *
     * @return ArrayList  It is list of extended classes
     */
    public ArrayList<ClassType> getClassExtended() {
        return extended_classes;
    }
}
