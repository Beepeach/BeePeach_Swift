//: [Previous](@previous)

import Foundation

struct Point {
    var x: Double
    var y: Double
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    init(value: Double) {
        self.init(x: value, y: value)
    }
}

var zero: Point = Point(value: 0.0)


//: [Next](@next)
