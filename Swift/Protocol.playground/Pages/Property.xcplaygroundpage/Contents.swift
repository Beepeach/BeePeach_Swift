//: [Previous](@previous)

import Foundation

// MARK: - Property

// let과 var로 변수를 구별하지 않는다.
// var만 사용할 수 있다. 단지 프로퍼티라는것을 의미
// 저장, 계산을 구분하지 않는다. 해당 이름과 타입만 만족시키면 된다.
// 가변성은 get set으로 표시한다.

/*
protocol ProtocolName {
    var name: Type { get set }
    static var name: Type { get set }
}
*/

protocol Figure {
    var name: String { get }
}

struct Rectangle: Figure {
    let name: String = "Rectangle"
}

struct Triangle: Figure {
    var name: String = "Triangle"
}

struct Circle: Figure {
    var name: String {
        return "Circle"
    }
}


// Static으로 선언해도 class로 해도 된다. 꼭 static을 사용하는게 아니다.
protocol SomeObject {
    static var name: String { get }
}

class Object: SomeObject {
    class var name: String {
        get {
            return "Object"
        }
        set {
            
        }
    }
}




//: [Next](@next)
