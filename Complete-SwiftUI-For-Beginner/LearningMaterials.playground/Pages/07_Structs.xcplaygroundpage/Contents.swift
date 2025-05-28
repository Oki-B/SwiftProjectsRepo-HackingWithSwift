import Cocoa

// DAY 10 PART 1

// How to create your own structs

// how simple structs looks :
struct Album {  // naming using CamelCase
    // variable and constant on structs called property
    let title: String
    let artist: String
    let year: Int

    func printSummary() {  // we can made a function inside of the structs, it's called method
        print("\(title) (\(year)) by \(artist)")
    }
}

// another example
struct Employee {
    let name: String
    //    var vacationRemaining: Int
    // we can also create a property with default value
    var vacationRemaining: Int = 14  // we must use var for property with default value if we want to make it optional

    // to be able create a method that change value of a property we need label called mutation for the function
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 5)
print(archer.vacationRemaining)

// this is how you init a structs
var archer1 = Employee(name: "Sterling Archer", vacationRemaining: 14)
var archer2 = Employee.init(name: "Sterling Archer", vacationRemaining: 14)

print(archer1)
print(archer2)

let a = 1
let b = 2.0
let c = Double(a) + b

let kane = Employee(name: "Lana Kane")  // with default value we don't need to init the property that already have it
let poovey = Employee(name: "Pam Poovey", vacationRemaining: 35)
print(kane)
print(poovey)

// DAY 10 PART 2

// How to compute property values dynamically

// example how we create a simple struct
struct SimpleEmployee {
    let name: String
    var vacationRemaining: Int
}

var simpleArcher = SimpleEmployee(
    name: "Sterling Archer",
    vacationRemaining: 14
)
//simpleArcher.vacationRemaining -= 5
//print(simpleArcher.vacationRemaining)
//simpleArcher.vacationRemaining -= 3
//print(simpleArcher.vacationRemaining)

// we will lose valuable information with that code, so we need to adjust to use computed property, like so :
struct EmployeeStruct {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0

    var vacationRemaining: Int {
        //        vacationAllocated - vacationTaken
        // we can use getter and setter to provide a value that can be reads can can be write
        get {
            vacationAllocated - vacationTaken
        }

        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var sterling = EmployeeStruct(name: "Sterling Archer", vacationAllocated: 14)
sterling.vacationTaken += 4
print(sterling.vacationRemaining)

// we can modified vacationAllocated now because of setter
sterling.vacationRemaining = 5  // if we only have 5 remains vacation the we already allocated 9 of our vacation stock
print(sterling.vacationAllocated)

// DAY 10 PART 3
// How to take action when a property changes

// swift lets us create property observers, it's a special code that run when property change, it has to form named didSet(run when property just changed) and willSet(run before the property changed)
// previously we create a code by doing something like this
struct PreviousGame {
    var score = 0
}

var previousGame = PreviousGame()
previousGame.score += 10
print("Score is now \(previousGame.score)")
previousGame.score -= 3
print("Score is now \(previousGame.score)")
previousGame.score += 1

// using property observers we can solve problem like this
struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1

// have a look how didSet and willSet works differently
struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }

        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")  // start on here , it will executed code inside willSet first then executed code inside didSet after that
app.contacts.append("Allen W")
app.contacts.append("Ish S")

// DAY 10 PART 4

// How to create custom initializers

// example of how struct and initializer works
struct DefaultPlayer {
    let name: String
    let number: Int
}

let defaultPlayer = DefaultPlayer(name: "Megan R", number: 15)  // it's called memberwise initializer

// there is how we use memberwise initializer with a default value inside
struct EmployeeMemberwise {
    var name: String
    var yearsActive = 0
}

let roslin = EmployeeMemberwise(name: "Laura Roslin")  // we can init it with default value
let adama = EmployeeMemberwise(name: "William Adama", yearsActive: 45)  // or we can init it with new value

// here's how we use customize initializer
struct Player {
    let name: String
    let number: Int

    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)  // by writing this custom code we dont need to called the property on init
    }
}

let player = Player(name: "Megan R")  // should be looks like this
print(player.number)  // and we still have the property

// we can also not use self but it will get a little clumsy by adding some sort of perfix to the paramater names :
struct notSelfPlayer {
    let name: String
    let number: Int

    init(name playerName: String, number playerNumber: Int) {
        name = playerName
        number = playerNumber
    }
}

let notSelfPlayerInstance = notSelfPlayer(name: "Groban", number: 99)
print(notSelfPlayerInstance)

// DAY 11 PART 1

// How to limit access to internal data using access control

/*
 3 option for access control
    Use private for “don’t let anything outside the struct use this.”
    Use fileprivate for “don’t let anything outside the current file use this.”
    Use public for “let anyone, anywhere use this.”
 */

struct BankAccount {
    //    var funds = 0 // using var means let anyone, anywhere use this -> default value for this is public
    //    private var funds = 0 // Using private for “don’t let anything outside the struct use this.”
    private(set) var funds = 0  // using private(set) means “let anyone read this property, but only let my methods write it.”

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)
//account.funds -= 1000 -> youre not be able to change the data of this outside of the struct
print(account.funds)  // since we use private(set) we still be able to read the data for this property
let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}

// DAY 11 PART

// Static properties and methods

// example how to create and use static properties and methods:
struct School {
    //        static var studentCount = 0
    // code above still ca be use but will show a warning

    nonisolated(unsafe) static var studentCount = 0  // swift will give a solution like this to mark it as a nonisolated unsafed

    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

// by using static, we can use the code without even instace it first
School.add(student: "Taylor Swift")
print(School.studentCount)

// there are two rules in mix and match static and non-static properties and methords:

// 1. To access non-static code from static code… you’re out of luck: static properties and methods can’t refer to non-static properties and methods because it just doesn’t make sense – which instance of School would you be referring to?
// 2. To access static code from non-static code, always use your type’s name such as School.studentCount. You can also use Self to refer to the current type.

print(AppData.homeURL)  // static properties can be called without even instanced it first -> good use for sample Data

// exmaple using static data for sampleData like this :
struct SampleEmployee {
    let username: String
    let password: String

    static let example = SampleEmployee(
        username: "cfederighi",
        password: "hairforceone"
    )
}

// example of use static properties
struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"

    var saveFile: String = Self.saveFilename  // you can mix it with called it by Self / name of the Struct ex: AppData.saveFilename
}

var appData = AppData()  // non-static properties need to be instance first before we can read it or to make it exist in our code
print(appData.saveFile)  // after it get instanced it can be call like this
