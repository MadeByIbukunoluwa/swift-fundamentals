
// https://docs.swift.org/swift-book/documentation/the-swift-programming-language/collectiontypes


// Swift provides three primary collection types, known as arrays, sets, and dictionaries, for storing collections of values. Arrays are ordered collections of values. Sets are unordered collections of unique values. Dictionaries are unordered collections of key-value associations.


// assign a colletion to a variable - mutable 
//assign a collection to a constant - immutable 



// creating an empty array 


var someInts : [Int] = []

print("someInts is of type [Int] with \(someInts.count) items")

someInts.append(3)

//creating an array with a Defualt value 


// You pass this initializer a default value of the appropriate type (called repeating): and the number of times that value is repeated in the new array (called count):


var threeDoubles = Array(repeating:0.0, count:3)

var anotherThreeDoubles = Array(repeating:2.5, count:3)

print(threeDoubles)

//creating an Array by adding two arrays together 


var sixDoubles = threeDoubles + anotherThreeDoubles


//Creating an array with array literal 

// shoppingList can be initialized with two initial items 
var shoppingList : [String] = ["Eggs", "Milk"]


// Accessing and modifying an array 
print("The shopping list contains \(shoppingList.count) items")


//checking if its empty 
if shoppingList.isEmpty {
    print("The shopping list is empty")
} else {
    print("The shopping list isn't empty")
}

// adding elements to an array 
shoppingList.append("Flour")

shoppingList += ["Baking Powder"]
// shoppingList now contains 4 items
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

// using array indexing 
var firstItem = shoppingList[0]

// using array indexing to replace array items 
shoppingList[0] = "Six eggs"

shoppingList[4...6] = ["Bananas", "Apples"]

//insert items 
shoppingList.insert("Maple Syrup", at:0)

print(shoppingList)

let mapleSyrup = shoppingList.remove(at: 0)

print(shoppingList)

// remove lastitem from the effort 

let apples = shoppingList.removeLast()

print(shoppingList)


//iterating over an array 

for item in shoppingList {
    print(item)
}


// if you need the integer index of each item as well as its value use the neumerated() to iterate over the array instead , for each item in the array , the enumerated() method returns a tuple composed of an integer and the item 


for (index,value) in shoppingList.enumerated() {
    print("Item \(index + 1 ) : \(value)")
}



//Sets 
// A set stores distinct values of the same type in a collection with no defined ordering.

// Hash Values for Set Types
// A type must be hashable in order to be stored in a set — that is, the type must provide a way to compute a hash value for itself. A hash value is an Int value that’s the same for all objects that compare equally, such that if a == b, the hash value of a is equal to the hash value of b.

//Creating and initializing an empty set

var letters = Set<Character>()

print("letters is of type Set<Character with \(letters.count) items")

letters.insert("a")

letters = []

// initializing a new set with an Array Literal 

// you can also remove the string generic tup[e as it can be inferred automatically
var favoriteGenres:Set<String> = ["Rock", "Classical", "Hip hop"]


// Accessing and modifying a Set 
// you access or modify a set through its methods and properties

print("I have \(favoriteGenres.count) favorite music genres")

if favoriteGenres.isEmpty {
    print("As far as music goes, i'm not picky")
} else {
    print("I have particular music preferences")
}

// insert an item into a set 
favoriteGenres.insert("jazz")

// remove an item 
// You can remove an item from a set by calling the set’s remove(_:) method, which removes the item if it’s a member of the set, and returns the removed value, or returns nil if the set didn’t contain it.

if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre) ? I'm over it")
} else {
    print("I never much cared for that")
}

// check whether a set contains a particular item 

if favoriteGenres.contains("Funk") {
    print("i GET UP ON THE GOOD FOOT")
} else {
    print("It's too funky in here")
 }


// iterating over a Set 

for genre in favoriteGenres {
    print("\(genre)")
}

// to iterate over the values of a set in a specific order , use the sorted() method

for genre in favoriteGenres.sorted() {
    print("\(genre)")
}

// performing set operations

// Fundamental set operations 

let oddDigits:Set = [1,3,5,7,9]

let evenDigits : Set = [0,2,4,6,8]

let singleDigitPrimeNumbers:Set = [2,3,5,7]

print(oddDigits.union(evenDigits).sorted())

print(oddDigits.intersection(evenDigits).sorted())

