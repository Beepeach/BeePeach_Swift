//: [Previous](@previous)

import Foundation


// MARK: - Required init
// subclass에서 반드시 구현하도록 하고 싶을때
// subclass의 모든 속성이 기본값이 있고 init을 구현하지 않아
// overriede keyword를 사용하지 않는다.

class Figure {
    var name: String
    
    required init(name: String) {
        self.name = name
    }
    
    func draw() {
        print("draw \(name)")
    }
}

class Rectangle: Figure {
    var width: Double = 0.0
    var height: Double = 0.0
    
    init() {
        width = 0.0
        height = 0.0
        super.init(name: "unknown")
    }
    
    required init(name: String) {
        width = 0.0
        height = 0.0
        super.init(name: name)
    }
}



// MARK: - Exam

class SomeClass {
    init() {
        
    }
}

class SomeSubClass: SomeClass {
    let depth: Int
    
    init(depth: Int) {
        self.depth = depth
    }
    
    required override init() {
        self.depth = 1
        super.init()
    }
}

class SomeThirdSubClass: SomeSubClass {
    let description: String
    
    required init() {
        self.description = "This is ThirdSubClass"
        super.init(depth: 2)
    }
}


//: [Next](@next)
