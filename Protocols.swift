
// the fullyNamed protocol requires a comforming typw to provide a fully qualified named , the protocol does not specify anythin g else about the nature of the conforming type 


struct Person : fullyNamed {
    var fullName:String 
}

let john = Person(fullName: "Mary trent")


// heres a more complex class , which also adopts and conforms to the FullyNamed protocol 


class Starship : FullyNamed {
    var prefix :String?
    var name:String 
    init(name:String, prefix:String? = nil) {
        self.name = name
        self.prefix = prefix 
    }

    var fullName:String {
        return (prefix != nil ? prefix! + " ": "") + name 
    }
}

var ncc1701 = Starship(name: "Enterprise", prefix:
 "USS")

//the class implements the fullName property requiremnet as a computed read only property for a starship . Each starship iinstance stores a mandatory name and an optional prefix. The fullName property uses the prefix value if it exists, and prepends it to the begnning of name to create a full name for the starship 

//Method requirements 

// a protcol with a single instance method requirement 

protocol RandomNumberGenerator {
    func random() -> Double
}


// a class that adopts and conforms to the RandomNumberGenerator protocol 

class LinearComgruentialGenerator : RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c)).truncatingRemainder(dividingBy: m)
        return lastRandom / m
    }
}

let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
// Prints "Here's a random number: 0.3746499199817101"
print("And another one: \(generator.random())")
// Prints "And another one: 0.729023776863283"


//Mutating method requirements 

// its sometimes necessary for a method to mutate the instance adn all the properties it belongs to , so to do that , we put the mutating func keyword in front of the func keyword 

// if you mark the protocl isntance method as mutating , you don;t need to write mutating for the implementation of that method for a class 

// the mutting keyowrd is only used by structs and enumerations 

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on 
    mutating func toggle() {
        switch self {
            case .off :
                self = .on 
            case .on:
                self = .off
        }
    }
}

var lightSwitch = OnOffSwitch.off 

lightSwitch.toggle()

// intializer requirements 
//Protocols can require speicific initializers to be implemented by conforming types 


protocol SomeProtocol {
    init(someparameters:Int) 
}

//Class implementation of Protocol initializer requirements 

class SomeClass : SomeProtocol {
    required init(someParameter:Int) {
        
    }
}

// If a subclass overrides a designated initializer from a superclass, and also implements a matching initializer requirement from a protocol, mark the initializer implementation with both the required and override modifiers:

protocol SomeProtocol {
    init()
}


class SomeSuperClass {
    init() {
        // initializer implementation goes here
    }
}


class SomeSubClass: SomeSuperClass, SomeProtocol {
    // "required" from SomeProtocol conformance; "override" from SomeSuperClass
    required override init() {
        // initializer implementation goes here
    }
}



// Falilable initializer requirements 

// protocols can define failable initializer requirements for conforming types 

//Protocols don't implement any functionality themselves , you can use a protocl as a type in your code 


//Delegation 

//delegation is a design pattern that enables a class or structure to hand off (or delegate) some of , this design pattern is implemented by defining a protocol that encapsulates the delegated responsibsilities , such that a conforming type (known as a delegate) is guaranteed to provide the functionality that has been delegated 

//Delegation can be used to respond to a particular action or to retrieve data from an external source without needing to know the underlying type of that source 


class DiceGame {
    let sides :Int 
    let generator = LinearComgruentialGenerator()
    weak var delegate : Delegate?

    init(sides:Int) {
        self.sides = sides 
    }

    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }

    func play(rounds:Int) {
        delegate?.gameDidStart(self)
        for round in 1...rounds {
            let player1 = roll() 
            let player2 = roll() 
            if player1 == player2 {
                delegate?.game(self, didEndRound: round, winner: nil)
            } else if player1 > player2 {
                 delegate?.game(self, didEndRound: round, winner: 1)
            } else {
                delegate?.game(self, didEndRound: round, winner: 2)
            }
        }
        delegate?.gameDidEnd(self)
    }

    protocol Delegate:AnyObject{
        func gameDidStart(_ game:DiceGame) 
        func game(_ game: DiceGame, didEndRound round :Int, winner:Int?)
        func gameDidEnd(_ game:DiceGame)
    }
}

// to prevent strong reference cycles , delegates are declared as weak references 

