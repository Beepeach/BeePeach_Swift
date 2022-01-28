//: [Previous](@previous)

import Foundation

// MARK: - Type Methods
// static class keyword
// Type 이름으로 접근합니다.

class Circle {
    static let pi: Double = 3.14
    var radius: Double = 1.0
    
    func getArea() -> Double {
        return radius * radius * Self.pi
    }
    
    class func printPi() {
        print(self.pi)
        // self.radius
    }
}

Circle.printPi()

let circle: Circle = Circle()
circle.getArea()


// static으로 선언하면 override가 불가능하다.
class StrokeCircle: Circle {
    override static func printPi() {
        print("StokeCircle", pi)
    }
}

StrokeCircle.printPi()


//: [Next](@next)
