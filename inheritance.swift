

class Vehicle {
    var currentSpeed = 0.0
    var description : String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise(){}
}

let someVehicle = Vehicle()

print("Vehicle: \(someVehicle.description)")


//subclassing - basing a new class on an existing class 

class Bicycle : Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()

bicycle.hasBasket = true


bicycle.currentSpeed = 15.0 

print("Bicycle: \(bicycle.description)")


//Subclasses can themselves be subclassed. The next example creates a subclass of Bicycle for a two-seater bicycle known as a “tandem”:


class Tandem : Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()

tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0 

print("Tandem: \(tandem.description)")

// Overriding
// A subclass can provide its own custom implementation of an instance method, type method, instance property, type property, or subscript that it would otherwise inherit from a superclass. This is known as overriding.

// To override a characteristic that would otherwise be inherited, you prefix your overriding definition with the override keyword. Doing so clarifies that you intend to provide an override and haven’t provided a matching definition by mistake. Overriding by accident can cause unexpected behavior, and any overrides without the override keyword are diagnosed as an error when your code is compiled.

class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}

let train = Train()
train.makeNoise()


// Overriding Properties in page link
// You can override an inherited instance or type property to provide your own custom getter and setter for that property, or to add property observers to enable the overriding property to observe when the underlying property value changes.

// Overriding Property Getters and Setters in page link
// You can provide a custom getter (and setter, if appropriate) to override any inherited property, regardless of whether the inherited property is implemented as a stored or computed property at source. The stored or computed nature of an inherited property isn’t known by a subclass — it only knows that the inherited property has a certain name and type. You must always state both the name and the type of the property you are overriding, to enable the compiler to check that your override matches a superclass property with the same name and type.

// You can present an inherited read-only property as a read-write property by providing both a getter and a setter in your subclass property override. You can’t, however, present an inherited read-write property as a read-only property.



class Car:Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()   
car.currentSpeed = 25.0 
car.gear = 3

print("Car: \(car.description)")



// Overriding Property Observers in page link
// You can use property overriding to add property observers to an inherited property. This enables you to be notified when the value of an inherited property changes, regardless of how that property was originally implemented. For more information on property observers, see Property Observers.

// Note

// You can’t add property observers to inherited constant stored properties or inherited read-only computed properties. The value of these properties can’t be set, and so it isn’t appropriate to provide a willSet or didSet implementation as part of an override.

// Note also that you can’t provide both an overriding setter and an overriding property observer for the same property. If you want to observe changes to a property’s value, and you are already providing a custom setter for that property, you can simply observe any value changes from within the custom setter.


class AutomaticCar: Car {
     override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")


//Preventing overrides 
//You can prevent a method, property, or subscript from being overridden by marking it as final


