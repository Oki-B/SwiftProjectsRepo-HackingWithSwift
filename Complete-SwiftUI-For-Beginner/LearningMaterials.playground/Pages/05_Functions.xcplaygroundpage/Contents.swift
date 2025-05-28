import Cocoa

// DAY 7 PART 1

// How to reuse code with functions

// example of use :
func showWelcome() {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}

// function need to be call to use it, it can be called by write the name of function like this:
showWelcome()

// example of built-in function we already .isMultiple(of: Int) and Int.random(in: Int...Int)
let number = 139

if number.isMultiple(of: 2) {
    print("Even")
} else {
    print("Odd")
}

let roll = Int.random(in: 1...20)

// we can create our own function, as example :
func printTimesTables(number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5)

// or give more parameters to make it more dynamic
func printTimesTables(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5, end: 20)

// Any data you create inside a function is automatically destroyed when the function is finished.

// DAY 7 PART 2
//  How to return values from functions

// The sqrt() function accepts one parameter, which is the number we want to calculate the square root of, and it will go ahead and do the work then send back the square root
let root = sqrt(169)
print(root)

// example function writen to return value
func rollDice() -> Int {  // Write an arrow then a data type before your function’s opening brace, which tells Swift what kind of data will get sent back.
    return Int.random(in: 1...6)  // use return keyword to send back your data.
}

let result = rollDice()
print(result)

// example :
func areLettersIdentical(string1: String, string2: String) -> Bool {
    let first = string1.sorted()
    let second = string2.sorted()
    return first == second
}
print(areLettersIdentical(string1: "Hello", string2: "olleH"))

// if your function only have one lines and your writen to get back a value, it will automatically do it even without writing a return
func ifStringContainSameLetters(string1: String, string2: String) -> Bool {
    string1.lowercased().sorted() == string2.lowercased().sorted()
}

let result2 = ifStringContainSameLetters(string1: "Hello", string2: "olleh")
print(result2)

// another example
func rollDice2() -> Int {
    Int.random(in: 1...6)
}
print(rollDice2())

// another example :
func pythagoras(a: Double, b: Double) -> Double {
    let input = a * a + b * b
    let root = sqrt(input)
    return root
}

let c = pythagoras(a: 3, b: 4)
print(c)

// without return keyword
func pythagoras2(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}

// it also can work for if else condition :
func greet(name: String) -> String {
    if name == "Taylor Swift" {
        "Oh wow!"
    } else {
        "Hello, \(name)"
    }
}

// but it must consitent not gonna works like this :
/*
     func greet(name: String) -> String {
     if name == "Taylor Swift" {
     "Oh wow!"
     } else {
     let greeting = "Hello, \(name)"
     return greeting
     }
     }
 */

// can also be writen like this :
func greet2(name: String) -> String {
    let response =
        if name == "Taylor Swift" {
            "Oh wow!"
        } else {
            "Hello, \(name)"
        }

    return response
}

// DAY 7 PART 3

// How to return multiple values from functions

// If you want to return two or more values from a function, you could use an array. For example, here’s one that sends back a user’s details:
func getUserArray() -> [String] {
    ["Taylor", "Swift"]
}

let userArray = getUserArray()
print("Name: \(userArray[0]) \(userArray[1])")

// we also can use Dictionary
func getUserDictionary() -> [String: String] {
    [
        "firstName": "Taylor",
        "lastName": "Swift",
    ]
}

let userDictionary = getUserDictionary()
print(
    "Name: \(userDictionary["firstName", default: "Anonymous"]) \(userDictionary["lastName", default: "Anonymous"])"
)

// but Both of these solutions are pretty bad, but Swift has a solution in the form of tuples. Like arrays, dictionaries, and sets, tuples let us put multiple pieces of data into a single variable, but unlike those other options tuples have a fixed size and can have a variety of data types.

func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let user = getUser()
print("Name: \(user.firstName) \(user.lastName)")

//short hands to use Tuples
func getUser2() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift")
}

// can also create without label
func getUser3() -> (String, String) {
    ("Taylor", "Swift")
}

let user3 = getUser3()
print("Name: \(user3.0) \(user3.1)")

// use destructuring
let (firstName, lastName) = getUser()
print("Name: \(firstName) \(lastName)")

// can also descrut only one part
let (FirstName, _) = getUser()  // not case sensitif only focus on position
print("Name: \(FirstName)")

// DAY 7 PART 4

// How to customize parameter labels

// example of use parameters :
func rollDice(sides: Int, count: Int) -> [Int] {
    // Start with an empty array
    var rolls = [Int]()

    // Roll as many dice as needed
    for _ in 1...count {
        // Add each result to our array
        let roll = Int.random(in: 1...sides)
        rolls.append(roll)
    }

    // Send back all the rolls
    return rolls
}

let rolls = rollDice(sides: 6, count: 4)

// or
func hireEmployee(name: String) {}
func hireEmployee(title: String) {}
func hireEmployee(location: String) {}

// function hasPrefix do not have a label parameter
let lyric = "I see a red door and I want it painted black"
print(lyric.hasPrefix("I see"))

// how to write it without parameter name is by using underscores

// with parameter name
func isUppercase(string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let resultUpperCase = isUppercase(string: string)

// without paramater name
func isUppercase2(_ string: String) -> Bool {
    string == string.uppercased()
}

let string2 = "HELLO, WORLD"
let resultUpperCase2 = isUppercase2(string2)

// another example:

// with parameter name
func printTimesTablesWithParams(number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTablesWithParams(number: 5)

// with label parameter
func printTimesTables1(for number: Int) {  // write label before parameter name
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables1(for: 5)

// DAY 8 PART 1
// How to provide default values for parameters

// How to write default paramters on function
func printTimesTables(for number: Int, end: Int) {  // Without default paramaters
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 20)

// create it with default parameter
func printTimesTables1(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables1(for: 5, end: 20)
printTimesTables1(for: 8)

// example default paramater in removeAll function
var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll(keepingCapacity: false)
characters.append("Broh")
print(characters.count)

//print(characters.count)
//characters.removeAll(keepingCapacity: false) // by default it has a parameters called keepingCapacity
//print(characters.count)
//print(characters)

// DAY 8 PART 2

// How to handle errors in functions

// start by define an error possibilities using enum
enum PasswordError: Error {  // need to define as an Error
    case short, obvious
}

// example how to write an throwing function
func checkPassword(_ password: String) throws -> String {  // need to be marked with throws
    if password.count < 5 {
        throw PasswordError.short  // must be wrap on if condition so you function not gonna just throwing error
    }

    if password == "12345" {
        throw PasswordError.obvious
    }

    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

// how to running the throw function
let stringPass = "12345"

do {  // must be start with do
    let result = try checkPassword(stringPass)  // marked the throw function with try
    print("Password rating: \(result)")
} catch {  // catch if there are an error
    print("There was an error name \(error.localizedDescription).")  // usually we use error.localizedDescription to see what exactly happen in programming language if there an unusual condition (condition other than we store)
}

// specific example using the Error we state using enum
do {
    let result = try checkPassword(stringPass)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}

func play(games: String...) {
    for game in games {
        print("Let's play \(game)!")
    }
}
play(games: "Chess")