// This next example shows a class called DiceGameTracker, which adopts the DiceGame.Delegate protocol:


class DiceGameTracker : DiceGame.Delegate {
    var playerScore1 = 0
    var playerScore2 = 0
    func gameDidStart(_ game: DiceGame) {
        print("Started a new game")
        playerScore1 = 0
        playerScore2 = 0
    }
    func game(_ game: DiceGame, didEndRound round: Int, winner: Int?) {
        switch winner {
            case 1 :
                playerScore1 += 1 
                print("Player 1 won round \(round)")
            case 2 : 
                playerScore += 1
                print("Player 1 won round \(round)")
            default:
                print("The round was a draw")
        }
    }
    func gameDidEnd(_ game: DiceGame) {
        if playerScore1 == playerScore2 {
            print("The game ended in a draw.")
        } else if playerScore1 > playerScore2 {
            print("Player 1 won!")
        } else {
            print("Player 2 won!")
        }
    }
}

// The DiceGameTracker class implements all three methods that are required by the DiceGame.Delegate protocol. It uses these methods to zero out both players’ scores at the start of a new game, to update their scores at the end of each round, and to announce a winner at the end of the game.

// Here’s how DiceGame and DiceGameTracker look in action:

let tracker = DiceGameTracker()
let game = DiceGame(sides: 6)
game.delegate = tracker
game.play(rounds: 3)


// adding protocol conformance with an Extension 

// you can extend a newtype to confimrr to a procotl even if they do not have access to the source code to that type 

// they can add new properties , enums , methods to an existing type

protocol TextRepresentable {
    var textualDescription: String { get }
}


// we can extend the DIce class from above to adopt and conform to TextRepresentable

extension Dice:TextRepresentable {
    var textualDescription:String {
        return "A \(sides)-sided dice"
    }
}


let d12 = Dice(sides : 12 , generator: LinearComgruentialGenerator())

print(d12.textualDescription)


// conditionally conforming to a protocol

//a generic type may be able to satisfy the requreiments of a protocol only under certain conditions, such as whem type's generic parameter conforms to the protocolm 

extension Array : TextRepresentable where Element : TextRepresentable {
    var textualDescription: StrinG {
        let itemsAsText = self.map {
            $0.textualDescription
        }
        return "[" + itemsAsText.joined(separator: ", ") + "]"
    }  
}
    let myDice = [d6, d12]
    print(myDice.textualDescription)

//Declaring protocol adoption with an extension 

//if a type already conformed to all the requirements of a protocol, but hasn;t stated yet that it adopts that protocol, you can make it adopt the protocol with and empty extension 

struct Hamster {
    var name:String 
    var textualDescription:String {
        return "A hamster named \(name)"
    }
}
extension Hamster : TextRepresentable {}

let simonTheHamster = Hamster(name: "Simon")
let somethingTextRepresentable : TextRepresentable = simonTheHamster

print(somethingTextRepresentable.textualDescription)


//Note - Types don’t automatically adopt a protocol just by satisfying its requirements. They must always explicitly declare their adoption of the protocol.

//Adoptiing a protocol using a synthesized implementation

struct Vector3D : Equatable {
    var x = 0.0 , y = 0.0, z = 0.0 
}

let twoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
let anotherTwoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)

if twoThreeFour == anotherTwoThreeFour {
    print("These two vectors are also equivalent.")
}

enum SkillLevel : Comparable {
    case beginner 
    case intermediate 
    case expert(stars:Int)
}

var levels = [SkillLevel.intermediate, SkillLevel.beginner,
              SkillLevel.expert(stars: 5), SkillLevel.expert(stars: 3)]
for level in levels.sorted() {
    print(level)
}


// Collection of protocol Types 
// A protocol can be used as the type to be stored in a collection such as an array or a dictionary 

let things : [TextRepresentable] = [game, d12, simonTheHamster]

// we can now iterate over the items in the array and print each items textualDescription 

for things in things {
    print(thing.textualDescription)
}


//Protocol Inheritance 

// A protocol can inherit one or more protocols and can add further requirements on top of the requirement it inherits 

protocol InheritingProtocol: SomeProtocol, AnotherProtocol {
    // protocol definition goes here
}


protocol PrettyTextRepresentable : TextRepresentable {
    var PrettyTextRepresentable : String { get }
}

