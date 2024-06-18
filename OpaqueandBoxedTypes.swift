

//two ways to hide details about a value's type - opaque types and boxed protocol types , hiding type information is useful at boundaries between a module and caode that calls into the module , because the underlying type of the return value can reamin private 


protocol Shape {
    func draw() -> String 
}

struct Triangle:Shape {
    var size :Int 
    func draw() -> String {
        var result : [String] = []
        for length in 1...size {
            result.append(String(repeating: "*", count: length))
        }
        return result.joined(separator: "\n")
    }
}

let smallTriangle = Triangle(size: 3)

print(smallTriangle.draw())


// we can use generics to implement operations like flippng a shape vertically, as shown in the code below but theres a limitation to it , the flipped result exposes the exact generic types that were used to create it 

struct FlippedShape<T: Shape> :Shape {
    var shape :T 
    func draw() -> String {
        let lines = shape.draw().split(separator: "\n")
        return lines.reversed().joined(separator: "\n")
    }   
}

let flippedTriangle = FlippedShape(shape: smallTriangle)

print(flippedTriangle.draw())



// This approach to defining a JoinedShape<T: Shape, U: Shape> structure that joins two shapes together vertically, like the code below shows, results in types like JoinedShape<Triangle, FlippedShape<Triangle>> from joining a triangle with a flipped triangle.

struct JoinedShape<T:Shape , U : Shape>: Shape {
    var top : T
    var bottom : U 
    func draw() -> String {
        return top.draw() + "\n" + bottom.draw()
    }
}

let joinedTriangles = JoinedShape(top:smallTriangle, bottom: flippedTriangle)

print(joinedTriangles.draw())

// THis ledas to us exposing detailed information about the creation of the shape that aren;t meant to be part fo the ASCII module's public interface and leaking out because we need to state the full return type 

//Wrapper types like JoinedShape and FlippedShape don;t matter to the module's users and they shouldn;t be visible 

// The module's public interface consists of operations like joining and flipping a shape and these operations return another shape value 

//RETURNING AN OPAQUE TYPE 


// you can think of an opaque type as being the reverse of a generic type 

// Generic type allows the code that calls a function pick the type for a functions parameter and return the vlaue in a way that's abstracted ro the function implementation 

//eg, here the types of T for x and y depends on the caller 
// func max<T>(_ x : T,_ y :T) -> T where T: Comparable {...}

// the roles are reversed for a fucntion with an Opaque return type, the opaque type lets the function implementation pick the type for the value it returns in a way that's abstracted away from the code that calls the function 

struct Square : Shape {
    var size :Int 
    func draw() -> String {
        let line = String(repeating: "*", count: size)
        let result = Array<String>(repeating: line, count: size)
        return result.joined(separator: "\n")
    }
}


func makeTrapezoid() -> some Shape {
    let top = Triangle(size: 2)
    let middle = Square(size: 2)
    let bottom = FlippedShape(shape: top)
    let trapezoid = JoinedShape(top: top, bottom: JoinedShape(top: middle, bottom: bottom))
    return trapezoid
}

let trapezoid = makeTrapezoid()
print(trapezoid.draw())

// The makeTrapezoid() function in this example declares its return type as some Shape; as a result, the function returns a value of some given type that conforms to the Shape protocol, without specifying any particular concrete type. Writing makeTrapezoid() this way lets it express the fundamental aspect of its public interface — the value it returns is a shape — without making the specific types that the shape is made from a part of its public interface. This implementation uses two triangles and a square, but the function could be rewritten to draw a trapezoid in a variety of other ways without changing its return type.

//This example highlights that an opaque return type is like the reverse of a generic type 

// you can also combine opaque return types with generics 

func flip<T:Shape>(_ shape: T) -> some Shape {
    return FlippedShape(shape: shape)
}

func join<T:Shape, U:Shape>(_ top: T, _ bottom:U) -> some Shape {
    JoinedShape(top: top, bottom: bottom)
}

let opaqueJoinedTriangles = join(smallTriangle, flip(smallTriangle))
print(opaqueJoinedTriangles.draw())


// if a fucntion with an opaque type returns in mutiple places then all the possibel return valeus must have the same type 
// for a generic fn , the generic types must be one letter - representing a single type 

// this is onvalid coe - this violates the requirement of only returning one type - to fix this we will move the special cases fot the squares into the implemntation of fFlippedShape 

// func invalidFlip<T:Shape>(_ shape:T) -> some Shape {
//     if shape is Square {
//         return shape
//     }
//     return FlippedShape(shape: shape)
// }

struct FlippedShape<T:Shape> :Shape {
    var shape : T
    func draw() -> String {
        if shape is Square {
            return shape.draw()
        }
        let lines = shape.draw().split(separator: "\n")
        return lines.reversed().joined(separator: "\n")
    }
}

// the requirment to return a single type does not prevent from using generics in an opaque return type , her eis an example of a function that incorporates its type parameter into the underlying type of the value ot returns 


func `repeat`<T:Shape>(shape: T, count :Int) -> some Collection {
    return Array<T>(repeating: shape, count:count)
}

// the return value always has the underlying type of [T] so it follows the requirement of functions with opaque return types only returning value of a single type 

//Boxed protocol types 

// A boxed protocl type is also called an existential type , which comes from the phrase "there exists a type T such that T conforms to a protocol "

// if you want to make a boxed protocol type, write "any" before the name of a protocol

struct VerticalShapes : Shape {
    var shapes : [any Shape]
    func draw() -> String {
        return shapes.map { $0.draw()}.joined(separator: "\n\n")
    }   
}

let largeTriangle = Triangle(size: 5)
let largeSquare = Square(size: 5)
let vertical = VerticalShapes(shapes: [largeTriangle,largeSquare])


// In this case, a boxed protocol type is the only approach that let clallers of VerticalShapes mix different kinds of shapes together 


// you can  use an as cast when you know the underlying type of a boxed value 

if let downcastTriangle = vertical.shapes[0] as? Triangle {
    print(downcastTriangle.size)
}


//Difference between Opaque Types and Boxed Protocol Types 

//  An opaque type refers to one specific type, although the caller of the function isn’t able to see which type; a boxed protocol type can refer to any type that conforms to the protocol. Generally speaking, boxed protocol types give you more flexibility about the underlying types of the values they store, and opaque types let you make stronger guarantees about those underlying types.

func protoFlip<T:Shape>(_ shape: T) -> Shape {
    return FlippedShape(shape:shape)
}
