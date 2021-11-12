//: [Previous](@previous)

import Foundation

// MARK: - Initializer Delegation

struct Size {
    var width: Double
    var height: Double
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
}


// MARK: - Class Delegation

// 1. desi는 superclass의 desi를 호출해야한다 Delegate Up
// 2. con은 동일한 class의 다른 init을 호출해야한다. Delegate Across
// 3. con은 최종적으로 동일 class의 desi가 호출되어야한다.

class Figure {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "unknown")
    }
}

class Rectangle: Figure {
    var width: Double = 0.0
    var height: Double = 0.0
    
    init(name: String, width: Double, height: Double) {
        self.width = width
        self.height = height
        super.init(name: name)
    }
    
    convenience init(value: Double) {
        self.init(name: "Rect", width: value, height: value)
    }
}

class Square: Rectangle {
    // 상속받은 init을 호출한다.
    convenience init(value: Double) {
        self.init(name: "Square", width: value, height: value)
    }
    
    convenience init() {
        self.init(value: 0.0)
    }
}


// MARK: - Two - Phase Init


//: [Next](@next)