// you can limit protocl adoption to class types (and not structures and enumerations) by adding the AnyObject protocol to a protocol's inheritance list 

protocol SomeClassOnlyProtocol:AnyObject, SomeInheritedProtocol {

}

// use class only protocol when the behaviour defined by that protocol's requirements assumes or requires that a conforming type has reference semantics rather than value semantics 

//Protocol Composition 

// it may be useful to require a type to conform to multiple protocols at once 
// you can list as many protocl s as you want combining them with ampersand 
protocol Named {
    var named:String { get }
}


protocol Aged {
    var age : Int { get }
}

struct Person:Named,Aged {
    var name: String
    var age :Int
}

//any type that conforms to both Nmaed and Ages protocols 
func wishHappyBirthday(to celebrator:Named & Aged) {
    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
}

let birthdayPerson = Person(name: "Malcolm", age: 21)
wishHappyBirthday(to: birthdayPerson)


class Location {
    var latitude : Double 
    var longitude : Double 
    init(latitude: Double, longitude:Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

class City:Location , Named {
    var name : String 
    init(latitude: Double, longitude: Double) {
        self.name = name 
        super.init(latitude: latitude, longitude: longitude)
    }
}

func beginConcert(in location:Location & Named) {
    print("Hello, \(location.name)")
}


let seattle = City(name: "Seattle", latitude: 47.6, longitude: -122.3)
beginConcert(in: seattle)


//Checking for protocol conformance 
//you can use is and as operators used in type casting to check for protocl conformance 

// is returns boolean 

// as returns optional value 

protocol HasArea {
    var area: Double { get }
}

class Circle : HasArea {
    let pi = 2.1415927
    var radius : Double 
    var area: Double {return pi * radius * radius}
    init(area:Double) { self.area = area }
}

class Country: HasArea {
    var area: Double
    init(area:Double) { self.area = area }
}

class Animal {
    var legs : Int 
    init(leg:Int) { self.legs = legs }
}

let objects : [AnyObject] = [
    Circle(radius: 2.0),
    Country(area: 243_610),
    Animal(legs:4)
]

for object in objects {
    if let objectWithArea = object as? HasArea {
        print("Area is \(objectWithArea.area)")
    } else {
        print("SOmething that doesn't have an area")
        
    }
}


// whenever an Object conforms to the HasArea protocol it returns an Optional which is unwrapped
// to a constant called objectWithArea

//Optional Protocol Requirements 

// you can define optional requirements for protocols - these types don't have to be implemented by types that conform to the protocol

// they are prefixed by the optional modifier as part of the protocol's definition 

@objc protocol CounterDataSource {
    @objc optional func increment(forCount count:Int) -> Int 
    @objc optional var fixedIncrement: Int { get }
}

// the COunter class has an optional dataSource property of type CounterDataSource? 


//The increment() method first tries to retrieve an increment amount by looking for an implementation of the increment(forCount:) method on its data source. The increment() method uses optional chaining to try to call increment(forCount:), and passes the current count value as the method’s single argument.
class Counter {
    var count = 0
    var dataSource: CounterDataSource? 
    func increment() {
        if let amount = dataSource?.increment?(forCount: count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}


class ThreeSource: NSObject, CounterDataSource {
    let fixedIncrement = 3 
}

// we can use an instance of ThreeSource as the new data source for counter 

var counter = Counter()

counter.dataSource = ThreeSource()


for _ in 1...4 {
    counter.increment()
    print(counter.count)
    
}


//protocol Extensions 

// They allow you to define behaviour on protocols themselves , rather than in each type's individuals conformance or in a gloabl function 

// all conforming types automatically gain this method implementatiomn 
extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5 
    }
}

let generator = LinearComgruentialGenerator()

print("Heres a random number : \(generator.random())")

print("And here's a random Boolean ")


//Adding constraints to protocol extensions 

// When writing a protocol extenison , you can specify constraints that coforming types must satisfy before the methos and properties of the extension are available 

// for example, here we are creating an extension that wil only be available for types that conform to Equatable protocol 

extension Collection where Element : Equatable {
    func allEqual() -> Bool {
        for element in self {
            if element != self.first {
                return false 
            }
        }
        return true 
    }
}

let equalNumbers = [100, 100, 100, 100, 100]
let differentNumbers = [100, 100, 200, 100, 200]