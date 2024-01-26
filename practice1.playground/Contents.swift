import Cocoa

// last timed: 6min 26sec on 1/18/24

// Checkpoint 4: findIntegerSquareRoot throw function

// define possible errors that might happen
enum SquareRootError: Error {
    case noRoot
    case outOfBounds
}

/* 
 
 - write a function that accepts an integer from 1 through 10,000, and returns the integer square root of that number.
 
 - You can’t use Swift’s built-in sqrt() function or similar – you need to find the square root yourself.
 
 - If the number is less than 1 or greater than 10,000 you should throw an “out of bounds” error.

 - If you can’t find the square root, throw a “no root” error.

*/

// function
func findIntSquareRoot(for number: Int) throws -> Int {
    if number < 1 || number > 10_000 {
        throw SquareRootError.outOfBounds
    }
    for i in 1...100 {
        if i * i == number {
            return i
        }
    }
    throw SquareRootError.noRoot
}

let input = 121
// call & do error-handling
do {
    let result = try findIntSquareRoot(for: input)
} catch SquareRootError.noRoot {
    print("No square root.")
} catch SquareRootError.outOfBounds {
    print("Out of bounds.")
} catch {
    print("There was an error: \(error.localizedDescription)")
}
    
    
    
    

