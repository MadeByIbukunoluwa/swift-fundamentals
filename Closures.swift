let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]


// The sorted(by:) method accepts a closure that takes two arguments of the same type as the array’s contents, and returns a Bool value to say whether the first value should appear before or after the second value once the values are sorted. The sorting closure needs to return true if the first value should appear before the second value, and false otherwise.

// This example is sorting an array of String values, and so the sorting closure needs to be a function of type (String, String) -> Bool.

// One way to provide the sorting closure is to write a normal function of the correct type, and to pass it in as an argument to the sorted(by:) method:

func backward(_ s1:String, _ s2:String) -> Bool {
    return s1 > s2
}

func forward(_ s1:String, _ s2:String) -> Bool {
    return s1 < s2
}

var reversedNames = names.sorted(by:backward)
var reversedNamesForward = names.sorted(by:forward)

print(reversedNamesForward)

//CLosure expression syntax , inline closure expression 

//Note that the declaration of parameters and return type for this inline closure is identical to the declaration from the backward(_:_:) function. In both cases, it’s written as (s1: String, s2: String) -> Bool. However, for the inline closure expression, the parameters and return type are written inside the curly braces, not outside of them.

// The start of the closure’s body is introduced by the in keyword. This keyword indicates that the definition of the closure’s parameters and return type has finished, and the body of the closure is about to begin.

var reversedNames1 = names.sorted(by: {(s1:String,s2:String) -> Bool in return s1 > s2})

// Inferring types from context 

var reversedNames2 = names.sorted(by:{s1,s2 in return s1 > s2})

// implicit returns
var reversedNames3 = names.sorted(by:{s1,s2 in s1 > s2})

//Shorthand argument names 

//If you use these shorthand argument names within your closure expression, you can omit the closure’s argument list from its definition. The type of the shorthand argument names is inferred from the expected function type, and the highest numbered shorthand argument you use determines the number of arguments that the closure takes.

var reversedNames4 = names.sorted(by:{$0 > $1})

// here $0 and $1 refers to the closures first and second string arguments 

//Operator methods 

//There’s actually an even shorter way to write the closure expression above. Swift’s String type defines its string-specific implementation of the greater-than operator (>) as a method that has two parameters of type String, and returns a value of type Bool. This exactly matches the method type needed by the sorted(by:) method. Therefore, you can simply pass in the greater-than operator, and Swift will infer that you want to use its string-specific implementation:


var reversedNames5 = names.sorted(by: >)


//Trailing Closure

//If you need to pass a closure expression to a function as the function’s final argument and the closure expression is long, it can be useful to write it as a trailing closure instead.


var reversedNames6 = names.sorted(){ $0 > $1}

//If a closure expression is provided as the function’s or method’s only argument and you provide that expression as a trailing closure, you don’t need to write a pair of parentheses () after the function or method’s name when you call the function:

var reversedNames7 = names.sorted { $0 > $1}


//closures with map method 
// we ill use the map method with a trailing closure to convert an array of Int values into an array 
// os String values

//The code above creates a dictionary of mappings between the integer digits and English-language versions of their names. It also defines an array of integers, ready to be converted into strings.

// You can now use the numbers array to create an array of String values, by passing a closure expression to the array’s map(_:) method as a trailing closure:


let digitNames = [
     0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]

let numbers = [98, 43, 510]

// the map method calls the closure expression once for each elemtn in the array 
//The call to the digitNames dictionary’s subscript is followed by an exclamation point (!), because dictionary subscripts return an optional value to indicate that the dictionary lookup can fail if the key doesn’t exist. In the example above, it’s guaranteed that number % 10 will always be a valid subscript key for the digitNames dictionary, and so an exclamation point is used to force-unwrap the String value stored in the subscript’s optional return value.

let strings = numbers.map{ (number) -> String in 
    var number = number 
    var output = ""

    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0 
    return output
}

print(strings)

//Capturing values 

// A closure can capture constants and variables from the surrounding context in 
// which it’s defined.

//In Swift, the simplest form of a closure that can capture values is a nested function, written within the body of another function. A nested function can capture any of its outer function’s arguments and can also capture any constants and variables defined within the outer function.



func makeIncrementer(forIncrement amount:Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)


print(incrementByTen())

print(incrementByTen())

print(incrementByTen())


// If you create a second incrementer , it will have its won stored reference to a new, separate runninTotal 
//variable

// in short, If you assign a closure to a property of a class instance, and the closure captures that instance by referring to the instance or its members, you will create a strong reference cycle between the closure and the instance. Swift uses capture lists to break these strong reference cycles.

let incrementBySeven = makeIncrementer(forIncrement: 7)

print(incrementBySeven())
// calling the original IncrementByTen again continues to increment its own runningTotal variabl and doesnt affect the variable captured by incrementBySeven
print(incrementByTen())

//Closures are reference types

//In the example above, incrementBySeven and incrementByTen are constants, but the closures these constants refer to are still able to increment the runningTotal variables that they have captured. This is because functions and closures are reference types.


//Whenever you assign a function or a closure to a constant or a variable , you are actually setting that constnat 
// or variable to be a reference to the functon or closure

//Escaping Closures 


// A closure is said to escape a function when the closure is passed as an argument to the function , but is called after the function returns  but is called after the function returns. When you declare a function that takes a closure as one of its parameters, you can write @escaping before the parameter’s type to indicate that the closure is allowed to escape.
// one way that a closure can be escaped is by being stored in a variable thats defined outside the function 



//Autoclosure 
//An autoclosure is a closure that's automatically created to wrap an expression that's being passed as an argument to a function. It doesn't take any arguments , and when it's called , it returns that value of the expression that's wrapped inside of it 

//An autoclosure lets you delay evaluation, because the code inside isn’t run until you call the closure. Delaying evaluation is useful for code that has side effects or is computationally expensive, because it lets you control when that code is evaluated. The code below shows how a closure delays evaluation.

var customersInLine = ["Chris", "Alex","Ewa", "Barry","Daniel"]

print(customersInLine.count)

let customerProvider = {customersInLine.remove(at:0)}

print(customersInLine.count)

print("Now serving \(customerProvider())")

print(customersInLine.count)

// Even though the first element of the customersInLine array is removed by the code inside the closure, the array element isn’t removed until the closure is actually called. If the closure is never called, the expression inside the closure is never evaluated, which means the array element is never removed. Note that the type of customerProvider isn’t String but () -> String — a function with no parameters that returns a string.
// You get the same behaviour when you pass a closure as an argument to a function 

func serve(customer customerProvider:() -> String)  {
    print("Now serving \(customerProvider)")
}

serve(customer: {customersInLine.remove(at: 0)})


func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider)")
}

serve(customer: customersInLine.remove(at: 0))

// auto closures that can escape 

