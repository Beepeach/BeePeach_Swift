//: [Previous](@previous)

import Foundation

// Method
// 헤더만 작성해주면 된다.
// mutating을 사용해도 class에서 구현할 수 있따.


/*
protocol ProtocolName {
    func name(parameter) -> ReturnType
    static func name(parameter) -> ReturnType
    mutating func name(parameter) -> ReturnType
}
*/

protocol Resettable {
    mutating func reset()
}

struct Size: Resettable {
    var width: Double = 0.0
    var height: Double = 0.0
    
    mutating func reset() {
        self.width = 0.0
        self.height = 0.0
    }
}

class SizeObject: Resettable {
    var width: Double = 0.0
    var height: Double = 0.0
    
    func reset() {
        self.width = 0.0
        self.height = 0.0
    }
}


//: [Next](@next)
