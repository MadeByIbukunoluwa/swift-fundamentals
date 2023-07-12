


// for-In Loops 

let names = ["Anna", "Alex","Brian","Jack"]

for name in names {
    print("Hello, \(name)!")
}

let numberOfLegs = ["spider" : 8, "ant": 6, "cat":4]

for (animalName,legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}


// the sequence being iterated over is a range of numbers from 1 to 5 inclusive 
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

// if you don't need each value in a sequence you can ignore the values by using an nderscore in place of a variable 
let base = 3;
let power = 10;
var answer = 1

for _ in 1...power {
    answer *= base;
}

print("\(base) to the power of \(power)")

// Use the half-open range operator (..<) to include the lower bound but not the upper bound.

let minutes = 60;

for tickMark in 0..<minutes {
    print("\(tickMark)")
}

//Some users might want fewer tick marks in their UI. They could prefer one mark every 5 minutes instead. Use the stride(from:to:by:) function to skip the unwanted marks.

let hours = 12
let hourInterval = 3

for tickMark in stride(from:3,through: hours,by:hourInterval) {
     print("\(tickMark)")
}


//The examples above use a for-in loop to iterate ranges, arrays, dictionaries, and strings. However, you can use this syntax to iterate any collection, including your own classes and collection types, as long as those types conform to the Sequence protocol.


// while loop

let finalSquare = 25;
var board = [Int](repeating: 0, count: finalSquare + 1)

board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0
var diceRoll = 0

while square < finalSquare {
    diceRoll += 1

    if diceRoll == 7 {
        diceRoll = 1
    }

    square += diceRoll

    if square < board.count {
        square += board[square]
    }
}


print("Game over!")

//repeat while loop 
//The other variation of the while loop, known as the repeat-while loop, performs a single pass through the loop block first, before considering the loop’s condition. It then continues to repeat the loop until the condition is false.

// conditional statements 

var temperatureInFahrenheit = 30 
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf")
}

temperatureInFahrenheit = 40

if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf")
} else {
    print("It's not that cold.Wear a T-shirt")
}

temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a T-shirt.")
}

// swift provides a shorthand spelling of if that you can use when setting values 

let temperatureInCelsius = 25
var weatherAdvice:String = ""

if temperatureInCelsius <= 0 {
    weatherAdvice = "Its very cold.Consider wearing a scarf"
} else if temperatureInCelsius >= 30 {
    weatherAdvice = "It's really warm. Don't forget to wear sunscreen."
} else {
    weatherAdvice = "It's not that cold. Wear a T-shirt."
}


// Here, each of the branches sets a value for the weatherAdvice constant, which is printed after the if statement.

// Using the alternate syntax, known as an if expression, you can write this code more concisely:
//getting an error 
//consecutive statements on a line must be separated by ';' 
// let weatherAdvice = if temperatureInCelsius <= 0 {
//     "It's very Cold. Consider wearing a a scarf."
// } else if temperatureInCelsius >= 30 {
//     "It's really warm. Don't forget to wear sunscreen"
// } else {
//     "It's not that cold. Wear a T-shirt."
// }

print(weatherAdvice)


// All of the branches of an if expression need to contain values of the same type, because swift checks the type of each branch separately , values like nil that can be used with more than one type prevent Swift from determining the if expression's type automatically . Instead you ned to specify the type explicitly

// let freezeWarning : String? = if temperatureInCelsius <= 0 {
//     "It's below freezing. Watch for ice!"
// } else {
//     nil
// }


// let weatherAdvice = if temperatureInCelsius > 100 {
//     throw TemperatureError.boiling
// } else {
//     "its a reasonable temperature"
// }

//switch statement
let someCharacter:Character = "z"

switch someCharacter {
case "a":
    print("The first letter of the Latin alphabet")
case "z":
    print("The first letter of the Latin alphabet")
default:
    print("Some other character")
}

// like if statements swicth statemetns also have an expression frorm 

// let anotherCharacter:Character = "a" 
// let message = switch anotherCharacter {
// case "a":
//     "The first letter of the Latin alphabet"
// case "z" :
//     "The last letter of the Latin alphabet"
// default:
//     "Some other character"
// }

// print(message)


