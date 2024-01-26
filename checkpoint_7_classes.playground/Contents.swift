import Cocoa

// Make class hierarchy for animals

/* Checkpoint_7: Animal Class Hierarchy
 
 The Animal class should have a legs integer property that tracks how many legs the animal has.
 
 The Dog class should have a speak() method that prints a generic dog barking string, but each of the subclasses should print something slightly different.
 
 The Cat class should have a matching speak() method, again with each subclass printing something different.
 
 The Cat class should have an isTame Boolean property, provided using an initializer.
 
 */

// Main animal class
class Animal {
    var legs: Int
    // initialize legs
    init(legs: Int) {
        self.legs = legs
    }
}
// Subclass Dog inherit legs from Animal
class Dog: Animal {
    func speak() {
        print("Woof, Woof!")
    }
}
// Subclass inherit from Dog and different speak() method
class Shitzu: Dog {
    override func speak() {
        print("Shi~ Shi~")
    }
}
class GermanShepherd: Dog {
    override func speak() {
        print("Rawf~ Rawf~")
    }
}

class Cat: Animal {
    var isTame: Bool
    
    init(isTame: Bool, legs: Int) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    func speak() {
        print("Meow, Meow!")
    }
}
class RussianBlue: Cat {
    override func speak() {
        print("Keee~ Keee~")
    }
}
class Bengal: Cat {
    override func speak() {
        print("MoMo~ Yaa~")
    }
}


// Example usage
let shitzu = Shitzu(legs: 5)
shitzu.speak()

let germanShepherd = GermanShepherd(legs: 4)
germanShepherd.speak()
germanShepherd.legs = 3
print(germanShepherd.legs)

let russianBlue = RussianBlue(isTame: true, legs: 4)
russianBlue.speak()

let bengal = Bengal(isTame: false, legs: 4)
bengal.speak()

bengal.isTame = true

