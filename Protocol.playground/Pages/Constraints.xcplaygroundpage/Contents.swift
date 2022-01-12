//: [Previous](@previous)

import Foundation

extension Collection where Element: Numeric {
    func isNumbers() {
        print("It's numbers")
    }
}

let numbers: [Int] = [1, 2, 3,4 ]
let strings: [String] = ["A", "B", "C"]

numbers.isNumbers()

// strings.isNumbers()

//: [Next](@next)
