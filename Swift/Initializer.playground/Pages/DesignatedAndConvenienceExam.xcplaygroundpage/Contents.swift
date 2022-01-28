//: [Previous](@previous)

import Foundation

/*
init(parameter) {
    statement
}

convenience init(parameter) {
    statement
}
*/


// Two Phase Example

class Figure {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "Figure")
    }
}

class Rectangle: Figure {
    let width: Double
    let height: Double
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
        
        super.init(name: "Rectangle")
    }
}
 
 //: [Next](@next)
