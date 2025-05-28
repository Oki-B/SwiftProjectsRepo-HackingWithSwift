// DAY 1 PART 1

// How to create variables and constans
var greeting = "Hello, playground"

var name = "Oki"
name = "Okay"
name = "Ok"

let character = "Owkay"

var playerName = "Oki"
print(playerName)

playerName = "Ok"
print(playerName)

playerName = "Okay"
print(playerName)

let managerName = "Owkay Bro"
let dogBreed = "Poodle"
let meaningOfLife = "How many dog must a man said?"

// DAY 1 PART 2

// How to create strings
let actor = "Tom Cruise"
let fileName = "jakarta.jpg"
let result = "⭐️ You Done! ⭐️"

// use \"<String>\" to add "" into the string with only one quote
let quote = "Then he tapped a sign saying \"Believe\" and walked away."
print(quote)

// use triple quote to create multiple lines of string
let movie = """
    A day in
    the life of an
    Apple engineer
    """
print(movie)

// to count the number of character (length)
print(actor.count)

// sends back the same string except every one of its letter is uppercased
print(result.uppercased())

// lets us know whether a string starts with some letters of our choosing -> retrun true or false (Boolean)
print(movie.hasPrefix("A day"))

// checks whether a string ends with some text
print(fileName.hasSuffix("jpg"))

// DAY 1 PART 3

// How to store whole numbers
let score = 10
let reallyBig = 100_000_000

// Math operator
let lowerScore = score - 2
let higherScore = score + 2
let doubledScore = score * 2
let squaredScore = score * score
let halvesScore = score / 2

// Short hands
var counter = 10
counter += 5
print(counter)

counter -= 10
print(counter)

counter *= counter
print(counter)

counter /= 5
print(counter)

// find out whether it’s a multiple of another integer -> return true of false (Boolean)
let number = 120
print(number.isMultiple(of: 5))

// DAY 1 PART 4

// How to store decimal numbers
let decimalNumber = 0.1 + 0.2
print(decimalNumber)

let a = 1
let b = 2.0
// let c = a + b => can't operate different type

// need to tell explisit
let c = Double(a) + b
print(c)
// or
let d = a + Int(b)
print(d)

let double1 = 3.1
let double2 = 3131.3131
let double3 = 3.0
let int1 = 3

var actorName = "Tom Cruise"
actorName = "Tom Hanks"
// name = 57 => can't declare variable with different type

var rating = 5.0
rating *= 2  // works because have same range of operators as integers
print(rating)

// DAY 2 PART 1

// How to store truth with Booleans
let testFileName = "bali.jpg"
print(testFileName.hasSuffix(".jpg"))

let testNmber = 120
print(testNmber.isMultiple(of: 5))

let learning = true

var sleeping = false
print(sleeping)
sleeping.toggle()  // toggle the value
print(sleeping)

let isMultiple = 120.isMultiple(of: 5)
print(isMultiple)

// short hands
var isAuthenticated: Bool = false
isAuthenticated = !isAuthenticated  // flip the value
print(isAuthenticated)

isAuthenticated = !isAuthenticated  // flip again the value
print(isAuthenticated)

// DAY 2 PART 2
let poeple = "Haters"
let action = "hate"
let lyric = poeple + " gonna " + action
print(lyric)

let luggageCode = "1" + "2" + "3" + "4" + "5"

let lastQuote = "Then he tapped a sign saying \"Believe\" and walked away."

// String interpolation can be use to combine different type into string
let lastName = "Taylor"
let isFan = true
let age = 26
let message =
    "Hello, my name is \(lastName) and I'm \(age) years old I am a \(isFan) Fans."
print(message)

let lastNumber = 11
let missionMessage = "Apollo \(lastNumber) landed on the moon"

print("5 x 5 is \(5*5)")


/*
 SUMMARY : Simple Data
 
     1. Swift lets us create constants using let, and variables using var.
     2. If you don’t intend to change a value, make sure you use let so that Swift can help you avoid mistakes.
     3. Swift’s strings contain text, from short strings up to whole novels. They work great with emoji and any world language, and have helpful functionality such as count and uppercased().
     4. You create strings by using double quotes at the start and end, but if you want your string to go over several lines you need to use three double quotes at the start and end.
     5. Swift calls its whole numbers integers, and they can be positive or negative. They also have helpful functionality, such as isMultiple(of:).
     6. In Swift decimal numbers are called Double, short for double-length floating-point number. That means they can hold very large numbers if needed, but they also aren’t 100% accurate – you shouldn’t use them when 100% precision is required, such as when dealing with money.
     7. There are lots of built-in arithmetic operators, such as +, -, *, and /, along with the special compound assignment operators such as += that modify variables directly.
     8. You can represent a simple true or false state using a Boolean, which can be flipped using the ! operator or by calling toggle().
     9. String interpolation lets us place constants and variables into our strings in a streamlined, efficient way.
 */