//note 
// In contrast with switch statements in C and Objective-C, switch statements in Swift don’t fall through the bottom of each case and into the next one by default. Instead, the entire switch statement finishes its execution as soon as the first matching switch case is completed, without requiring an explicit break statement. This makes the switch statement safer and easier to use than the one in C and avoids executing more than one switch case by mistake.

// you can make a switch with a single case that matches multiple conditions , that is a compound case 

let anotherCharacter:Character = "a" 
switch anotherCharacter {
    case "a", "A":
        print("The letter A")
    default :
        print("Not the letter A")
}

// interval matching
//values in switch cases can be checked for their inclusion in an interval 

let approximateCount = 62 
let countedThings = "moons orbiting saturn"
let naturalCount:String 

switch approximateCount {
    case 0:
        naturalCount = "no"
    case 1..<5:
        naturalCount = "a few"
    case 5..<12:
        naturalCount = "several"
    case 12..<100:
        naturalCount = "dozens of"
    case 100..<1000: 
        naturalCount = "hundreds of"
    default:
        naturalCount = "many"
}

print("There are \(naturalCount) \(countedThings)")




//Tuples
// you can also use tuples to test multiple values in switch statements
//Each element of the tuple can be tested against a different value or interval of values. Alternatively, use the underscore character (_), also known as the wildcard pattern, to match any possible value.

let somePoint = (1,1)

switch somePoint {
    case (0,0):
        print("\(somePoint) is at the origin")
    case (_,0):
        print("\(somePoint) is on the x-axis")
    case (0,_):
        print("\(somePoint) is on the y-axis")
    case (-2...2, -2...2):
        print("\(somePoint) is inside the box")
    default:
        print("\(somePoint) is outside of the box")
}

// value bindings 
// A switch case can name the value or value it matches to temporary constants or variables , for use in the body of the case. This behaviour is known as value binding , because the values are bound to temporaray constants or varibales within the case's body 

// The example below takes an (x, y) point, expressed as a tuple of type (Int, Int), and categorizes it on the graph that follows:

// let anotherPoint = (2,0)

// switch anotherPoint {
// case (let x,0):
//     print("on the x-axis with an x value of \(x)")
// case (0, let y):
//     print("on the y-axis with an x value of \(y)")
// case let(x,y):
//     print("somewhere else at ( \(x), \(y) )")
// }

//where 
// A switch case can use a where clause to check for additional conditions

// let yetAnotherPoint = (1, -1)
// switch yetAnotherPoint {
// case let (x, y) where x == y:
//     print("(\(x), \(y)) is on the line x == y")
// case let (x, y) where x == -y:
//     print("(\(x), \(y)) is on the line x == -y")
// case let (x, y):
//     print("(\(x), \(y)) is just some arbitrary point")
// }

// the final case matches all possible remaining values and so a default case isn't needed to make the switch statement exhaustive 

//Compound Cases
// multiple switch cases that share the same body can be combined by writing several patterns after case, with a comma between each of the patterns 
let someCharacter1:Character = "e"

switch someCharacter {
    case "a", "e", "i","o","u":
        print("\(someCharacter) is a vowel")
    case "b", "c", "d","f", "g", "h", "j", "k", "l", "m",
    "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
        print("\(someCharacter) is a consonant")
    default:
        print("\(someCharacter) isn't a vowel or a consonant")
}

// compund cases can also have value bindings 

let stillAnotherPoint = (9,0)

let invalidPoint = ("i",0)

//The case above has two patterns: (let distance, 0) matches points on the x-axis and (0, let distance) matches points on the y-axis. Both patterns include a binding for distance and distance is an integer in both patterns — which means that the code in the body of the case can always access a value for distance.

switch stillAnotherPoint {
    case (let distance, 0), (0, let distance) :
        print("On an axis, \(distance) from the origin")
    default : 
        print("Not on an axis")
}



// it can't even be matched the types are different 
// switch invalidPoint {
//     case (let distance, 0), (0, let distance) :
//         print("On an axis, \(distance) from the origin")
//     default : 
//         print("Not on an axis")
// }



//Control transfer statements 


let puzzleInput = "great minds think alike"
var puzzleOutput = ""

let charactersToRemove:[Character] = ["a", "e", "i", "o","u"]

