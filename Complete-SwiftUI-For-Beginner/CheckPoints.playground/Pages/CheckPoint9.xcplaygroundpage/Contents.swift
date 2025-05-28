// Check Point 9

/*
 Goals:
 1. write a function that accepts an optional array of integers, and returns one randomly.
 2. If the array is missing or empty, return a random number in the range 1 through 100.
 */

// Code
func randomNumber(from numbers: [Int]?) -> Int { numbers?.randomElement() ?? Int.random(in: 1...100)}

let result1 = randomNumber(from: [1, 2, 3])
let result2 = randomNumber(from: nil)
let result3 = randomNumber(from: [])

print("Result 1: \(result1)")
print("Result 2: \(result2)")
print("Result 3: \(result3)")
