import Cocoa

// last timed: 1min 10sec on 1/31/24

// Checkpoint 9: Optionals

// write a function that accepts an optional array of integers, and returns one randomly. If the array is missing or empty, return a random number in the range 1 through 100.

func getRandomValue(from array: [Int]?) -> Int { return array?.randomElement() ?? Int.random(in: 1...100) }

let newArray: [Int] = []
print(getRandomValue(from: newArray))
























