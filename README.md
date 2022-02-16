# not_quite_java compiler
It is a simple compiler for a subset of language java called not_quite_java. Its code will be runnable by JVM.


## Analysis
Under the Analysis phase, we tried to cover several topics such as:

- Name Analysis
We need to have records of available and visible variables, classes, and functions for name analysis.

- Field visibility
At any point in the program, a field will be visible if its name is inside the scope’s registered field names.

- Field name uniqueness
When putting a new variable in each scope, we check if the field name is unique

- Overloading
A class can have multiple function declarations with the same name and different parameter lists and types.

- Overriding
A class that extends some other class can have a function with the same signature as functions in the superclass.

- Shadowing
We have two levels of shadowing,

-- A class has a field with the same name as its parent class’s field. It is called Hiding.

-- A block has a field with the same name as its parent class’s field. It is called Shadowing.

- Obscuring
A class may have a field with the same name as a class or a class function.

- Cycle conflict
It may happen if a class extends itself or another class that extends the first class.

-Name lookup
When a variable being used, we look if the variable is registered in the current scope.

## Type checking

For type checking phase we considered following topics: 

- Variable usage
We first check the current function or bracket scope for the given name of the used variable; if we found it, we will attach the declaration into the variable use expression.

- Field access
We will check if we have such a name registered in the current class at the time of field access.

- New object creation
We will check if the class type of new object exists and is registered in our name table.

- Function call
We first check if we have a class with the same name and signature in the current class scope or extended classes. If we found a matching function, we will attach the declaration to the function call. If not, we will check global functions for matching signatures.

- Method call
We first find the class type for the method’s caller. If we found a correct type for it in our name table, we will attach the declaration to it and check if we have a function with a matching signature inside its scope or its extended scopes.

- Assignment
We will find the type of right and left-hand side of the expression.