print(oddDigits.subtracting(singleDigitPrimeNumbers).sorted())

print(oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted())

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]


print(houseAnimals.isSubset(of:farmAnimals))

print(farmAnimals.isSuperset(of:houseAnimals))

print(farmAnimals.isDisjoint(with:cityAnimals))



// Dictionaries 

//A dictionary stores associations between keys of the same type and values of the same type in a collection with no defined ordering. Each value is associated with a unique key, which acts as an identifier for that value within the dictionary. Unlike items in an array, items in a dictionary don’t have a specified order. You use a dictionary when you need to look up values based on their identifier, in much the same way that a real-world dictionary is used to look up the definition for a particular word.

// You can also write the type of a dictionary in shorthand form as [Key: Value]

// Although the two forms are functionally identical, the shorthand form is preferred and is used throughout this guide when referring to the type of a dictionary.

// Creating an Empty Dictionary 

var namesOfIntegers:[Int:String] = [:]

// This example creates an empty dictionary of type [Int: String] to store human-readable names of integer values. Its keys are of type Int, and its values are of type String.

namesOfIntegers[16] = "sixteen"

namesOfIntegers = [:]

//Creating a Dictionary with a Dictionary literal 

//You can also initialize a dictionary with a dictionary literal, which has a similar syntax to the array literal seen earlier. A dictionary literal is a shorthand way to write one or more key-value pairs as a Dictionary collection.

// A key-value pair is a combination of a key and a value. In a dictionary literal, the key and value in each key-value pair are separated by a colon. The key-value pairs are written as a list, separated by commas, surrounded by a pair of square brackets:

var airports: [String:String] = ["YYZ": "Toronto Pearson", "DUB":"Dublin"]

// the airports dictionary is initialized with a dictionary literal containing two key value pairs . The first pair has a key of "YYZ" and a value of "Toronto Pearson". The second pair has a key of "DUB" and a value of "Dublin".

// Accessing and modifying a dictionary 

// checking the number of items in a dictionary 
print("The airports dictionary contains \(airports.count) items")

if (airports.isEmpty) {
    print("The airports dictionary is empty")
} else {
    print("The airports dictionary isn't empty")
}

// you can add a new item to the dictionry with the subscript syntax 

airports["LHR"] = "London"

// you can also use it to change the value associated with a particular key

airports["LHR"] = "London Heathrow"

// As an alternative to subscripting, use a dictionary’s updateValue(_:forKey:) method to set or update the value for a particular key. Like the subscript examples above, the updateValue(_:forKey:) method sets a value for a key if none exists, or updates the value if that key already exists. Unlike a subscript, however, the updateValue(_:forKey:) method returns the old value after performing an update. This enables you to check whether or not an update took place.


if let oldValue = airports.updateValue("Dublin Airport", forKey:"DUB") {
    print("The old value for DUB was \(oldValue)")
}

// you can alos use subscript syntax to retieve a value form the dictionary for a particular key. Because it’s possible to request a key for which no value exists, a dictionary’s subscript returns an optional value of the dictionary’s value type. If the dictionary contains a value for the requested key, the subscript returns an optional value containing the existing value for that key. Otherwise, the subscript returns nil:
if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName)")
} else {
    print("That airport isn't in the airports dictionary")
}

// you can use subscript syntax to remove a key value pair form a dictionary by assigning a value of nil for that key 

airports["APL"] = "Apple International"

airports["APL"] = nil 


// remove a key-value pair from a dictionary with the removeValue(forkey:) method. This method removes the key-value pair if it exists and returns the removed value or returns nil if no value existed 

if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary doesn't contain a value for DUB.")
}

// iterating over a dictionary 
// you can iterate over the key value pairs in a dictionary with a for -in loop Each item in the dictionary is returned as a (key, value) tuple, and you can decompose the tuple’s members into temporary constants or variables as part of the iteration:

for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

// You can also retrieve an iterable collection of a dictionary’s keys or values by accessing its keys and values properties:

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}
// Airport code: LHR
// Airport code: YYZ


for airportName in airports.values {
    print("Airport name: \(airportName)")
}

// If you need to use a dictionary’s keys or values with an API that takes an Array instance, initialize a new array with the keys or values property:

let airportCodes = [String](airports.keys)
// airportCodes is ["LHR", "YYZ"]


let airportNames = [String](airports.values)

