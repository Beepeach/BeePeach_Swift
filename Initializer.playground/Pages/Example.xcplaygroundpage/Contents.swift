//: [Previous](@previous)

import Foundation

class Position {
    var width: Double
    var height: Double
    
    init() {
        self.width = 1.0
        self.height = 1.0
    }
    
    init(value: Double) {
        width = value
        height = value
    }
}

let position: Position = Position(value: 21.0)
position.width
position.height










//: [Next](@next)
