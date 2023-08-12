
# Bridging in swift explanation using Dictionaries as an example

In Swift, the Dictionary type is bridged to Foundation's NSDictionary class, which means that Swift dictionaries can be seamlessly used with Objective-C code that expects an NSDictionary object.

When Swift was introduced, it aimed to provide interoperability with existing Objective-C code and frameworks. To achieve this, Swift's standard library includes a feature called "bridging" that allows certain Swift types to be automatically converted to their corresponding Objective-C types.

In the case of dictionaries, Swift's Dictionary type is bridged to Foundation's NSDictionary class, which is the equivalent dictionary class in Objective-C. This bridging allows you to pass Swift dictionaries to Objective-C APIs that expect an NSDictionary object as an argument, or receive an NSDictionary object from Objective-C code and use it as a Swift dictionary.

The bridging is performed automatically by the Swift compiler, so you don't need to explicitly convert between Swift dictionaries and NSDictionary objects in most cases. This seamless bridging makes it easier to work with Objective-C code and take advantage of existing frameworks and libraries while writing Swift code.


## Control Flow in swift

Swift provides a variety of control flow statements. These include while loops to perform a task multiple times; if, guard, and switch statements to execute different branches of code based on certain conditions; and statements such as break and continue to transfer the flow of execution to another point in your code. Swift provides a for-in loop that makes it easy to iterate over arrays, dictionaries, ranges, strings, and other sequences. Swift also provides defer statements, which wrap code to be executed when leaving the current scope

Swift’s switch statement is considerably more powerful than its counterpart in many C-like languages. Cases can match many different patterns, including interval matches, tuples, and casts to a specific type. Matched values in a switch case can be bound to temporary constants or variables for use within the case’s body, and complex matching conditions can be expressed with a where clause for each case.



## Dictionaries 

the contents of a Dictionary are inherently updated, adn iterating over them doesn;t guarantee the order in which they will be retrieved 



## Functions 

self contained chunks of code that perform specific tasks 


## Closures 

Self contained blocks of functionality that can be used in your code 

Global and nested functions, as introduced in Functions, are actually special cases of closures. Closures take one of three forms:

Global functions are closures that have a name and don’t capture any values.

Nested functions are closures that have a name and can capture values from their enclosing function.

Closure expressions are unnamed closures written in a lightweight syntax that can capture values from their surrounding context.


Closure Expression Syntax

Closure expression syntax has the following general form:

{ (<#parameters#>) -> <#return type#> in
   <#statements#>
}

As an optimization, Swift may instead capture and store a copy of a value if that value isn’t mutated by a closure, and if the value isn’t mutated after the closure is created.

Swift also handles all memory management involved in disposing of variables when they’re no longer needed.



## Enumeration 

An enumeration defines a common type for a gorup of related va;ue and enables you to work with those values in a type safe way within your code 

Swift enumeration cases don’t have an integer value set by default, unlike languages like C and Objective-C. In the CompassPoint example above, north, south, east and west don’t implicitly equal 0, 1, 2 and 3. Instead, the different enumeration cases are values in their own right, with an explicitly defined type of CompassPoint.


## Structures and Classes 

Structures and classes are general-purpose, flexible constructs that become the building blocks of your program’s code. You define properties and methods to add functionality to your structures and classes using the same syntax you use to define constants, variables, and functions.

## Properties 

Properties associate values with a particular class, structure, or enumeration. Stored properties store constant and variable values as part of an instance, whereas computed properties calculate (rather than store) a value. Computed properties are provided by classes, structures, and enumerations. Stored properties are provided only by classes and structures.

## Are property Wrappers Similar to decoprators in other languages ?

Yes, property wrappers in Swift and decorators in other programming languages serve similar purposes in terms of modifying or extending the behavior of properties or variables. However, there are some differences in how they are implemented and used.

Property wrappers in Swift were introduced in Swift 5.1 and provide a way to encapsulate the behavior of getting and setting property values. They allow you to define custom logic that is applied to a property's value before it's stored or retrieved. Property wrappers are often used to add additional functionality, validation, or transformation to properties.

Decorators, on the other hand, are a design pattern found in many programming languages, particularly in languages like Python and Java. Decorators are used to dynamically add behaviors or responsibilities to objects or functions. They are typically applied to functions or methods and can modify the behavior of those functions by wrapping them with additional functionality.

While the concepts are similar in that they both involve modifying or enhancing the behavior of properties or functions, the implementation details and syntax can vary significantly between languages. In Swift, property wrappers are specifically designed to work with properties, and they are applied using a special syntax above the property declaration. Decorators in other languages are more general and can be applied to functions, methods, classes, or even individual objects.

In summary, property wrappers in Swift and decorators in other languages share a common goal of enhancing the behavior of properties and functions, but they are implemented differently and have distinct syntax and use cases.


## Type Properties 

Instance properties are properties that belong to an instance of a particular type. Every time you create a new instance of that type, it has its own set of property values, separate from any other instance.

You can also define properties that belong to the type itself, not to any one instance of that type. There will only ever be one copy of these properties, no matter how many instances of that type you create. These kinds of properties are called type properties.
