//: [Previous](@previous)

import UIKit


// MARK: - Initializer


protocol Aged {
    init(age: Int)
}

protocol Figure {
    var name: String { get }
    
    init(name: String)
}


struct Triangle: Figure {
    let name: String
}

let triangle: Triangle = Triangle(name: "Triangle")

class Circle: Figure {
    let name: String
    
    required init(name: String) {
        self.name = name
    }
}

class Elipse: Circle {
    let origin: CGPoint
    
    required init(name: String) {
        self.origin = CGPoint(x: 0, y: 0)
        super.init(name: "Elipse")
    }
}


protocol SomeProtocol {
    init()
}

class SomeSuperClass {
    init() {
        
    }
}

class SomeSubClass: SomeSuperClass, SomeProtocol {
    required override init() {
        
    }
}


//: [Next](@next)
