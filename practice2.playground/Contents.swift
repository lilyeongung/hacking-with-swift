import Cocoa

struct Car {
    // Properties
    let model: String
    let numberOfSeats: Int
    private(set) var currentGear: Int

    // Enum to represent custom errors
    enum GearError: Error {
        case invalidGear
    }

    // Initializer
    init(model: String, numberOfSeats: Int, initialGear: Int) throws {
        self.model = model
        self.numberOfSeats = numberOfSeats

        // Validate the initial gear value
        guard initialGear >= 1 && initialGear <= 10 else {
            throw GearError.invalidGear
        }

        self.currentGear = initialGear
    }

    // Method to change gears up
    mutating func changeGearUp() {
        if currentGear < 10 {
            currentGear += 1
            print("Changing gears up.")
        } else {
            print("Already in the highest gear.")
        }
    }

    // Method to change gears down
    mutating func changeGearDown() {
        if currentGear > 1 {
            currentGear -= 1
            print("Changing gears down.")
        } else {
            print("Already in the lowest gear.")
        }
    }
}

// Example usage with initializer and error handling
do {
    var myCar = try Car(model: "Toyota Camry", numberOfSeats: 5, initialGear: 11)
    print("Current gear: \(myCar.currentGear)")

    myCar.changeGearUp()
} catch Car.GearError.invalidGear {
    print("Invalid initial gear. Please choose a gear between 1 and 10.")
} catch {
    print("An unexpected error occurred: \(error)")
}
