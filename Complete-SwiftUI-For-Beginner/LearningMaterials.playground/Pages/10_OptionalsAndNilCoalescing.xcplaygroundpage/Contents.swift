import Cocoa

// DAY 14 PART 1

// How to handle missing data with optionals

// let said we have this dictionary
let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi",
]

// and then we make a another dictionary but without value
let peachOpposite = opposites["Peach"]

// if we want to print the value, we can't it will trigger some warning. because it's basically empty or in swift called nil
//print("Mario's opposite is: \(peachOpposite)")

// the solution for this is by unwrapping the variable first before we use it, here how we can do it by using if let syntax:
if let marioOpposite = peachOpposite {
    print("Mario's opposite is: \(marioOpposite)")
}

//  how if let works, is by create a condition in form of a variable where that variable can be used on the scope of the syntax, as example :

var username: String?

if let unwrappedUsername = username {
    // the unwrappedUsername variable is valid from here
    print("We got a user: \(unwrappedUsername)")
} else {
    print("the optional string is empty")
}  // until here

// take a look for another example :

// let's said i have a func:
func square(number: Int) -> Int {
    number * number
}

var number: Int?
//print(square(number: number)) // doing this not gonna works since the number is empty

// to use the variable we can create using if let syntax :
if let unwrappedNumber = number {
    print(square(number: unwrappedNumber))
}

// we could even write the variable like this :
if let number = number {
    print(square(number: number))
} else {
    print("the optional number is empty")
}

// see that the number will be still same at here
print(number ?? 0)

// have a look of this code to see how the optional usually used in the code

let name = "Parjo"  // to prove that if let will create a new variable that only works on it's scope
func getName() -> String? {
    // we create a function that can return either "Taylor" or nil
    var number = Int.random(in: 1...2)
    if number == 1 {
        return nil
    } else {
        return "Taylor"
    }
}

if let name = getName() {
    print("Username is \(name)")
} else {
    print("No username")
}

print(name)

// DAY 14 PART 2

// How to unwrap optionals with guard

// example how to use guard
func printSquare(number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }
    print("\(number) x \(number) is \(number * number)")
}

// check what's the different between if let and guard
var myVar: Int? = 3

if let unwrapped = myVar {  // if let runs the code inside its braces if the optional had a value
    print("Run if myVar has a value inside")
}

//guard let unwrapped = myVar else { // guard let runs the code inside its braces if the optional didn’t have a value. This explains the use of else in the code: “check that we can unwrap the optional, but if we can’t then…”
//    print("Run if myVar doesn't have a value inside")
//    return // since guard must have return or throw it must be inside of a function or do catch
//}

func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")

        // 1: We *must* exit the function here
        return
    }

    // 2: `number` is still available outside of `guard`
    print("\(number) x \(number) is \(number * number)")
}

func printSquare2(of number: Int?) {
    if let number = number {
        print("\(number) x \(number) is \(number * number)")
    }

    //    print(number)// cannot works since "number" no longer can be use here
}

//printSquare2(of: 4)

// Tip: You can use guard with any condition, including ones that don’t unwrap optionals. For example, you might use guard someArray.isEmpty else { return }.

// DAY 14 PART 3

// How to unwrap optionals with nil coalescing

let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko",
]

let new = captains["Serenity"]  // write it means that this element doesnt have any value = nil
// print(new) // this not gonna works

// we can we can solve it by 2 ways
let newWay1 = captains["Serenity"] ?? "N/A"  // by using nil coaleascing
let newWay2 = captains["Serenity", default: "None"]  // by using default value

print(newWay1)  // we will get N/A
print(newWay2)  // we will get None

// nil coaleascing not only works on dictionary, it also can works with other data type
let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]  // on array
let favorite = tvShows.randomElement() ?? "None"

struct Book {  // on struct with optional property
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)

// or when you want to create an integer from a string
let input = ""
let numberOfInt = Int(input) ?? 0
print(numberOfInt)

// when we should use nil coalescing in swift

// For example, if you were working on a chat app and wanted to load whatever message draft the user had saved, you might write code like this:
func loadSavedMessage() -> String? {
    return nil
}
let savedData = loadSavedMessage() ?? ""

// or in dictionary to ensure we get back a non-optional data
let scores = ["Picard": 800, "Data": 7000, "Troi": 900]
let crusherScore = scores["Crusher"] ?? 0

// DAY 14 PART 4

// How to handle multiple optionals using optional chaining

let names = ["Arya", "Bran", "Robb", "Sansa"]

let chosen = names.randomElement()?.uppercased() ?? "No one"  // example of Optional chaining looks
// it means if the optional value names.randomElement() has a value inside, unwrap it then uppercased it, if its not then send back value of "No one"
print("Next in line: \(chosen)")

// more example :
/*
 -> We have an optional instance of a Book struct – we might have a book to sort, or we might not.
 -> The book might have an author, or might be anonymous.
 -> If it does have an author string present, it might be an empty string or have text, so we can’t always rely on the first letter being there.
 -> If the first letter is there, make sure it’s uppercase so that authors with lowercase names such as bell hooks are sorted correctly.
 */
// the code will looks like this :
struct NewBook {
    let title: String
    let author: String?
}

var newBook: NewBook? = nil
let newAuthor = newBook?.author?.first?.uppercased() ?? "A"
print(newAuthor)

// How to handle function failure with optionals
// example of how it looks :
enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}
// it only use if you dont want to see what the error is if it's not there. (you should very rarely use "try?" )

// if you really want to show something alternatively you can use nil coaleascing
let user = (try? getUser(id: 23)) ?? "Anonymous"
print(user)

/*
 You’ll find try? is mainly used in three places:

 1. In combination with guard let to exit the current function if the try? call returns nil.
 2. In combination with nil coalescing to attempt something or provide a default value on failure.
 3. When calling any throwing function without a return value, when you genuinely don’t care if it succeeded or not – maybe you’re writing to a log file or sending analytics to a server, for example.
 */
