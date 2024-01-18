import Cocoa

func areLettersIdentical(string1: String, string2: String) -> Bool {
    string1.sorted() == string2.sorted()
}

func pythagoras(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}

let c = pythagoras(a: 3, b: 4)
print(c)


func isEveryoneAdult(ages: [Int]) -> Bool {
    for age in ages {
        if age < 18 {
            return false
        }
    }
    return true
}
isEveryoneAdult(ages: [22, 20, 21, 24])
