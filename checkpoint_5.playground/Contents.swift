import Cocoa

// Checkpoint 5: Closures

// Your input is: 
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

// Filter out any numbers that are even
// Sort the array in ascending order
// Map to strings in format "7 is a lucky number"
// Print resulting array, one item per line

// Chain operations together and print the resulting array, one item per line
let result: () = luckyNumbers
    .filter { !$0.isMultiple(of: 2) }
    .sorted { $0 < $1 }
    .map { "\($0) is a lucky number" }
    .forEach { print($0) }
