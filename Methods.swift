// methods a re functions associated with a particular type 

// instance methods 
// instance methods are functions that belong to instances of a particular class, structure or enumeration 

// They support the functionality of theose instances either by providing ways to access and modify instance properties or by providing functionality related to the instance’s purpose.

class Counter {
    var count = 0
    func increment() {
         count += 1
         print(count)
    }
    func increment(by amount: Int) {
        count += amount
        print(count)
    }
    func reset() {
        count = 0 
        print(count)
    }
}
let counter = Counter()

counter.increment()

counter.increment(by: 5)

counter.reset()

// every instance of a type has a property called self, which is exactly equivalent to the instance itself , you use the self property to refer to the current instance within its own instance methods 

// we could have use the increment method in the calss above like this 

// func increment () {
//     self.count += 1
// }

// most of te times you dont need to write self , swift assumes that you are referring to a property or method of the current instance whenever you use a known property or method name within a method, this main exception to this rule occurs when a parameter name for an instance method has the same name for a property of that instance 
// we use the self property to distinguish between a parameter name and the property name 

// struct Point {
//     var x = 0.0, y = 0.0
//     func isToTheRightOf(x:Double) -> Bool {
//         return self.x > x 
//     }
// }

// let somePoint = Point(x:4.0, y:5.0)
// if somePoint.isToTheRightOf(x:1.0) {
//     print("This point is to the right of the line where x == 1.0")
// }

// modifying value types from within instance methods 

// structures and enumerations are value types , by default , the properties of a value type can't be modified from within its instance methods , however , if you neeed to modify the proeprties of your structure or enumeration within a particular method , you can opt in to mutating behaviour for that method , the method can then mutate (change) its properties from within that method and any changes that it makes are written back to the original structure when the method ends 

// the method can also assign a completely new isntance to its self property and this new instance will replace the existing one when the method ends 

// you can opt into this behaviour by placing the muatating keyword before the func keyword for that method 

// struct Point {
//     var x = 0.0, y = 0.0 
//     mutating func moveBy(x deltaX:Double, y deltaY: Double ) {
//         x += deltaX
//         y += deltaY
//     }
// }

// var somePoint = Point(x: 1.0, y: 1.0)
// somePoint.moveBy(x: 2.0, y: 3.0)
// print("The point is now at (\(somePoint.x), \(somePoint.y))")

//The Point structure above defines a mutating moveBy(x:y:) method, which moves a Point instance by a certain amount. Instead of returning a new point, this method actually modifies the point on which it’s called.

// you can't call a mutating method on a constant of structure , because its properties can't be changed even though its variable properties 

// it gives an error 
// error: cannot use mutating member on immutable value: 'somePoint' is a 'let' constant
// somePoint.moveBy(x: 2.0, y: 3.0)
// let somePoint = Point(x: 1.0, y: 1.0)
// somePoint.moveBy(x: 2.0, y: 3.0)
// print("The point is now at (\(somePoint.x), \(somePoint.y))")

// Assigning to self within a mutating method 

// mutating methods can assign an entirely new instance to the implicit self property 
// the Point example could have been written in the following way instead 

struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX:Double, y deltaY:Double) {
        self = Point(x: x + deltaX, y: y + deltaY)
    }
}

// mutating methods for enumerations can set the implicit self parameter to be a different case from the same enumeration 

enum TriStateSwitch {
    case off,low, high 
    mutating func next() {
        switch self {
            case .off:
                self = .low
            case .low:
                self = .high
            case .high:
                self = .off
        }
    }
}

var ovenLight = TriStateSwitch.low
ovenLight.next()
ovenLight.next()


// Type methods 
//Instance methods, as described above, are methods that you call on an instance of a particular type. You can also define methods that are called on the type itself. These kinds of methods are called type methods. You indicate type methods by writing the static keyword before the method’s func keyword. Classes can use the class keyword instead, to allow subclasses to override the superclass’s implementation of that method.

class SomeClass {
    class func someTypeMethod() {
        // type method implementation goes here
    }
}
SomeClass.someTypeMethod()

// Within the body of a type method, the implicit self property refers to the type itself, rather than an instance of that type. This means that you can use self to disambiguate between type properties and type method parameters, just as you do for instance properties and instance method parameters.


struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1

    static func unlock(_ level:Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    static func isUnlocked(_ level:Int) -> Bool {
        return level <= highestUnlockedLevel
    }

    @discardableResult
    mutating func advance(to level:Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        }
        else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Argyrios")
player.complete(level: 1)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")


player = Player(name: "Beto") 
if player.tracker.advance(to: 6) {
    print("player is now on level 6")
} else {
    print("level 6 hasn't yet been unlocked")
}