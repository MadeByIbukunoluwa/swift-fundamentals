
// classes, structures and enumerations can define subscripts whihc are shortcuts for accessing the member elemenets in a collection , list or sequence , You use subscripts to set and retrieve values by index without needing separate methods for setting and retrieval



struct TimesTable {
    let multiplier:Int 
    subscript(index:Int) -> Int {
       return index * multiplier
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")


// swifts dictionary type implements a subscript to set and retrieve the values stores in a Dictionary instance 

var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
numberOfLegs["bird"] = 5

// A class or structure can provide as many subscript implementations as it needs, and the appropriate subscript to be used will be inferred based on the types of the value or values that are contained within the subscript brackets at the point that the subscript is used. This definition of multiple subscripts is known as subscript overloading.

struct Matrix {
    let rows:Int, columns: Int 
    var grid : [Double]
    init(rows:Int,columns:Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row:Int, column:Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns 
    }
    subscript(row:Int, column:Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(rows * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(rows * columns) + column] = newValue   
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)


// The example above creates a new Matrix instance with two rows and two columns. The grid array for this Matrix instance is effectively a flattened version of the matrix, as read from top left to bottom right




// Swift subscripts can be considered a form of operator overloading. Operator overloading in Swift allows you to define custom implementations for existing operators or create new operators for your types. Subscripts provide a convenient way to access elements in a collection, sequence, or list using subscript syntax, such as array[ index ] or dictionary[ key ].

// When you define a subscript in Swift, you are essentially overloading the subscript operator ([]) for instances of your type. You can provide different implementations for subscripts based on the type and number of parameters.

// Here's a simple example of subscript overloading in Swift:

// swift
// Copy code
// struct MyCollection {
//     var elements: [Int]

//     // Subscript for accessing elements by index
//     subscript(index: Int) -> Int {
//         get {
//             return elements[index]
//         }
//         set(newValue) {
//             elements[index] = newValue
//         }
//     }
// }

// var myCollection = MyCollection(elements: [1, 2, 3, 4, 5])

// // Using the subscript to get and set values
// let value = myCollection[2] // Accessing element at index 2
// print(value) // Output: 3

// myCollection[2] = 10 // Setting the value at index 2 to 10
// print(myCollection.elements) // Output: [1, 2, 10, 4, 5]
// In this example, the subscript allows you to use the [] syntax to access and modify elements in the MyCollection instance. This is a form of operator overloading specific to subscripts.


// Values in the matrix can be set by passing row and column values into the subscript, separated by a comma:

matrix[0, 1] = 1.5
matrix[1, 0] = 3.2

// let someValue = matrix[2,2]
// This triggers an assert, because [2, 2] is outside of the matrix bounds.

// Type subscripts 

// enum Planet : Int {
//     case mercury = 1,venus,earth,mars,jupiter, saturn , uranus, neptune 
//     static subscript(n:Int) -> Planet {
//         return Planet(rawValue: n)!
//     }
// }


// let mars = Planet[4]

// print(mars)