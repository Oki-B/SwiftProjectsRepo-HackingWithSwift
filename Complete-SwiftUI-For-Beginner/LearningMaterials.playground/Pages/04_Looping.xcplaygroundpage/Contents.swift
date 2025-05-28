// DAY 6 PART 1
// How to use a for loop to repeat work

// example of use
let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works great on \(os).")
}
// we can call os with another variable it's call loop variable as example :
for name in platforms {
    print("Swift works great on \(name).")
}
// or
for rubberChicken in platforms {
    print("Swift works great on \(rubberChicken).")
}
// works exactly same

// loop over a fixed range of numbers :
for i in 1...12 {
    print("5 x \(i) is \(5 * i)")
}

// nested loop
for i in 1...12 {
    print("The \(i) times table:")

    for j in 1...12 {
        print("  \(j) x \(i) is \(j * i)")
    }

    print()  // space for clear terminal view
}

// build range operator on swift is 1...5 = (...) and 1..<5 = (..<)
for i in 1...5 {
    print("Counting from 1 through 5: \(i)")
}

print()  // space for clear terminal view

for i in 1..<5 {
    print("Counting 1 up to 5: \(i)")
}

// if you dont want to loop a variable or use the variable you can use underscores (_)
var lyric = "Haters gonna"

for _ in 1...5 {
    lyric += " hate"
}

print(lyric)

// DAY 6 PART 2

// How to use a while loop to repeat work

// basic example :
var countdown = 10

while countdown > 0 {
    print("\(countdown)…")
    countdown -= 1
}

print("Blast off!")

// Random built in
let id = Int.random(in: 1...1000)  // creates a new integer between 1 and 1000
let amount = Double.random(in: 0...1)  // creates a random decimal between 0 and 1

// another example to use while loop
// create an integer to store our roll
var roll = 0

// carry on looping until we reach 20
while roll != 20 {
    // roll a new dice and print what it was
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}

// if we're here it means the loop ended – we got a 20!
print("Critical hit!")

// DAY 6 PART 3
// How to skip loop items with break and continue

// continue to skip one iteration while looping, example:
let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }

    print("Found picture: \(filename)")
}

// to break whole iteration while looping, example :
let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)

        if multiples.count == 10 {
            break
        }
    }
}

print(multiples)

// use labeled statement to break over nested loop, example :

let options = ["up", "down", "left", "right"]
let secretCombination = ["up", "up", "right"]

// without labeled statement, break not gonna works
for option1 in options {
    for option2 in options {
        for option3 in options {
            print("In loop")
            let attempt = [option1, option2, option3]

            if attempt == secretCombination {
                print("The combination is \(attempt)!")
                break
            }
        }
    }
}

// with labeled statement, break gonna works
outerLoop: for option1 in options {
    for option2 in options {
        for option3 in options {
            print("In loop without break")
            let attempt = [option1, option2, option3]

            if attempt == secretCombination {
                print("The combination is \(attempt)!")
                break outerLoop
            }
        }
    }
}

// Repeat loops

// The third way of writing loops is not commonly used, but it’s so simple to learn we might as well cover it: it’s called the repeat loop, and it’s identical to a while loop except the condition to check comes at the end.
var number = 1

repeat {
    print(number)
    number += 1
} while number <= 20

print("Ready or not, here I come!")

// create somthing like this will get a warn from xcode
while false {
    print("This is false")
}

// so we can create use repeat loop
repeat {
    print("This is false")
} while false
