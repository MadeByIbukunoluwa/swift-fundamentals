


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


// All of the branches of an if expression need to contain values of the same type, because swift checks the type of each branch separately , values like nil that can be used with more than one type prevent Swift from determining the if expression's type automaticaly . Instead you ned to specify the type explicitly

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
// you can also use tuples to test multiple values in swicht statements
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
// A swithc case can name the value or value it matches to temporary constants or variables , for use in the body of the case. This behaviour is known as value binding , because hte values are bound to temporaray constants or varibales within the case's body 

// The example below takes an (x, y) point, expressed as a tuple of type (Int, Int), and categorizes it on the graph that follows:

let anotherPoint = (2,0)

switch anotherPoint {
case (let x,0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with an x value of \(y)")
case let(x,y):
    print("somewhere else at ( \(x), \(y) )")
}

