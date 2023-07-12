
func greet(person:String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting 
}

print(greet(person:"Anna"))

print(greet(person:"Brian"))

func greetAgain(person:String) -> String {
    return "Hello again," + person + "!"
}

print(greetAgain(person: "Anna"))

// function with no input parameters 

func sayHelloWorld() -> String {
    return "hello world"
}

print(sayHelloWorld())


func greet1 (person:String,alreadyGreeted:Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    }
    else {
        return greet(person:person)
    }
}

print(greet1(person:"Tim",alreadyGreeted: true))



// functions withoue a defined return type return a special value of type Void 
func greet2(person:String) {
    print("Hello, \(person)!")
}



greet2(person:"Dave")



func printAndCount(string:String) -> Int {
    print(string)
    return string.count
}


// the return value of a function can be ignored when its called 
// but a function with a return type must return a value , otherwise it will result in a compile time error 

func printWithoutCounting(string:String) {
    let _ = printAndCount(string: string)
}

printAndCount(string: "hello, world")


printWithoutCounting(string: "hello, world")


// function with multiple return values 

func minMax(array:[Int]) -> (min:Int, max:Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value 
        }
    }
    return (currentMin,currentMax)
}

let bounds = minMax(array: [4,5,6,1,-9,345,1])
print("min is \(bounds.min) and max is \(bounds.max)")

//Optional return tuple types 
// If the tuple type to be returned from a function has the potential to have "no value" for the entire tuple , you canuse optional tuple return type to reflect the fact that the entire tuple can be nil. You can write an optional tuple return type by placing a question mark after the tuple's type closing parenthesis eg (Int,Int)? 

// Note
// An optional tuple type such as (Int, Int)? is different from a tuple that contains optional types such as (Int?, Int?). With an optional tuple type, the entire tuple is optional, not just each individual value within the tuple.

// to handle an empty array , write the minMax(array:) function with an optional tuple return type and return a value of nil when the array is empty 

func minMax1(array:[Int]) -> (min:Int, max:Int)? {
    if array.isEmpty {return nil}
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }   
    }
    return (currentMin,currentMax)
}


// if let bounds = minMax(array: [8,-6,2,109,3,71]) {
//     print("min is \(bounds.min) and max is \(bounds.max)")
// }

//functions with an implicit return 
// if the entire body is a single expression , the function implicitly returns that expression . 
func greeting(for person: String) -> String {
    "Hello, " + person + "!"
}

print(greeting(for:"Dave"))


func anotherGreeting(for person:String) -> String {
    return "Hello, " + person + "!"
}

print(anotherGreeting(for: "Dave"))

// function Argument labels and parameter names 
// Each function parameter has both an argument label and a parameter name. The argument label is used when calling the function; each argument is written in the function call with its argument label before it. The parameter name is used in the implementation of the function. By default, parameters use their parameter name as their argument label.

func greet(person:String, from hometown:String) -> String {
    return "Hello \(person)! Glad you could visit from \(hometown)"
}

print(greet(person: "Bill", from: "Cupertino"))

// The use of argument labels can allow a function to be called in an expressive, sentence-like manner, while still providing a function body that’s readable and clear in intent.


//Omitting argument labels 
// If you don't want an argument label for a parameter , write an underscore (_) instead of an explicit argument label for that parameter 


//Default parameter values 
// assign a value to the parameter after the paramater type 
func dothis(parameter1:String = "hi") {
    print(parameter1)
}

dothis()

//variadic parameters 
//variadic parameters accept zero or more values of the same type 
// The values passed to a variadic parameter are made available within the ufnctions body as an array of the appropriate type 

func arithmeticMean(_ numbers:Double...)-> Double {
    var total:Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

arithmeticMean(1,2,4,5,5,3,2,2,3,34,4,4,4)

arithmeticMean(9.33,6.55,9.234,6,92)


//inout paramters 
//Function parameters are constants by default. Trying to change the value of a function parameter from within the body of that function results in a compile-time error. This means that you can’t change the value of a parameter by mistake. If you want a function to modify a parameter’s value, and you want those changes to persist after the function call has ended, define that parameter as an in-out parameter instead.

//You can only pass a variable as the argument for an in-out parameter. You can’t pass a constant or a literal value as the argument, because constants and literals can’t be modified. You place an ampersand (&) directly before a variable’s name when you pass it as an argument to an in-out parameter, to indicate that it can be modified by the function.

func swapTwoInts(_a:inout Int, _ b:inout Int) {
    let temporaryA = a 
    a = b 
    b = temporaryA
}


var someInt = 3

var anotherInt = 107 

swapTwoInts(_a: &someInt, b: &<anotherInt>)

print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

//Function types 