
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
