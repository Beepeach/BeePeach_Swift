//: [Previous](@previous)

import Foundation


// MARK: protocol도 firstClassCitizen이기때문에 타입으로 사용 가능하다.

protocol Resettable {
    func reset()
}

class Size: Resettable {
    var width: Double = 0.0
    var height: Double = 0.0
    
    func reset() {
        width = 0.0
        height = 0.0
    }
}

// Upcasting과 비슷하다.
let size: Size = Size()
let resettable: Resettable = Size()

resettable.reset()



// MARK: - Conformance
// typecasting 연산자를 이용한다.
// is as
// as? as!

size is Resettable

size is ExpressibleByNilLiteral

let r = Size() as Resettable
r as? Size


// MARK: -
// 이를 이용하면 struct도 class의 상속처럼 사용할 수 있다.



//: [Next](@next)
