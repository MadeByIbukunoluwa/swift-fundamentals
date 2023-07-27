

// tha values defined in this enum are its enumeration cases 
enum CompassPoint {
    case north
    case south 
    case east
    case west
}

enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

// each enumeration defines as a new type 
// give enumeratiom types singular rather than plural names 

var directionToHead = CompassPoint.west

directionToHead = .east

directionToHead = .south 

// you can match individual enum values with a switch statement 

// switch directionToHead {
// case .north:
//     print("Lots of planets have a north")
// case .south:
//     print("Watch out for penguins")
// case .east:
//     print("Where the sun rises")
// case .west:
//     print("Where the skies are blue")
// }

let somePlanet = Planet.earth

switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
}

//The syntax used in the examples above marks the enumeration as conforming to the CaseIterable protocol

// iterating over enumeration Cases 
enum Beverage:CaseIterable {
    case coffee, tea, juice 
}
// we write Beverage.allCases to access a collection that contains all of the cases of the Beverage Enumeration 
let numberOfChoices = Beverage.allCases.count 
print("\(numberOfChoices) beverages available")


for beverage in Beverage.allCases {
    print(beverage)
}

// Associated Value 
// It can be useful to store values of other types alongside the case values, this additional values is called an associated value 


enum BarCode {
    case upc(Int,Int,Int,Int)
    case qrCode(String)
}

var productBarcode = BarCode.upc(8, 85909, 51226, 7)

productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

// you can extract assocaited values as constants
switch productBarcode {
    case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
    case .qrCode(let productCode) :
        print("QR code:\(productCode)")
}

// if all the associated value in an enumertion switch case are extracted as constants , you can place a single let statement 



switch productBarcode {
    case let .upc ( numberSystem,  manufacturer,  product,  check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
    case let .qrCode( productCode) :
        print("QR code:\(productCode)")
}

//  Raw values 


// enumeration cases can come prepopulated with default values (raw values)

enum ASCIIControlCharacter:Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

// Raw values are not the same as associated values. Raw values are set to prepopulated values when you first define the enumeration in your code, like the three ASCII codes above. The raw value for a particular enumeration case is always the same. Associated values are set when you create a new constant or variable based on one of the enumeration’s cases, and can be different each time you do so.

//Implicitly assigned raw values 
// When you're working wth enumerations that store integer or string raw values, you don't have to explicitly assign a raw value for each case , when you don't swift will assign the values for you 

enum Planet1 :Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

// Planet.mercury has an explict value of 1 , Planet.venus has an implicit value of 2 , and so on 

print(Planet1.mercury, Planet1.venus)


// when strings are used, for raw values, the implicit value for each case is the text of that case's name 

enum CompassPoint1 :String {
    case north, south,east, west
}


// you can access the raw value of an enumeration using the rawValue property 

let earthsOrder = Planet1.earth.rawValue

let sunsetDirection = CompassPoint1.west.rawValue

print(earthsOrder,sunsetDirection)


// initializing from a raw value 

let possible = Planet1(rawValue:7)

// Note
// The raw value initializer is a failable initializer, because not every raw value will return an enumeration case


let positionToFind = 11
if let somePlanet = Planet1(rawValue:positionToFind) {
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}

// This example uses optional binding to try to access a planet with a raw value of 11. The statement if let somePlanet = Planet(rawValue: 11) creates an optional Planet, and sets somePlanet to the value of that optional Planet if it can be retrieved. In this case, it isn’t possible to retrieve a planet with a position of 11, and so the else branch is executed instead.

//Recursive Enumerations 
// A recursive enumeration is an enumeration that has another instance of the enumeration as the associated value for one or more of the enumeration classes 

// you indicate that an enumeration case is recursive by writing indirect before it 

// enum ArithmeticExpression {
//     case number(Int)
//     indirect case addition(ArithmeticExpression , ArithmeticExpression)
//     indirect case multiplication(ArithmeticExpression,ArithmeticExpression)
// }

// You can also write indirect before the beginning of the enumeration to enable indirection for all of the enumeration’s cases that have an associated value:


indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression , ArithmeticExpression)
    case multiplication(ArithmeticExpression,ArithmeticExpression)
}


// This enumeration can store three kinds of arithmetic expressions: a plain number, the addition of two expressions, and the multiplication of two expressions. The addition and multiplication cases have associated values that are also arithmetic expressions 

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five,four)

let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression:ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))