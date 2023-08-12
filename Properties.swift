// this describes a range of integers whose range length can't be changed after it has been created 
struct FixedLengthRange {
    var firstValue:Int
    let length:Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)

rangeOfThreeItems.firstValue = 6

// you will get a error if you try to reassign it
//cannot assign to property: 'length' is a 'let' constant 

// rangeOfThreeItems.length = 9 

// print(rangeOfThreeItems.length)


//If you create an instance of a structure and assign that instance to a constant, you can’t modify the instance’s properties, even if they were declared as variable properties:

//This behavior is due to structures being value types. When an instance of a value type is marked as a constant, so are all of its properties.

//Lazy stored properties 
// A lazy stored property is a property whose initial value isn’t calculated until the first time it’s used. You indicate a lazy stored property by writing the lazy modifier before its declaration.

//You must always declare a lazy property as a variable (with the var keyword), because its initial value might not be retrieved until after instance initialization completes. Constant properties must always have a value before initialization completes, and therefore can’t be declared as lazy.

//Computed Properties 
// classes , structures and enumerations can defie computed properties , which don;'t acctually store a value , instead , they provide a getter and an optional setter  to retrieve and set other properties and values indirectly 

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size() 
    var center:Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.x + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0, y: 0), size: Size(width: 10.0, height: 10.0))

let initialSquareCenter = square.center
// initialSquareCenter is at (5.0, 5.0)
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
// Prints "square.origin is now at (10.0, 10.0)"



//Shorthand Getter Declaration
// If the entire body of a getter is a single expression, the getter implicitly returns that expression. Here’s an another version of the Rect structure that takes advantage of this shorthand notation and the shorthand notation for setters:

