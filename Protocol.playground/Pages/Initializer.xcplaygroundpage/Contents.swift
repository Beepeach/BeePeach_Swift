//: [Previous](@previous)

import Foundation

// MAKR: - Initializer
// func와 마찬가지로 헤더부분만 작성한다.

/*
protocol ProtocolName {
    init(parameter)
    init?(parameter)
}
*/

protocol Figure {
    var name: String { get }
    init(name: String)
}

// 운이 좋게 Memberwise init이 요구사항을 만족시켜준다.
struct Rectangle: Figure {
    var name: String
}


// classs는 상속을 고려해야하므로 required를 적어야한다.
// 예외 사항은 final class라면 괜찮다.
class Circle: Figure {
    var name: String
    
    required init(name: String) {
        self.name = name
    }
}

// required를 안붙여줘도 된다.
final class Triangle: Figure {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

// 중복된 프로토콜 선언은 에러가 발생
/*
class Oval: Circle, Figure {
    
}
*/

class Obal: Circle {
    var prop: Int
    
    init() {
        prop = 0
        super.init(name: "Oval")
    }
    
    required convenience init(name: String) {
        self.init()
    }
}


protocol Grayscale {
    init(white: Double)
}

// non-Failuralbe을 Failurable로 충족시킬수 없다.
// 하지만 거꾸로는 가능하다.

/*
struct Color: Grayscale {
    init?(white: Double) {
        
    }
}
*/

//: [Next](@next)
