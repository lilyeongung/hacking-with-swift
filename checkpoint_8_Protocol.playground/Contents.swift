import Cocoa

// Checkpoint 8: Protocols

/*
 
 Make a protocol that describes a building. It should require:
 
     A property storing how many rooms it has.
     A property storing the cost as an integer (e.g. 500,000 for a building costing $500,000.)
     A property storing the name of the estate agent responsible for selling the building.
     A method for printing the sales summary of the building, describing what it is along with its other properties.
 
 2 Structs: House and Office that conform to it
 
 */

protocol Building {
    var numberOfRooms: Int { get }
    var cost: Int { get }
    var estateAgent: String { get }
    
    func salesSummary()
}

struct House: Building {
    let type = "House"
    let numberOfRooms: Int
    let cost: Int
    var estateAgent = "Andrew Park"
    
    func salesSummary() {
        print("\(type) with \(numberOfRooms) rooms. Cost: $\(cost). Sold by: \(estateAgent)")
    }
}
struct Office: Building {
    let type = "Office"
    let numberOfRooms: Int
    let cost: Int
    var estateAgent = "Bruce Lee"
    
    func salesSummary() {
        print("\(type) with \(numberOfRooms) rooms. Cost: $\(cost). Sold by: \(estateAgent)")
    }
}
var myHouse = House(numberOfRooms: 5, cost: 500_000, estateAgent: "JPx")
myHouse.salesSummary()

var myOffice = Office(numberOfRooms: 15, cost: 500_000_000, estateAgent: "Grandma P")
myOffice.salesSummary()

