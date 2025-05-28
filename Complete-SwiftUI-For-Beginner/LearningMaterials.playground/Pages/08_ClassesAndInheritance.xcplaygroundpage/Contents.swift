import Cocoa

// DAY 12 PART 1

// How to create your own classes

/*
 Similiarity between classes and structs:
 -> You get to create and name them.
 -> You can add properties and methods, including property observers and access control.
 -> You can create custom initializers to configure new instances however you want.

 Key of different :
 -> You can make one class build upon functionality in another class, gaining all its properties and methods as a starting point. If you want to selectively override some methods, you can do that too.
 -> Because of that first point, Swift won’t automatically generate a memberwise initializer for classes. This means you either need to write your own initializer, or assign default values to all your properties.
 -> When you copy an instance of a class, both copies share the same data – if you change one copy, the other one also changes.
 -> When the final copy of a class instance is destroyed, Swift can optionally run a special function called a deinitializer.
 -> Even if you make a class constant, you can still change its properties as long as they are variables.
 */

// example of how to create classes
class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

// It's very important to know when to use structs or classes on our code by looking from the key of their differentiate

//**/

// DAY 12 PART 2
// How to make one class inherit from another

// example of how create a class
class Employee {
    let hours: Int

    init(hours: Int) {
        self.hours = hours
    }

    func printSummary() {  // inheritance methods on class
        print("I work for \(hours) hours a day.")
    }
}

// example how we create subclasses by using inheritance
class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
}

class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

// example how to create an instances from each of the subclasses
let robert: Developer = Developer(hours: 8)
robert.work()

let jane: Manager = Manager(hours: 10)
jane.work()

// Since bot of Developer and Manager inherits from Employee, we can use the methods on Employee in each subclasses
robert.printSummary()
jane.printSummary()

// we also can override parents methods on child class created from it, as example :
class SeniorDeveloper: Employee {
    func work() {
        print("I'm writing complex code for \(hours) hours.")
    }

    // we can override methods from parents by using override keyword
    override func printSummary() {
        print("I'm a senior developer and I work for \(hours) hours a day.")
    }
}
let senior: SeniorDeveloper = SeniorDeveloper(hours: 9)
senior.work()
senior.printSummary()  // have different result from the parent method

// if we want to create a parent / children classes that dont have inheritance we can use keyword final in create our class, as example:
final class OldManager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
    override func printSummary() {
        print("I'm a final manager and will be retired soon.")
    }
}

// DAY 12 PART 3

// How to add initializers for classes

// example how to defining a new class
class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

// if we want to create a child from the class and add new property we need to also init the property from the parents, we can use word super to init, as example :
class Car: Vehicle {
    let isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)  // using keyword super to refer to the property parameter of the parent class
    }
}

let teslaX = Car(isElectric: true, isConvertible: true)

// in the other way, we don't need to init the property from the parents if we don't add a new property to be init, or we only add a default property in child class, as example :

class ElectricCar: Vehicle {
    let isConvertible = false
}
let BYD = ElectricCar(isElectric: true)

// DAY 12 PART 4

// How to copy classes
class User {
    var username = "Anonymous"
}

// we can create an instance by this
var user1 = User()
// to copy the instance class we can assign the value to new variable
var user2 = user1  // by doing this everyhing we do with user 2 will also happen to user 1
user2.username = "New Name"
print(user1.username)
print(user2.username)

// if we want to create unique copy of a class - sometimes called a deep copy, we need to handle creating a new instance and copy across all data safely. as example :
class TheUser {
    var username = "Anonymous"

    func copy() -> TheUser {
        let user = TheUser()
        user.username = username
        return user
    }
}
var newUser = TheUser()
var copyUser = newUser.copy()  // we called func copy to create new unique copy

// if we do anything with the copy it's not gonna affecting the original one
copyUser.username = "Change Name"
print(newUser.username)
print(copyUser.username)

// DAY 12 PART 5
// How to create a deinitializer for a class

// example how to use init and deinit
class UserDeinit {
    let id: Int

    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }

    deinit {
        print("User \(id): I'm dead!")
    }
}

for i in 1...3 {
    let user = UserDeinit(id: i)
    print("User \(user.id): I'm in control!")
}

// if we were adding our User instances as they were created, they would only be destroyed when the array is cleared:

var users = [UserDeinit]()

for i in 1...3 {
    let user = UserDeinit(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished!")
for i in users {
    print(i.id)
}

users.removeAll()  // it will only destroyed after we remove all user stored
print("Array is clear!")

// How to work with variables inside classes

class UserVar {
    var name = "Paul"
}

let user = UserVar()  // the property inside of the class still can be change even we declare it as a constant, it because we declare the property as a variable
user.name = "Taylor"
print(user.name)

var userVar = UserVar()  // when we delcare the class as a variable, the class it self can be change
userVar.name = "John"
print(userVar.name)

userVar = UserVar()  // here example, it will change also with the property inside that already change
print(userVar.name)
