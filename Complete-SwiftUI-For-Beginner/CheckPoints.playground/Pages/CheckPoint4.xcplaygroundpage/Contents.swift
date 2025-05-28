// Check Point 4

/*
 Goals :
 1. write a function that accepts an integer from 1 through 10,000
 2. returns the integer square root of that number

 Constraint :
 1. You can’t use Swift’s built-in sqrt() function or similar – you need to find the square root yourself.
 2. If the number is less than 1 or greater than 10,000 you should throw an “out of bounds” error.
 3. You should only consider integer square roots – don’t worry about the square root of 3 being 1.732, for example.
 4. If you can’t find the square root, throw a “no root” error.

 As a reminder, if you have number X, the square root of X will be another number that, when multiplied by itself, gives X.
 So, the square root of 9 is 3, because 3x3 is 9, and the square root of 25 is 5, because 5x5 is 25.

 */

import Foundation  // to handle error not covered

// Code
enum SquareRootError: Error {
    case outOfBounds
    case noRoot
}

func mySqrt(_ input: Int) throws -> Int {
    if input < 1 || input > 10_000 {
        throw SquareRootError.outOfBounds
    }
    for num in 1...input {
        if num * num == input {
            return num
        }
    }
    throw SquareRootError.noRoot
}

let number: Int = 625
do {
    let result = try mySqrt(number)
    print("Square root of \(number) is: \(result)")
} catch SquareRootError.outOfBounds {
    print("Number is out of bounds")
} catch SquareRootError.noRoot {
    print("No integer square root exists")
} catch {
    print("Error occurred: \(error.localizedDescription)")
}
