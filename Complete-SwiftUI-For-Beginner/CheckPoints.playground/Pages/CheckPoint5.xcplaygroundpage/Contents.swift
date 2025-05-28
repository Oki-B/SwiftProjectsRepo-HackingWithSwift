// Check Point 5

/*

Goals :
 1. Filter out any numbers that are even
 2. Sort the array in ascending order
 3. Map them to strings in the format “7 is a lucky number”
 4. Print the resulting array, one item per line

 Output should be :
 7 is a lucky number
 15 is a lucky number
 21 is a lucky number
 31 is a lucky number
 33 is a lucky number
 49 is a lucky number

 */

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

func filterNumbers(numbers: [Int]) -> [Int] {
    return luckyNumbers.filter { !$0.isMultiple(of: 2) }
}

func sortNumbers(numbers: [Int]) -> [Int] {
    return numbers.sorted()
}

func printNumbers(numbers: [Int]) {
    numbers.map { number in
        print("\(number) is a lucky number")
    }
}

// how we pass a function as a parameter in other function
func generateLuckyNumber(
    numbers: [Int],
    filter: (_ numbers: [Int]) -> [Int],
    sort: (_ filteredNumbers: [Int]) -> [Int],
    print: (_ sortedNumbers: [Int]) -> Void
) {
    let filteredNumbers = filter(numbers)
    let sortedNumbers = sort(filteredNumbers)
    printNumbers(numbers: sortedNumbers)
}

generateLuckyNumber(
    numbers: luckyNumbers,
    filter: filterNumbers,
    sort: sortNumbers,
    print: printNumbers
)
