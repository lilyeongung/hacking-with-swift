import Cocoa

var greeting = "Hello, playground"

var name = "Ted"
name = "Rebecca"

let user = "Daphne"
print(user)

// let actor = "Tom Cruise 🏃‍♂️" CTRL + CMD + Space for emoji browser
let actor = "Tom Cruise 👨🏻‍💻"

// double quotes inside your string, place a backslash before them:
let quote = "He tapped a sign saying \"Believe\" and walked away."


// string that spans multiple lines, start and end with three double quotes, like this:
let movie = """
A day in
the life of an
Apple engineer
"""

// Swift provides many useful properties and methods for strings, including .count to read how many letters it has:
print(actor.count)

// hasPrefix() and hasSuffix(), which lets us know whether a string starts or ends with specific letters:
print(quote.hasPrefix("He"))
print(quote.hasSuffix("Away."))

// Integers come with their own useful functionality, such as the isMultiple(of:) method:
let number = 120
print(number.isMultiple(of: 3))

// You can also make random integers in a specific range, like this:
let id = Int.random(in: 1...1000)


// Dictionaries store multiple values according to a key we specify. For example, we could create a dictionary to store information about a person:
let employee = [
    "name": "Taylor",
    "job": "Singer"
]
// To read data from the dictionary, use the same keys you used when creating it:
print(employee["name", default: "Unknown"])
print(employee["job", default: "Unknown"])


// Sets
// Sets are similar to arrays, except you can’t add duplicate items, and they don’t store items in a particular order.
// This makes a set of numbers:
var numbers = Set([1, 1, 3, 5, 7])
print(numbers)

// Remember, the set will ignore duplicate values, and it won’t remember the order used in the array.
// Adding items to a set is done by calling its insert() method, like this:
numbers.insert(10)

// Sets have one big advantage over arrays: using contains() on a set is effectively instant no matter how many items the set contains – even a set with 10,000,000 items will respond instantly.
numbers.contains(11)


// Enums
// 1. First, define the errors that can occur:
enum PasswordError: Error {
    case short, obvious
}

// 2. Next, write a function that can throw errors. This is done by placing throws into the function’s type, then by using throw to trigger specific errors:
func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }

    if password == "12345" {
        throw PasswordError.obvious
    }

    if password.count < 10 {
        return "OK"
    } else {
        return "Good"
    }
}

// 3. Now call the throwing function by starting a do block, calling the function using try, then catching errors that occur:
let string = "12345"
do {
    let result = try checkPassword(string)
    print("Rating: \(result)")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}
//** When it comes to catching errors, you must always have a catch block that can handle every kind of error.


// Closures: chunks of code with functionality you can call at anytime.
// You can assign functionality directly to a constant or variable like this:

/* let sayHello = {
    print("Hi there!")
} */

// sayHello()
// In that code, sayHello is a closure – a chunk of code we can pass around and call whenever we want. If you want the closure to accept parameters, they must be written inside the braces:
let sayHello = { (name: String) -> String in
    "Hi \(name)!"
}
/* The in is used to mark the end of the parameters and return type – everything after that is the body of the closure itself.

Closures are used extensively in Swift. For example, there’s an array method called filter() that runs all elements of the array through a test, and any that return true for the test get returned in a new array.

We can provide that test using a closure, so we could filter an array to include only names that begin with T: */
let team = ["Gloria", "Suzanne", "Tiffany", "Tasha"]

let onlyT = team.filter({ (name: String) -> Bool in
    return name.hasPrefix("T")
} )
