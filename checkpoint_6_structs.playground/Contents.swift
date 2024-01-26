import Cocoa

// Create a struct to store information about a car, including its model, number of seats, and current gear,then add a method to change gears up or down.

// Have a think about variables and access control: what data should be a variable rather than a constant, and what data should be exposed publicly?

/* 
    Should the gear-changing method validate its input somehow? 3 states we validate for gearChanges:
           
            1. Make sure initialGear is inside 1...10 range
            2. If initialGear is == 1 or 10, then set a 'Already lowest/highest number'
            3. If initialGear is outside of our 1...10 range then let them know by showing an error.

 */

// Create Car Struct
struct Car {
    
    // Properties (information about the car): model, numberOfSeats, currentGear
    let model: String               // have to set type annotation and perhaps default values
    let numberOfSeats: Int
    var currentGear: Int
    
    
    
    // Initializer (optional but useful to clarify)
    init(model: String, numberOfSeats: Int, initialGear: Int) {
        self.model = model
        self.numberOfSeats = numberOfSeats
        // We want in range 1 - 10, can be 1 and 10 (inclusive)
        
        if initialGear < 1 || initialGear > 10 {
            print("Invalid gear. Please select between 1...10")
            self.currentGear = initialGear
        }
        self.currentGear = initialGear
    }
    
    // Add throw error-handling later **********
    
    
    
    // Method to change gears up
    mutating func changeGearUp() {
        // If the initial gear is between 1 and 10ex then ok.
        if currentGear >= 1 && currentGear < 10 {
            currentGear += 1
            print("Changing gears up to: \(currentGear)")
        } else if currentGear == 10 {
            print("Already at highest gear.")
        } else {
            print("Invalid range. Please reset initial value.")
        }
    }
    
    // Method to change gears down
    mutating func changeGearDown() {
        // If the initial gear is between 1ex and 10 then ok.
        if currentGear > 1 && currentGear <= 10 {
            currentGear -= 1
            print("Changing gears down to: \(currentGear)")
        } else if currentGear == 1 {
            print("Already at lowest gear.")
        } else {
            print("Invalid range. Please reset initial value.")
        }
    }
}
  

// Example usage
var newCar = Car(model: "Benz", numberOfSeats: 2, initialGear: 10)
print(newCar)
newCar.changeGearUp()
newCar.changeGearUp()
newCar.changeGearDown()
newCar.changeGearDown()
newCar.changeGearDown()

