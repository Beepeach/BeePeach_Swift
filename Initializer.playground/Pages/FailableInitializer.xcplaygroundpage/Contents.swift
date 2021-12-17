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

class Position {
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
    
//    init(value: Double) {
//        self.x = value
//        self.y = value
//    }
    
}

var a: Position? = Position(x: 10, y: 10)
var b: Position? = Position(x: -10, y: -10)

print(a?.x as Any)
print(b?.x as Any)

//var c: Position = Position(value: 20)
// var d: Position = Position(value: -20)

//print(c.x)
//print(d.x)


class SomeObject: Position {
    var width: Double
    var height: Double
    
    init?(width: Double, height: Double, x: Double, y: Double) {
        if x <= 0.0 || y <= 0.0 {
            return nil
        }
        
        self.width = width
        self.height = height
        super.init(x: x, y: y)
    }
}

let box = SomeObject(width: 100, height: 100, x: -10.0, y: 10.0)


// MARK: - Int Exam

let number: Double = 1234.0
let pi = 3.14

let numberChanged: Int? = Int(exactly: number)

let changedPi = Int(exactly: pi)

if changedPi == nil {
    print("\(pi) conversion to Int is invalid")
}


//: [Next](@next)
