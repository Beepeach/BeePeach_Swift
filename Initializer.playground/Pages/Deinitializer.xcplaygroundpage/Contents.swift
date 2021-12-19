//: [Previous](@previous)

import Foundation
import Darwin

// MARK:- Deinitializer
// class 전용
// 1개만 정의가능
// 직접 호출할 수 없다.
// 인스턴스가 제거될때 자동으로 호출된다.

/* Syntax
deinit {
    code
}
*/

class Size {
    var width = 0.0
    var height = 0.0
}

class Position {
    var x = 0.0
    var y = 0.0
}

class Rect {
    var origin = Position()
    var size = Size()
    
    deinit {
        print("deinit Rect(\(origin.x) \(origin.y))")
    }
}

var rect: Rect? = Rect()
rect = nil



//: [Next](@next)
