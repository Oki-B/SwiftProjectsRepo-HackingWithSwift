// DAY 3 PART 1

// How to store ordered data in arrays
var beatles = ["John", "Paul", "George", "Ringo"]
let numbers = [4, 8, 15, 16, 23, 42]
var temperatures = [25.3, 28.2, 26.4]

print(beatles[0])
print(numbers[1])
print(temperatures[2])

beatles.append("Adrian")
beatles.append("Allen")
beatles.append("Adrian")
beatles.append("Novall")
beatles.append("Vivian")

// temperaturues.append("Chris") => Can't executed => Array only can contain one data type at a time.
let firstBeatle = beatles[0]
let firstNumber = numbers[0]
// let notAllowed = firstBeatle + firstNumber => cannot combine different type of data

var scores = [Int]()
scores.append(100)
scores.append(80)
scores.append(85)
print(scores[1])

// short hands
var albums1 = [String]()
albums1.append("Folklore")
albums1.append("Fearless")
albums1.append("Red")

// or

var albums2 = ["Folklore"]
albums2.append("Fearless")
albums2.append("Red")

print(albums1.count)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)  // count number of array items

characters.remove(at: 2)
print(characters.count)  // remove item on array at spesific index number
print(characters)

characters.removeAll()
print(characters.count)  // remove all items from the array
print(characters)

let bondMovies = ["Casino Royale", "Spectre", "No Time To Die"]
print(bondMovies.contains("Frozen"))  // check whether an array contains a particular item

let cities = ["London", "Tokyo", "Rome", "Budapest"]
print(cities.sorted())  // sort an array

let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()  // reverse an array
print(reversedPresidents)

// DAY 3 PART 2

// How to store and find data in dictionaries

/* let employee2 = ["name": "Taylor Swift", "job": "Singer", "location": "Nashville"] */

// Can do it like code above but best to make it better to see
let employee2 = [
    "name": "Taylor Swift",
    "job": "Singer",
    "location": "Nashville",
]

// will came with a warning
//    print(employee2["name"])
//    print(employee2["job"])
//    print(employee2["location"])

// how to do it properly by giving a default value
print(employee2["name", default: "Unknown"])
print(employee2["job", default: "Unknown"])
print(employee2["location", default: "Unknown"])

// can combine data type
let hasGraduated = [
    "Eric": false,
    "Maeve": true,
    "Otis": false,
]

let olympics = [
    2012: "London",
    2016: "Rio de Janeiro",
    2021: "Tokyo",
]

print(olympics[2012, default: "Unknown"])

// can create empty dictionary explicit types and set key one by one
var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["LeBron James"] = 206

var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"
// can rewrite or replace the value by using same key
archEnemies["Batman"] = "The Penguin"
print(archEnemies["Batman", default: "Unknown"])

// DAY 3 PART 3
// How to use sets for fast data lookup
var actors = Set<String>()
actors.insert("Tom Cruise")
actors.insert("Leonardo DiCaprio")
actors.insert("Dwayne Johnson")
actors.insert("Nicolas Cage")
actors.insert("Tom Cruise")  // sets are unordered and cannot contain duplicates, whereas arrays retain their order and can contain duplicates.

print(actors)

// DAY 3 PART 4
// How to create and use enums
enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

var day = Weekday.monday
day = Weekday.tuesday
day = Weekday.friday

print(day)

// short hands to write and use enums
enum Weekday2 {
    case monday, tuesday, wednesday, thursday, friday
}
var day2 = Weekday2.monday
day2 = .tuesday
day2 = .friday

print(day2)

// DAY 4

 // How to use type annotations

 //create constants and variable without annotation
 //let surname = "Lasso"
 //var score = 0

 //with annotations
 let surname: String = "Lasso"
 // var score: Int = 0
 var score: Double = 0 // if you it's a decimal at the end you can write like this

 //use of annotations in simple data
 let playerName: String = "Roy"
 let luckyNumber: Int = 7
 let pi: Double = 3.14
 let isAuthenticated: Bool = true

 //example on array
 var albums: [String] = ["Red", "Fearless"]

 //on dictionary
 var user: [String: String] = ["id": "@twostraws"]
 var dicScores: [String: Int] = ["Roy": 100, "Maeve": 90]

 //assign an array with value or empty value
 var soda: [String] = ["Coke", "Pepsi", "Irn-Bru"]

 var teams: [String] = [String]() // 1
 var someCities: [String] = [] // 2
 var clues = [String]() // 3

 // Values of an enum have the same type as the enum itself
 enum UIStyle {
 case light, dark, system
 }

 var style = UIStyle.light

 // use case for a constants
 let username: String
 // lots of complex logic
 username = "@twostraws"
 // lots more complex logic
 print(username)


/*
 //SUMMARY
 1. Arrays let us store lots of values in one place, then read them out using integer indices. Arrays must always be specialized so they contain one specific type, and they have helpful functionality such as count, append(), and contains().
 2. Dictionaries also let us store lots of values in one place, but let us read them out using keys we specify. They must be specialized to have one specific type for key and another for the value, and have similar functionality to arrays, such as contains() and count.
 3. Sets are a third way of storing lots of values in one place, but we don’t get to choose the order in which they store those items. Sets are really efficient at finding whether they contain a specific item.
 4. Enums let us create our own simple types in Swift so that we can specify a range of acceptable values such as a list of actions the user can perform, the types of files we are able to write, or the types of notification to send to the user.
 5. Swift must always know the type of data inside a constant or variable, and mostly uses type inference to figure that out based on the data we assign. However, it’s also possible to use type annotation to force a particular type.

 =>> Out of arrays, dictionaries, and sets, it’s safe to say that you’ll use arrays by far the most. After that comes dictionaries, and sets come a distant third. That doesn’t mean sets aren’t useful, but you’ll know when you need them!

 */
