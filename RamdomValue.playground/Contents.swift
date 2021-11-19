import UIKit
import Darwin

// MARK: - Number

// Int
Int.random(in: 0 ... 100)
UInt.random(in: 0 ... 100)

// UInt32
arc4random()
arc4random_uniform(100)

// Float
Float.random(in: 1.0 ... 5.0)


// Double
Double.random(in: 1.0 ... 4.12)
drand48()

// CGFloat
CGFloat.random(in: 1.0 ... 5.0)




// MARK: - String
let uuid: String = UUID().uuidString

extension String {
    func generateRandom(length: Int) -> String {
        let characters: [Element] = (0 ..< length).map { _ in self.randomElement() ?? "a" }
        
        return String(characters)
    }
}

let str = "abcdefghhijklmnopqrstuvwxyz"
str.generateRandom(length: 10)


