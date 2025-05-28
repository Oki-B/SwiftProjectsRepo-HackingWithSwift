// Check Point 2

/*
 Goals :
 1. create an array of strings
 2. write some code that prints the number of items in the array and also the number of unique items in the array.
 */

// Code
let countries: [String] = [
    "Canada", "France", "Germany", "Italy", "Japan", "United Kingdom",
    "United States", "Canada", "France", "United States", "Singapore",
    "Indonesia", "Thailand", "Malaysia", "United Kingdom",
]

print(countries.count)  // print number of all items in array
let uniqueCountries: Set<String> = Set(countries)
print(uniqueCountries.count) // print number of unique items in array
print(uniqueCountries)
