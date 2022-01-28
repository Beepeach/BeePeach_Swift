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


// MARK: - Override

class SomeSuperClass {
    init() {
        
    }
}

class SomeSubClass: SomeSuperClass, SomeProtocol {
    required override init() {
        
    }
}

protocol SomeProtocol {
    init()
}

final class FinalClass: SomeProtocol {
    init() {
        
    }
}


// MARK: - Failable Init

protocol Failable {
    var name: String { get }
    
    init?(name: String)
}

class Desk: Failable {
    var name: String
    
    required init?(name: String) {
        if name.isEmpty {
            return nil
        } else {
            self.name = name
        }
    }
}

class Chair: Failable {
    var name: String
    
    required init(name: String) {
        self.name = name
    }
}

let desk: Desk? = Desk(name: "")
let chair: Chair? = Chair(name: "ChaCha")

desk?.name
chair?.name


protocol NonFailable {
    var name: String { get }
    
    init(name: String)
}

/*
class Person: NonFailable {
    let name: String
    
    required init?(name: String) {
        if name.isEmpty {
            return nil
        } else {
            self.name = name
        }
    }
}
*/

//: [Next](@next)