struct CompactRect {
    var origin = Point()
    var size = Size() 
    var center:Point {
        get {
            Point(x:origin.x + (size.height / 2), y: origin.x + (size.width / 2))
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

//Read only computed properties 
// A computed property with a getter but no setter , ypou must declare them as variable properties with the var keyword , because their value isnt fixed 

// here the struct cuboid has three properties , width, height and depth , and it has a read only computed property called volume 

//It doesn’t make sense for volume to be settable, because it would be ambiguous as to which values of width, height, and depth should be used for a particular volume value. 

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume:Double {
        return width * height * depth
    }
}

let fourbyFiveByTwo = Cuboid(width: 4.0, height:5.0, depth:2.0)

print("the volume of fourByFiveByTwo is \(fourbyFiveByTwo.volume)")



//Property Observers
// They observe and respond to changes in a property's value 
// Property observers are called every time a property’s value is set, even if the new value is the same as the property’s current value.

//You have the option to define either or both of these observers on a property:

// willSet is called just before the value is stored.

// If you implement a willSet observer, it’s passed the new property value as a constant parameter. You can specify a name for this parameter as part of your willSet implementation. If you don’t write the parameter name and parentheses within your implementation, the parameter is made available with a default parameter name of newValue.

// didSet is called immediately after the new value is stored.


class StepCounter {
    var totalSteps:Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter = StepCounter()

stepCounter.totalSteps = 200
// About to set totalSteps to 200
// Added 200 steps
stepCounter.totalSteps = 360
// About to set totalSteps to 360
// Added 160 steps
stepCounter.totalSteps = 896
// About to set totalSteps to 896
// Added 536 steps

//A property wrapper adds a layer of separation betwwen code that manages how a property is stored and the code that defines a property 
//When you use a property wrapper, you write the management code once when you define the wrapper, and then reuse that management code by applying it to multiple properties.
//The setter ensures that new values are less than or equal to 12, and the getter returns the stored value.

@propertyWrapper 

struct TwelveOrLess {
    private var number = 0
    var wrappedValue:Int {
        get {
            return number
        } set {
            number = min(newValue, 12)
        }
    }
}

struct SmallRectangle {
    @TwelveOrLess var height 
    @TwelveOrLess var width 
}

var rectangle = SmallRectangle()

print(rectangle.height)

rectangle.height = 10 

print(rectangle.height)

rectangle.height = 24 

print(rectangle.height)

//When you apply a wrapper to a property, the compiler synthesizes code that provides storage for the wrapper and code that provides access to the property through the wrapper. (The property wrapper is responsible for storing the wrapped value, so there’s no synthesized code for that.) You could write code that uses the behavior of a property wrapper, without taking advantage of the special attribute syntax. For example, here’s a version of SmallRectangle from the previous code listing that wraps its properties in the TwelveOrLess structure explicitly, instead of writing @TwelveOrLess as an attribute:

//The _height and _width properties store an instance of the property wrapper, TwelveOrLess. The getter and setter for height and width wrap access to the wrappedValue property.


struct SmallRectangle1 {
    private var _height = TwelveOrLess()
    private var _width = TwelveOrLess()

    var height:Int {
        get {
            return _height.wrappedValue
        }
        set {
            _height.wrappedValue = newValue
        }
    }
    var width:Int {
        get {
            return _width.wrappedValue
        }
        set {
            _width.wrappedValue = newValue
        }
    }
}


var rectangle1 = SmallRectangle1()

print(rectangle1.height)

rectangle1.height = 10 

print(rectangle1.height)

rectangle1.height = 24 

print(rectangle1.height)


//Setting initial values for wrapped properties

// Here’s an expanded version of TwelveOrLess called SmallNumber that defines initializers that set the wrapped and maximum value:

@propertyWrapper 
struct SmallNumber {
    private var maximum:Int 
    private var number:Int 

    var wrappedValue:Int {
        get {return number}
        set { number = min(newValue,maximum)}
    }
    init() {
        maximum = 12
        number = 0
    }
    init(wrappedValue:Int){
        maximum = 12
        number = min(wrappedValue,maximum)
    }
    init(wrappedValue:Int,maximum:Int){
        self.maximum = maximum
        number = min(wrappedValue,maximum)
    }
}

struct ZeroRectangle {
    @SmallNumber var height:Int 
    @SmallNumber var width:Int 
}

var zeroRectangle = ZeroRectangle()


print(zeroRectangle.height,zeroRectangle.width)

// when you specify an initial value for the property, Swift uses the init(wrappedValue:) initializer to set up the wrapper

struct UnitRectangle {
    @SmallNumber var height:Int = 1
    @SmallNumber var width:Int = 1
}

var unitRectangle = UnitRectangle()

print(unitRectangle.height, unitRectangle.width)

// When you write arguments in parentheses after the custom attribute, Swift uses the initializer that accepts those arguments to set up the wrapper. For example, if you provide an initial value and a maximum value, Swift uses the init(wrappedValue:maximum:) initializer:

struct NarrowRectangle {
    @SmallNumber(wrappedValue: 2, maximum: 5) var height : Int
    @SmallNumber(wrappedValue: 3, maximum: 4) var width : Int
}

var narrowRectangle = NarrowRectangle()


//When you include property wrapper arguments, you can also specify an initial value using assignment. Swift treats the assignment like a wrappedValue argument and uses the initializer that accepts the arguments you include. For example:


struct MixedRectangle {
    @SmallNumber var height:Int = 1
    @SmallNumber(maximum:9) var width:Int = 2 
}

var mixedRectangle = MixedRectangle()

print(mixedRectangle.height)

mixedRectangle.height = 20

print(mixedRectangle.height)


//Projecting a value from a property wrapper 
//In addition to the wrapped value, a property wrapper can expose additional functionality by defining a projected value — for example, a property wrapper that manages access to a database can expose a flushDatabaseConnection() method on its projected value. The name of the projected value is the same as the wrapped value, except it begins with a dollar sign ($). Because your code can’t define properties that start with $ the projected value never interferes with properties you define.



@propertyWrapper
struct SmallNumber1 {
    private var number:Int
    private(set) var projectedValue:Bool

    var wrappedValue:Int {
        get {return number}
        set {
            if newValue > 12 {
                number = 12
                projectedValue = true 
            } else {
                number = newValue
                projectedValue = false 
            }
        }
    }
    init() {
        self.number = 0 
        self.projectedValue = false
    }
}

struct SomeStructure {
    @SmallNumber1 var someNumber:Int 
}

var someStructure = SomeStructure()

someStructure.someNumber = 4

print(someStructure.someNumber)

someStructure.someNumber = 55
print(someStructure.$someNumber)

enum Size1 {
    case small,large 
}

struct SizedRectangle {
    @SmallNumber1 var height:Int 
    @SmallNumber1 var width:Int 

    mutating func resize(to size:Size1) -> Bool {
        switch size {
        case .small:
            height = 10
            width = 20
        case .large:
            height = 100
            width = 100
        }
        return $height || $width 
    }
}


// Type properties 

// these exmaples are for read-only computed type properties 

struct SomeStructure1 {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}
class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

// Type properties are queried and set with dot syntax, just like instance properties. However, type properties are queried and set on the type, not on an instance of that type. 

print(SomeStructure1.storedTypeProperty)
// Prints "Some value."
SomeStructure1.storedTypeProperty = "Another value."
print(SomeStructure1.storedTypeProperty)
// Prints "Another value."
print(SomeEnumeration.computedTypeProperty)
// Prints "6"
print(SomeClass.computedTypeProperty)
// Prints "27"


struct AudioChannel {
    static let thresholdLevel = 10 
    static var maxInputLevelForAllChannels = 0

    var currentLevel:Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel  {
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7 
print(leftChannel.currentLevel)
//Prints 7 
print(AudioChannel.maxInputLevelForAllChannels)
//Prints 7 

rightChannel.currentLevel = 11

print(rightChannel.currentLevel)

// Prints "10"
print(AudioChannel.maxInputLevelForAllChannels)
// Prints "10"
