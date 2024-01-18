import Cocoa
// ANOTHER SOLUTION
//for number in 1...100 {
//    // Check for multiples of both 3 and 5 first
//    if number.isMultiple(of: 3) && number.isMultiple(of: 5) {
//        print("FizzBuzz")
//    } else if number.isMultiple(of: 3) {
//        print("Fizz")
//    } else if number.isMultiple(of: 5) {
//        print("Buzz")
//    } else {
//        // If not a multiple of 3 or 5, print the number
//        print(number)
//    }
//}

import Cocoa

var number = 0

// for loop from 1 to 100, and for each #:
for _ in 1...100 {
    number += 1
    // if multiple of 3 & 5, print "FizzBuzz"
    if number.isMultiple(of: 3) && number.isMultiple(of: 5) {
        print("FizzBuzz")
       
    // if multiple of 5, print "Buzz".
    } else if number.isMultiple(of: 5) {
        print("Buzz")
    
    // if multiple of 3, print "Fizz".
    } else if number.isMultiple(of: 3) {
        print("Fizz")
        
    // otherwise print #
    } else {
        print(number)
    }
}
