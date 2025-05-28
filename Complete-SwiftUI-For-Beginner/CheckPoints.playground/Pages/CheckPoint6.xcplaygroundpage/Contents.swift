// Check Point 6

/*
 Goals :
  1. create a struct to store information about a car, including its model, number of seats, and current gear
  2. add a method to change gears up or down
 
 Have a think about variables and access control: what data should be a variable rather than a constant, and what data should be exposed publicly? Should the gear-changing method validate its input somehow?
 */

// Code
struct Car {
    let model: String
    let numberOfSeats: Int
    private var currentGear: Int {
        didSet {
            if currentGear == 0 {
                print("You are at neutral gear")
            } else if currentGear == -1 {
                print("You are in reverse gear")
            } else {
                print("You are now in gear \(currentGear)")
            }
        }
    }
    
    init(model: String, numberOfSeats: Int) {
        self.model = model
        self.numberOfSeats = numberOfSeats
        currentGear = 0
    }
    
    func showCurrentGear() {
        if currentGear == 0 {
            print("You are in netral gear")
        } else if currentGear == -1 {
            print("You are in reverse gear")
        } else {
            print("You are in gear \(currentGear)")
        }
    }
    
    mutating func changeGearUp() {
        if currentGear < 10 && currentGear >= 0 {
            currentGear += 1
        } else if currentGear == -1 {
            print("You are in reverse gear, please put to neutral gear first")
        } else {
            print("Your already in maximum gear")
        }
    }
    
    mutating func changeGearDown() {
        if currentGear >= 1 {
            currentGear -= 1
        } else if currentGear == 0 {
            print("You are in netral gear, cannot go down further")
        }
        else if currentGear == -1 {
            print("You are in reverse gear, cannot go down further")
        } else {
            print("You are already in minimum gear, cannot go down further")
        }
    }
    
    mutating func changeGearToNetral() {
        if currentGear == 0 {
            print("You are already in netral gear")
        } else {
            currentGear = 0
        }
    }
    
    mutating func changeGearToReverse() {
        if currentGear != 0 {
            print("Please put to netral gear first")
        } else if currentGear == -1 {
            print("You are already in reverse gear")
        } else {
            currentGear = -1
        }

    }
    
}

var toyota = Car(model: "Toyota Corolla", numberOfSeats: 5)
toyota.showCurrentGear()
toyota.changeGearUp()
toyota.changeGearDown()
toyota.changeGearDown()
toyota.showCurrentGear()
toyota.changeGearToReverse()
toyota.changeGearUp()
toyota.changeGearToNetral()
