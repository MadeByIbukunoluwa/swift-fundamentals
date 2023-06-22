

// String literal 
let someStirng = "Some stirng literal value"


// Multiline String Literal


let quotation = """
    The white rabbit put on his spectacles.
    " Where shall i begin, please your majesty \ 
    yes and other things "
 """


 // multi line string literal that ends with a line feed 

 let lineBreaks = """

 This string starts with a line break. 
 It also ends with a line break.

 """

 // Special characters in String literals 

//  String literals can include the following special characters:

// The escaped special characters \0 (null character), \\ (backslash), \t (horizontal tab), \n (line feed), \r (carriage return), \" (double quotation mark) and \' (single quotation mark)

//An arbitrary Unicode scalar value, written as \u{n}, where n is a 1–8 digit hexadecimal number 

// template literals can contain special characters and also arbitrary unicode scalar value as \u{n} where n is a 1-8 hexadecimal number 

let wisewords = "\"Imagination is more important than knowledge\" - Einstein"

let dollarSign = "\u{24}"

let blackHeart = "\u{2665}"

let sparklingHeart = "\u{1F496}"

//initializing an empty string 

var emptyString = ""

var anotherEmptyStirng = String()


// check whether a string is empty 


if emptyString.isEmpty {
    print("Nothing to see here")
}


// String mutability 

var variableString = "Horse"

variableString += " and carriage "

// error - the stirng here is declared with let therefore it is not mutable 

let constantString = "Highlander"

// constantString += "and another Highlander"


// Swift’s String type is a value type. If you create a new String value, that String value is copied when it’s passed to a function or method, or when it’s assigned to a constant or variable. In each case, a new copy of the existing String value is created, and the new copy is passed or assigned, not the original version. 

for character in "Dog!🐶" {
    print(character)
}

let exclamationMark:Character = "!"

let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]

let catString = String(catCharacters)

print(catString)

// concatenating strings and characters 


let string1 = "hello"

let string2 = "   there"

var welcome = string1 + string2

var instruction = "look over"


// appending strings to string 

instruction += string2

//appending a character value to a string with the string types append method 

//You can’t append a String or Character to an existing Character variable, because a Character value must contain a single character only.

welcome.append(exclamationMark)

//String interpolation 

let multiplier = 3 
let message = "\(multiplier) times 2.5 is \(Double(multiplier)) * 2.5"

// You can use extended string delimiters to create strings containing characters that would otherwise be treated as a string interpolation


print(#"Write an interpolated string in Swift using \(multiplier)"#)


//unicode
// Unicode is an international standard for encoding, representing, and processing text in different writing systems. It enables you to represent almost any character from any language in a standardized form, and to read and write those characters to and from an external source such as a text file or web page.
//Behind the scenes, Swift’s native String type is built from Unicode scalar values. A Unicode scalar value is a unique 21-bit number for a character or modifier, such as U+0061 for LATIN SMALL LETTER A ("a"), or U+1F425 for FRONT-FACING BABY CHICK ("🐥").

// Every instance of Swift’s Character type represents a single extended grapheme cluster. An extended grapheme cluster is a sequence of one or more Unicode scalars that (when combined) produce a single human-readable character.

// Here’s an example. The letter é can be represented as the single Unicode scalar é (LATIN SMALL LETTER E WITH ACUTE, or U+00E9). However, the same letter can also be represented as a pair of scalars — a standard letter e (LATIN SMALL LETTER E, or U+0065), followed by the COMBINING ACUTE ACCENT scalar (U+0301). The COMBINING ACUTE ACCENT scalar is graphically applied to the scalar that precedes it, turning an e into an é when it’s rendered by a Unicode-aware text-rendering system.

// In both cases, the letter é is represented as a single Swift Character value that represents an extended grapheme cluster. In the first case, the cluster contains a single scalar; in the second case, it’s a cluster of two scalars:



let eAcute :Character = "\u{E9}"
let combinedEAcute:Character = "\u{65}\u{301}"

print(eAcute,combinedEAcute)

// Extended grapheme clusters are a flexible way to represent many complex single script achracters as a single Chracter value 
// For example, Hangul syllables from the Korean alphabet can be represented as either a precomposed or decomposed sequence. Both of these representations qualify as a single Character value in Swift:

let precomposed : Character = "\u{D55C}"

let decomposed : Character = "\u{1112}\u{1161}\u{11AB}"

print(precomposed,decomposed)

// Extended grapheme clusters enable scalars for enclosing marks (such as COMBINING ENCLOSING CIRCLE, or U+20DD) to enclose other Unicode scalars as part of a single Character value:

let enclosedEAcute:Character = "\u{E9}\u{20DD}"

//Unicode scalara for regional indicator symbols can be combiend in pairs to amke a single character value 

let regionalIndicatorForUS:Character = "\u{1F1FA}\u{F1F8}"

// Counting Charcters 
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"

print("unusualMenagerie has \(unusualMenagerie.count) characters")

