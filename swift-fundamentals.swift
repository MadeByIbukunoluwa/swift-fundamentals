

//Constants and variables 

let maximumNumberOfLoginAttempts = 10

var currentLoginAttempt = 0

var x = 0.0, y = 0.0, z = 0.0;

var welcomeMessage: String

welcomeMessage = "Hello"


var red,green,blue: Double


let π = 3.14159

let 你好 = "你好世界"
let 🐶🐮 = "dogcow"

var friendlyWelcome = "Hello!"

friendlyWelcome = "Bonjour"


//Unlike a variable, the value of a constant can't be changed after its set 

// A compile time error will set in , change let to var to make it mutable 
// let languageName = "Swift"

// languageName = "Swift++"

print(friendlyWelcome)


// String interpolation 

print("The current value of friendlyWelcome is \(friendlyWelcome)")

//Multiiline comments 
/* 9 to 5 isn't an 
option */


//Nested Multiline Comments 

/* This is the start of the first multiline comment    
            /* This is the second nested multi line comment  */    
  */

let cat = "🐱"; print(cat);



//Integer bounds 

let minValue = UInt8.min; print(minValue) // the minumum value representation of an 8-bit unsigned integer 
let maxValue = UInt8.max; print(maxValue) // the maximum value representation of an 8-bit unsigned integer 


//Numeric literals 

let decimalInteger = 17;
let binaryInteger = 0b10001;
let octalInteger = 0o21
let hexadecimalIntger = 0x11

// Numeric literals can contain extra formatting to make them easier to read 
// Both integers and floats can be padded with extra zeros and can contain underscores to help with readability , neither of all these type of formatting affect eh underlying value of the literal 


let paddedDouble = 0013.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

//Numeric Type Conversion
//Integer conversion 

// let cannotBeNegative:Uint8 = -1 
// UInt8 can't store negative numbers , so this will report an error
// let tooBig: Int8 = Int8.max + 1 
// Int8 cant store a number integer larger than its maximum value, and so this would alaso report an error

// To convert one specific number type to another, you initialize a new number of the desired type with the existing value.
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1 
let twoThousandAndOne = twoThousand + UInt16(one)

//Integer and Floating point conversion 

let three = 3 
let pointOneFourFiveNine = 0.14159
let pi = Double(three) + pointOneFourFiveNine


//Floating point to integer conversion must also be made explicit 
let integerPi = Int(pi)


//Floating point values are a;ways truncated when use to initialize a new intger value in this wasy 


//Type aliases define an alternative name for an exosting type  , you can define it with a typealias keyword 

typealias AudioSample = UInt16

//Once you define a typealias , you can use a typealias anywhere you might use the original name 
var maxAmplitudeFound  = AudioSample.min 

//Her AudioSmaple is an alias for UInt16 ,because it is an alias the call to AudioSample.min actually calls UInt16.min, which provides an initial value of 0 for the maxAmplitudeFound variable 



//In swift Boolean types are bool 
// We can see how boolean values are useful when you are working with boolean values
let orangesAreOrange = true
let turnipsAreDelicious = false 

if turnipsAreDelicious {
    print("Mmm, tasty turnips")
} else {
    print("Eww turnips are horrible")
}


// let i = 1

// if i {

// }


//Tuples 
let http404Error = (404, "Not Found")

//you can decompose a tuple's contents into separate constants or variables 
let (statusCode, statusMessage) = http404Error

print("The status code is \(statusCode)")

print("The status code is\(statusMessage)")


//if you only need one of the tuples values ignore parts of the tuple with an underscore (_)

let (justTheStatusCode,_) = http404Error 
print("The status code is \(justTheStatusCode)")

//Alterntively , we can access the individual element values in a tuple using index numbers starting at zero 
print("the status code is \(http404Error.0)")
print("the status message is \(http404Error.1)")


let http200Status = (statusCode:200, description:"OK")

print("The status code is \(http200Status.statusCode)")
print("The status code is \(http200Status.description)")


//Optionals


let possibleNumber = "123"

let convertedNumber = Int(possibleNumber)


// you can set an optional variable to a valueless state by assigning it the special value nil

var serverResponse:Int? = 404

serverResponse = nil

//if you define an optional variable without providing a default value the variable is automatically set to nil for you 

var surveyAnswer:String? 


if convertedNumber != nil {
    print("comvertedNumber contains some integer value \(convertedNumber!)")
}


//Optional binding 
var actualNumber = 34
if let actualNumber = Int(possibleNumber) {
    print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("The string \"\(possibleNumber)\" couldn't be converted to an integer")
}

