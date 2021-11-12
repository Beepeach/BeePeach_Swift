//: [Previous](@previous)

import Foundation

// MARK: - Failable Init
// 실패를 허용하는 init
// 실패시 nil을 리턴한다.

/*
init?(parameter) {
    
}

init!(parameter) {
    
}
*/

struct Position {
    let x: Double
    let y: Double
    
    init?(x: Double, y: Double) {
        guard x >= 0.0, y >= 0.0 else { return nil }
        
        self.x = x
        self.y = y
    }
    
    init!(value: Double) {
        guard value >= 0.0 else { return nil }
        
        self.x = value
        self.y = value
    }
    
    // overloading에서는 failable과 nonfailable을 구별하지 않는다.
    /*
    init(value: Double) {
        self.x = value
        self.y = value
    }
    */
}

var a: Position? = Position(x: 12, y: 34)
var b: Position? = Position(x: -12, y: -34)

var c: Position = Position(value: 12)
// var d: Position = Position(value: -12)



//: [Next](@next)