for character in puzzleInput {
    if charactersToRemove.contains(character) {
        continue
    }
    puzzleOutput.append(character)
}

print(puzzleOutput)

// break 
// the break statement ends execution of an entire control flow statement immediately 
// it can be used in a switch or loop statement 
// in a loop statement , it ends the loops execution immediately and transfers control to the code after the loop's closing brace 
// in a switch statement it causes the switch statement to end its execution and transfers control to the code after the switch statement's closing brace 

let numberSymbol :Character = "三" 

var possibleIntegerValue:Int? 

switch numberSymbol {
    case "1", "١", "一", "๑":
        possibleIntegerValue = 1
    case "2", "٢", "二", "๒":
        possibleIntegerValue = 2
    case "3", "٣", "三", "๓":
        possibleIntegerValue = 3
    case "4", "٤", "四", "๔":
        possibleIntegerValue = 4
    default:
        break
}
// the break statement ends the switch statement's execution and continues frm the if let statement


if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue)")
} else {
    print("An integer value couldn't be found for \(numberSymbol)")
}

//fallthrough 
// in Swift, swicth statements don't fall through the bottom of each case and into the next one , that is , the entire switch statement completes its execution as soon as the first matching case is completed , by contrast , C requires you to insert an explicitbreak statement at the end of very switch case to prevent fallthrough Avoiding default fallthrough means that Swift switch statements are much more concise and predictable than their counterparts in C, and thus they avoid executing multiple switch cases by mistake. but if you need C style fallthrough behaviour then you can use the fallthrough keyword 

let integerToDescribe = 5 

var description = "The number \(integerToDescribe) is "

switch integerToDescribe {
    case 2,3,5,7,11,13,17,19 :
        description += " a prime number, and also"
    fallthrough
default:
    description += " an integer "
}

print(description)

// The fallthrough keyword doesn’t check the case conditions for the switch case that it causes execution to fall into. The fallthrough keyword simply causes code execution to move directly to the statements inside the next case (or default case) block, as in C’s standard switch statement behavior.

//labeled statemments 

//Early Exit 
// A guard statement , like an if statement , executes statements depending on the Boolean value of an expression 
// you use a guard statments to require that a condition must be true in order for the code after the guard statement to be executed , unlike an if statement, a guard statement always has an else clause 

func greet (person: [String:String]) {
    guard let name = person["name"] else {
        return
    }
    print ("Hello \(name) !")

    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return 
    }
    print("I hope the weather is nice in \(location)")
}


greet(person: ["name": "John"])

greet(person: ["name": "Jane", "location":"Cupertino"])

//Deferred Actions 
// unlike control flow constructs like if and while which let you control whether part of your code is executed or how many times it gets executed , defer controls when a piece of code is executed 
// you use defer block to write code that will be executed later , when your program reaches the end of the current scope 

var score = 1 

if score < 10 {
    defer {
        print(score)
    }
    score += 5 
}
// first the code in the if statement is run , which increments score by five , then , before exiting the if statement's scope , the defferd code is run , which prints score 

//The code inside of the defer always runs, regardless of how the program exits that scope. That includes code like an early exit from a function, breaking out of a for loop, or throwing an error. This behavior makes defer useful for operations where you need to guarantee a pair of actions happen — like manually allocating and freeing memory, opening and closing low-level file descriptors, and beginning and ending transactions in a database — because you can write both actions next to each other in your code.

var score1 = 3 
if score1 < 100 {
    score1 += 100 
    defer {
        score1 -= 100 
    }
    print(score1) // 103 
    // it will print 103 because 
}


// if you write more than one defer block in the same scope, the first one you specify is the last one to run 

var score2 = 4
if score2 < 10 {
    defer {
        print(score2)
    }
    defer {
        print("The score is:")
    }
    score2 += 5 
}


// if your program stops running , because of a runtime error or crash , deferred code doesn't execute 


//Checking API availability 
if #available(iOS 10, macOS 10.12, *) {
    print("available")
} else {
    print("unavailable")
}



@available(macOS 10.12, *) 
struct ColorPreference {
    var bestColor = "blue"
}

func chooseBestColor() -> String {
    guard #available(macOS 10.12, *) else {
        return "gray"
    }
    let colors = ColorPreference()
    return colors.bestColor
}

