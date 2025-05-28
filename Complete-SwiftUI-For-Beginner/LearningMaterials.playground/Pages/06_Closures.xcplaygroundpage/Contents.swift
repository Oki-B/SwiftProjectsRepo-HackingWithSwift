//import Cocoa

// DAY 9 PART 1
// How to create and use closures

// Closure works same as function but have different method to write and use
// here you write a function :
func greetUser() {
    print("Hi there!")
}

greetUser()

var greetCopy = greetUser
greetCopy()

// here you wrote in closure
let sayHello = {
    print("Hi there!")
}

sayHello()

// to make closure accept parameter, you can wrote it like this :
let sayHi = { (name: String) -> String in  // it accept parameter label name with value of String and expecting return value of String and you must add keyword in at the end
    "Hi \(name)!"
}

print(sayHi("John"))

// to make variable from function with type annotation, you can wrote like this
var greetCopy2: () -> Void = greetUser

// here is another example in function when we want to use type annotation in assigner function to a variable
func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)

// in closure we dont need to write parameter name we we call it
print(sayHi("Okay"))

// example use of closure at .sorted() function
let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

// if we want to add another function in sorted function we can wrote like this :
func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}

let captainFirstTeam = team.sorted(by: captainFirstSorted)
print(captainFirstTeam)

// here is how you can wrote it using closure
let captainFirstTeamClosure = team.sorted(by: {
    (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})
print(captainFirstTeamClosure)

// different between function and closure
// function
func pay(user: String, amount: Int) {
    // code
}
// closure
let payment = { (user: String, amount: Int) in
    // code
    print("Paying \(user)…")
}

// return a value in closure
let paymentReturn = { (user: String) -> Bool in
    print("Paying \(user)…")
    return true
}

// wrote a closure with no parameter
let paymentNoParameter = { () -> Bool in
    print("Paying an anonymous person…")
    return true
}
//**/

// DAY 9 PART 2
// How to use trailing closures and shorthand syntax

// how we can write closure originally
let secondTeam = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

let captainSecondTeam = secondTeam.sorted(by: {
    (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})

print(captainSecondTeam)

// how we can make it shorter using syntax named trailing closure
// we can do it by get ride of (by: {declarative 1, declarative 2} to be like this
let captainThirdTeam = team.sorted { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}

// using trailing closure we also can use shorthand syntax by get rid of the variable name and change it into $[index]
let captainForth = team.sorted { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}

// combined it we can create it even more shorter
let reverseTeam = team.sorted {
    return $0 > $1
}
// even in one line
let oneLineReverseTeam = team.sorted { $0 > $1 }

// more example of use it -> filter only team who has character T
let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

// or we can map to make all of the name in uppercase
let upperCaseTeam = team.map { $0.uppercased() }
print(upperCaseTeam)

// DAY 9 PART 3

// How to accept functions as parameters
func greetUserFunc() {
    print("Hi there!")
}

greetUserFunc()

var greetCopyFunc: () -> Void = greetUserFunc
greetCopyFunc()

func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()

    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }

    return numbers
}

let rolls = makeArray(size: 50) {
    Int.random(in: 1...20)
}

print(rolls)

func generateNumber() -> Int {
    Int.random(in: 20...100)
}

let newRolls = makeArray(size: 50, using: generateNumber)
print(newRolls)

func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}

func firstStep() {
    print("Ready for the first step")
}

func secondStep() {
    print("Ready for the second step")
}

func thirdStep() {
    print("Ready for the third step")
}

doImportantWork(first: firstStep, second: secondStep, third: thirdStep)
