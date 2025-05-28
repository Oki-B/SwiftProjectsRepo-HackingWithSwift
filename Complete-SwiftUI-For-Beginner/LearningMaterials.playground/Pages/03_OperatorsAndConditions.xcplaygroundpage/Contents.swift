// DAY 5 PART 1
// How to check a condition is true or false

var someCondition = true

if someCondition {
    print("Do something")
}

// can include as much code in there
if someCondition {
    print("Do something")
    print("Do something else")
    print("Do a third thing")
}

// Comparison condition
let score = 85

if score > 80 {
    print("Great job!")
}

// another comparison operator
let speed = 88
let percentage = 85
let age = 18

if speed >= 88 {
    print("Where we're going we don't need roads.")
}

if percentage < 85 {
    print("Sorry, you failed the test.")
}

if age >= 18 {
    print("You're eligible to vote")
}

// can also work on other type than number

let ourName = "Dave Lister"
let friendName = "Arnold Rimmer"

if ourName < friendName {
    print("It's \(ourName) vs \(friendName)")
}

if ourName > friendName {
    print("It's \(friendName) vs \(ourName)")
}

// Make an array of 3 numbers
var numbers = [1, 2, 3]

// Add a 4th
numbers.append(4)

// If we have over 3 items
if numbers.count > 3 {
    // Remove the oldest number
    numbers.remove(at: 0)
}

// Display the result
print(numbers)

// Equal and is not equal to
let country = "Canada"

if country == "Australia" {  // equal comparison
    print("G'day!")
}

let name = "Taylor Swift"

if name != "Anonymous" {  // is not equal
    print("Welcome, \(name)")
}

// check for empty variable

// Create the username variable
var username = "taylorswift13"

// If `username` contains an empty string
if username == "" {
    // Make it equal to "Anonymous"
    username = "Anonymous"
}

// Now print a welcome message
print("Welcome, \(username)!")

// use .count
if username.count == 0 {
    username = "Anonymous"
}

// hands on isEmpty
if username.isEmpty == true {
    username = "Anonymous"
}

// short hands
if username.isEmpty {
    username = "Anonymous"
}

// Swift lets us compare many kinds of values out of the box, which means we can check a variety of values for equality and comparison. For example, if we had values such as these:

let firstName = "Paul"
let secondName = "Sophie"

let firstAge = 40
let secondAge = 10

// we could compare them in various ways "
print(firstName == secondName)
print(firstName != secondName)
print(firstName < secondName)
print(firstName >= secondName)

print(firstAge == secondAge)
print(firstAge != secondAge)
print(firstAge < secondAge)
print(firstAge >= secondAge)

// Behind the scenes, Swift implements this in a remarkably clever way that actually allows it to compare a wide variety of things. For example, Swift has a special type for storing dates called Date, and you can compare dates using the same operators: someDate < someOtherDate, for example.

// We can even ask Swift to make our enums comparable, like this:
enum Sizes: Comparable {
    case small
    case medium
    case large
}

let first = Sizes.small
let second = Sizes.large
print(first < second)
// That will print “true”, because small comes before large in the enum case list.

// DAY 5 PART 2

// How to check multiple conditions

/* Instead of using this code to check multiple conditions :
 let age = 16

 if age >= 18 {
     print("You can vote in the next election.")
 }

 if age < 18 {
     print("Sorry, you're too young to vote.")
 }
*/

let expAge = 16

if expAge >= 18 {
    print("You can vote in the next election.")
} else {
    print("Sorry, you're too young to vote.")
}

let a = false
let b = true

if a {
    print("Code to run if a is true")
} else if b {
    print("Code to run if a is false but b is true")
} else {
    print("Code to run if both a and b are false")
}

// double if known as AND condition:

let temp = 25
// nested if
if temp > 20 {
    if temp < 30 {
        print("It's a nice day.")
    }
}
// and operator
if temp > 20 && temp < 30 {
    print("It's a nice day.")
}

// double if with one output known as OR condition
let userAge = 14
let hasParentalConsent = true

if userAge >= 18 || hasParentalConsent == true {
    print("You can buy the game")
}

// short hands
if userAge >= 18 || hasParentalConsent {
    print("You can buy the game")
}

// example case using enum

enum TransportOption {
    case airplane, helicopter, bicycle, car, scooter
}

let transport = TransportOption.airplane

if transport == .airplane || transport == .helicopter {
    print("Let's fly!")
} else if transport == .bicycle {
    print("I hope there's a bike path…")
} else if transport == .car {
    print("Time to get stuck in traffic.")
} else {
    print("I'm going to hire a scooter now!")
}

// More complex case
let isOwner = false
let isEditingEnabled = true
let isAdmin = true

// bad example
if isOwner == true && isEditingEnabled || isAdmin == true {
    print("You can delete this post")
}

// make it clear which one is executed first
// example 1 :
if (isOwner == true && isEditingEnabled) || isAdmin == true {
    print("You can delete this post ---> Exp 1")
}

// example 2 :
if isOwner == true && (isEditingEnabled || isAdmin == true) {
    print("You can delete this post ---> Exp 2")
}

// DAY 5 PART 3

// How to use switch statements to check multiple conditions

// example we use if else repeatedly
enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun

if forecast == .sun {
    print("It should be a nice day.")
} else if forecast == .rain {
    print("Pack an umbrella.")
} else if forecast == .wind {
    print("Wear something warm")
} else if forecast == .rain {
    print("School is cancelled.")
} else {
    print("Our forecast generator is broken!")
}

// we can replace it with switch condition
switch forecast {
case .sun:
    print("It should be a nice day.")
case .rain:
    print("Pack an umbrella.")
case .wind:
    print("Wear something warm")
case .snow:
    print("School is cancelled.")
case .unknown:
    print("Our forecast generator is broken!")
}
// case must be complete otherwise xcode will broad an error called switch must be exhausted => mean it must cover all of the cases on enum
// if you dont block all the possible cases, you must use default on the switch
// other example case
let place = "Metropolis"

switch place {
case "Gotham":
    print("You're Batman!")
case "Mega-City One":
    print("You're Judge Dredd!")
case "Wakanda":
    print("You're Black Panther!")
default:
    print("Who are you?")
}

let day = 5
print("My true love gave to me…")

switch day {
case 5:
    print("5 golden rings")
case 4:
    print("4 calling birds")
case 3:
    print("3 French hens")
case 2:
    print("2 turtle doves")
default:
    print("A partridge in a pear tree")
}

// using fallthrough can change the behaviour of switch to keep printing the other cases
print("My true love gave to me…")

switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}

// DAY 5 PART 4
// How to use the ternary conditional operator for quick tests

// how to use
let personAge = 18
let canVote = personAge >= 18 ? "Yes" : "No"

// example :
let hour = 23
print(hour < 12 ? "It's before noon" : "It's after noon")

let names = ["Jayne", "Kaylee", "Mal"]
let crewCount = names.isEmpty ? "No one" : "\(names.count) people"
print(crewCount)

enum Theme {
    case light, dark
}

let theme = Theme.dark

let background = theme == .dark ? "black" : "white"
print(background)
