//: [Previous](@previous)

import Foundation


// MARK: - Protocol Composition
// Protocol & Protocol & Protocol

protocol Resettable {
    func reset()
}

protocol Printable {
    func printValue()
}

class Size: Resettable, Printable {
    var width: Double = 0.0
    var height: Double = 0.0
    
    func reset() {
        width = 0.0
        height = 0.0
    }
    
    func printValue() {
        print(width, height)
    }
}

let resettable: Resettable = Size()
let printable: Printable = Size()

var resetAndPrint: Resettable & Printable = Size()
// 두 protocol을 모두 채용한 Type만 올 수 있다.
// resetAndPrint = Circle()


class Circle: Resettable {
    var radius: Double = 0.0
    
    func reset() {
        radius = 0.0
    }
}

class Oval: Circle {
    
}

var circleAndReset: Circle & Resettable = Circle()
circleAndReset = Oval()


//: [Next](@next)
