import Cocoa

// DAY 13 PART 1

// How to create and use protocols

/*  Protocols let us define how structs, classes, and enums ought to work: what methods they should have, and what properties they should have. Swift will enforce these rules for us, so that when we say a type conforms to a protocol Swift will make sure it has all the methods and properties required by that protocol.
 */

// example how we can define a protocol:
protocol Vehicle {
    var name: String { get }
    var currentPassenger: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Vehicle {
    let name = "Car"
    var currentPassenger = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    func travel(distance: Int) {
        print("I'm drivin \(distance)km.")
    }

    func openSunroof() {
        print("It's a nice day!")
    }
}

// we can declare one global function and use the protocols to make the function works on global even if we have different result of function on different struct or class
func commute(distance: Int, using vehicle: Vehicle) {  // since we use Vehicle protocols on this function we can use all of the struct that created using this protocols
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

let car = Car()
commute(distance: 100, using: car)  // this is an example how the function can works on Car struct

struct Bicycle: Vehicle {
    let name = "Bicycle"
    var currentPassenger = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")
    }
}

let bike = Bicycle()
commute(distance: 50, using: bike)  // and also still can work on Bicycle struct

// another example how we can use protocols to create global function with different result based on each struct conforming protocols
func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}

getTravelEstimates(using: [car, bike], distance: 100)

// DAY 13 PART 2

// How to use opaque return types

func getRandomNumber() -> Int {  // it can works because Integer had protocol called Equatable
    Int.random(in: 1...6)
}

//func getRandomBool() -> Equatable { // But create it directly like this cannot work
//    Bool.random()
//}

func getRandomWorks() -> some Equatable {  // using some can works and mean we want to send out some kind of Equatable protocol but we don't want to write out exact thing, you need to figure it out by yourself
    Int.random(in: 1...6)
    //    Bool.random()
}

print(getRandomNumber() == getRandomNumber())
//print(getRandomBool() == getRandomBool())

print(getRandomWorks() == getRandomWorks())

// DAY 13 PART 3

// How to create and use extensions

/*
 Extensions let us add functionality to classes, structs, and more, which is helpful for modifying types we don’t own – types that were written by Apple or someone else, for example. Methods added using extensions are indistinguishable from methods that were originally part of the type, but there is a difference for properties: extensions may not add new stored properties, only computed properties.

 Extensions are also useful for organizing our own code, and although there are several ways of doing this I want to focus on two here: conformance grouping and purpose grouping.
 */

// example how we use and wrote extensions
var quote = "   The truth is rarely pure and never simple   "  // let said we have a String variable like this
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)  // to make it in good format we want to trimmed the variable and store it in a new variable

// similiar with func using extension we dont need to create a new variable each time we want to do the job
extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    mutating func trim() {  // create this is refer to change the value of variable using the function
        self = self.trimmed()
    }

    var lines: [String] {  // let said we create new extension variable to count how many lines string have in multipleline of string
        self.components(separatedBy: .newlines)
    }
}

quote.trim()  // when you do this you change the value of the variable
print(quote)
//print(quote.trimmed()) // using this you not change the original value of the variable you only create a new copy of variable

let lyrics = """
    But I keep cruising
    Can't stop, won't stop moving
    It's like I got this music in my mind
    Saying it's gonna be alright
    """

print(lyrics.lines.count)

// but we still could have written a function to do it like this :
func trim(_ string: String) -> String {
    string.trimmingCharacters(in: .whitespacesAndNewlines)
}

print(trim(quote))

/*
 But extensions have some of benefits over the global function, including :

 1. Code Completion
 -> When you type quote. Xcode brings up a list of methods on the string, including all the ones we add in extensions. This makes our extra functionality easy to find.
 2. Code Organization
 -> Writing global functions makes your code rather messy – they are hard to organize and hard to keep track of. On the other hand, extensions are naturally grouped by the data type they are extending.
 3. Internal Access
 -> Because your extension methods are a full part of the original type, they get full access to the type’s internal data. That means they can use properties and methods marked with private access control, for example.
 */

// example trick to use extension
struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

let lotr = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)

// if we want to create custom init to one of the variable
struct Book1 {
    let title: String
    let pageCount: Int
    let readingHours: Int

    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

// it cannot use memberwise like this code anymore
//  let lotr1 = Book1(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)

// let said we want to create the custom init to be optional, we can use extension to do that
struct Book2 {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

extension Book2 {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

let lotr2 = Book2(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)  // this still can works since we create it using extension
let lotr3 = Book2(title: "Lord of the Rings", pageCount: 1178)  // this still works

// DAY 13 PART 4
// How to create and use protocol extensions

let guests = ["Mario", "Luigi", "Peach"]

if guests.isEmpty == false {  // let said we want to create condition to print number of guests
    print("Guest count: \(guests.count)")
}

// or we can use it like this
if !guests.isEmpty {
    print("Guest count: \(guests.count)")
}

// we can use extension for that
extension Array {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

if guests.isNotEmpty {  // now we can make it more understandable
    print("Guest count: \(guests.count)")
}

// instead of extension of Array, we can use extension called Collection to access type of Array, Set, and Dictionaris who had same functionallity like contains(), sorted(), reversed() and more
extension Collection {  // it same as we use extension of Array, but included in sets and dictionary also
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

// example :
let numbers: Set<Int> = [1, 2, 3]

if numbers.isNotEmpty {  // this works also since we used collection
    print("Number count: \(numbers.count)")
}

// we can also create an extension for protocols, as example :
protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}

struct Employee: Person {
    let name: String
}

let taylor = Employee(name: "Paijo")
taylor.sayHello()
