//: [Previous](@previous)

import Foundation

// MARK : - Property Observer
// var로 선언된 stored property에서 선언 가능하다.
// 예외로 subclass에 override한 computed Property에서 사용가능하다.

/*
var name: Type = DefaultValue {
    willSet(name) {
        statement
    }
    didSet(name) {
        statment
    }
}
*/

class Size {
    var width = 0.0 {
        willSet {
            print("\(width) will change \(newValue)")
        }
        didSet {
            print("\(oldValue) is changed by \(width)")
        }
    }
}

let s: Size = Size()
s.width = 100


//: [Next](@next)
