// Check Point 3

/*
 Goals :
  - Creating Fizz Buzz
     1. If it’s a multiple of 3, print “Fizz”
     2. If it’s a multiple of 5, print “Buzz”
     3. If it’s a multiple of 3 and 5, print “FizzBuzz”
     4. Otherwise, just print the number.

 */

// Code

// using for loops
for i in 1...100 {
    if i.isMultiple(of: 3) {
        if i.isMultiple(of: 5) {
            print("FizzBuzz")
            continue
        } else {
            print("Fizz")
            continue
        }
    } else if i.isMultiple(of: 5) {
        print("Buzz")
        continue
    }
    print(i)
}

// using while loops
var number = 1
repeat {
    if number.isMultiple(of: 3) && number.isMultiple(of: 5) {
        print("FizzBuzz")
    } else if number.isMultiple(of: 3) {
        print("Fizz")
    } else if number.isMultiple(of: 5) {
        print("Buzz")
    } else {
        print(number)
    }
    number += 1
} while number <= 100
