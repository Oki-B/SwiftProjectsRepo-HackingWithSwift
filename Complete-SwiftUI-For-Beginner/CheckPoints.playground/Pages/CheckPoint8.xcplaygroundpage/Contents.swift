// Check Point 8

/*
 Goals:
 1. make a protocol that describes a building
 2. adding various properties and methods
 3. create two structs, House and Office, that conform to it
 
 Requirements:
 1. A property storing how many rooms it has.
 2. A property storing the cost as an integer (e.g. 500,000 for a building costing $500,000.)
 3. A property storing the name of the estate agent responsible for selling the building.
 4. A method for printing the sales summary of the building, describing what it is along with its other properties.
 
 */

// Code
protocol Property { // declare the protocols
    var numberOfRoom : Int { get }
    var cost : Int { get set }
    var estateAgent : String { get set }
    func printSalesSummary()
}

extension Property { // use extension protocol to make code more clean when create struct
    func printSalesSummary() {
        print("This is a house with \(numberOfRoom) rooms. It costs \(cost) and is being sold by \(estateAgent)")
    }
}

struct House : Property { // create the struct with the protocol
    let numberOfRoom : Int
    var cost : Int
    var estateAgent : String
}

let house = House(numberOfRoom: 5, cost: 1_000_000_000, estateAgent: "Parjo")
house.printSalesSummary()

struct Office : Property { // another struct with the protocol
    var numberOfRoom : Int
    var cost : Int
    var estateAgent : String
}
let office = Office(numberOfRoom: 40, cost: 20_000_000_000, estateAgent: "Jonggol")
office.printSalesSummary()
