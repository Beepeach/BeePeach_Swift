//: [Previous](@previous)

import Foundation

class Figure {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "Unknown")
    }
}

class Rectangle: Figure {
    let width: Double
    let height: Double
    
    init(width: Double, height: Double, name: String) {
        self.width = width
        self.height = height
        super.init(name: name)
    }
    
    convenience override init(name: String) {
        self.init(width: 0, height: 0, name: name)
    }
}



//: [Next](@next)
