
struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name :String?
}

let someResolution = Resolution()

let someVideoMode = VideoMode()


// access properties using dot syntax
print("The width of someResolution is \(someResolution)")

// access subproperties
print("The width os someVideoMode is \(someVideoMode.resolution.width)")


someVideoMode.resolution.width = 1280

print("The width of someVideoMode is now \(someVideoMode.resolution.width)")

//Memberwise initializers for Structure Types 

let vga = Resolution(width: 640, height: 480)

// Structres and Enumerations are value types 
//A value type is a type whose value is copied when it’s assigned to a variable or constant, or when it’s passed to a function.

let hd = Resolution(width: 1920, height: 1080)

var cinema = hd

cinema.width = 2048

print("cinema is now \(cinema.width) pixels width")

print("hd is still \(hd.width) pixels width")


enum CompassPoint {
    case north,south,east,west 
    mutating func turnNorth() {
        self = .north 
    }
}

var currentDirection = CompassPoint.west

let rememberedDirection = currentDirection

currentDirection.turnNorth()

print("The current direction is \(currentDirection)")

print("The remembered direction is \(rememberedDirection)")


//classes are reference types 

//Unlike value types, reference types are not copied when they’re assigned to a variable or constant, or when they’re passed to a function. Rather than a copy, a reference to the same existing instance is used.

let tenEighty = VideoMode()

tenEighty.resolution = hd

tenEighty.interlaced = true 

tenEighty.name = "1080i"

tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty 
alsoTenEighty.frameRate = 30.0

// Because classes are reference types, tenEighty and alsoTenEighty actually both refer to the same VideoMode instance. Effectively, they’re just two different names for the same single instance,


print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")


//identity operators 

// equal to ==
// equal in value 
// identical to  ===
// Identical to means that two constants or variables of class type refer to exactly the same class instance.
// not identical to !== 


if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}

