
# Bridging in swift explanation using Dictionaries as an example

In Swift, the Dictionary type is bridged to Foundation's NSDictionary class, which means that Swift dictionaries can be seamlessly used with Objective-C code that expects an NSDictionary object.

When Swift was introduced, it aimed to provide interoperability with existing Objective-C code and frameworks. To achieve this, Swift's standard library includes a feature called "bridging" that allows certain Swift types to be automatically converted to their corresponding Objective-C types.

In the case of dictionaries, Swift's Dictionary type is bridged to Foundation's NSDictionary class, which is the equivalent dictionary class in Objective-C. This bridging allows you to pass Swift dictionaries to Objective-C APIs that expect an NSDictionary object as an argument, or receive an NSDictionary object from Objective-C code and use it as a Swift dictionary.

The bridging is performed automatically by the Swift compiler, so you don't need to explicitly convert between Swift dictionaries and NSDictionary objects in most cases. This seamless bridging makes it easier to work with Objective-C code and take advantage of existing frameworks and libraries while writing Swift code.


## Control Flow in swift

Swift provides a variety of control flow statements. These include while loops to perform a task multiple times; if, guard, and switch statements to execute different branches of code based on certain conditions; and statements such as break and continue to transfer the flow of execution to another point in your code. Swift provides a for-in loop that makes it easy to iterate over arrays, dictionaries, ranges, strings, and other sequences. Swift also provides defer statements, which wrap code to be executed when leaving the current scope

Swift’s switch statement is considerably more powerful than its counterpart in many C-like languages. Cases can match many different patterns, including interval matches, tuples, and casts to a specific type. Matched values in a switch case can be bound to temporary constants or variables for use within the case’s body, and complex matching conditions can be expressed with a where clause for each case.



## Dictionaries 

the contents of a Dictionary are inherenetly updated, adn iterating over them doesn;t guarantee the order in which they will be retrieved 


