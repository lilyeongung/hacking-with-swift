import Cocoa

// How to create your own Structs
struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

// Swift’s structs let us create our own custom, complex data types, complete with their own variables and their own functions.

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()

struct Employee {
    let name: String        // constant property (can't change)
    var vacationRemaining = 14      // variable property

    // needs mutating func for changing variables
    mutating func takeVacation(days: Int) {     // functions become methods
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

//var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)   // instance & initializer
//archer.takeVacation(days: 5)
//print(archer.vacationRemaining)


// How to compute property values dynamically
struct Employee2 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var archer = Employee2(name: "Sterling Archer", vacationAllocated: 14)
archer.vacationTaken += 4
print(archer.vacationRemaining)
archer.vacationTaken += 4
print(archer.vacationRemaining)


// How to take action when a property changes

// Swift lets us create property observers, which are special pieces of code that run when properties change.
// These take two forms: a didSet observer to run when the property just changed, and a willSet observer to run before the property changed.
struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }

        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")


// How to create custom initializers
struct Player {
    let name: String
    let number: Int

    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99) // must assign values to all properties before being able to call
    }
}

let player = Player(name: "Megan R")
print(player.number)
