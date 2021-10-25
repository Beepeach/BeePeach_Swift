//: [Previous](@previous)

import Foundation

// MARK: - Computed Property

// 저장공간을 따로 가지지 않는다.

// let을 사용할 수 없다.
// class, struct, enum에서 사용가능하다.

//var name: Type {
//    get {
//        statement
//        return expression
//    }
//    set(parameterName) {
//        statement
//    }
//}

// MARK: - Using Computed property

struct Point {
    var x: Double = 0.0
    var y: Double = 0.0
}

struct Size {
    var width: Double = 0.0
    var height: Double = 0.0
}

struct Rect {
    var origin: Point = Point()
    var size: Size = Size()

    var center: Point {
        get {
            let centerX: Double = origin.x + (size.width / 2)
            let centerY: Double = origin.y + (size.height / 2)

            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

let zero: Point = Point(x: 0.0, y: 0.0)
var square: Rect = Rect(origin: zero, size: Size(width: 10.0, height: 10.0))

square.center
square.center = Point(x: 15.0, y: 15.0)

square.origin
square.center


// MARK: - Using Method

//struct Rect {
//    var origin: Point = Point()
//    var size: Size = Size()
//
//    func center() -> Point {
//        let centerX: Double = origin.x + (size.width / 2)
//        let centerY: Double = origin.y + (size.height / 2)
//
//        return Point(x: centerX, y: centerY)
//    }
//
//    mutating func setCenter(_ centerPoint: Point) {
//        origin.x = centerPoint.x - (size.width / 2)
//        origin.y = centerPoint.y - (size.height / 2)
//    }
//}
//
//let zero: Point = Point(x: 0, y: 0)
//var squre: Rect = Rect(origin: zero, size: Size(width: 10.0, height: 10.0))
//
//squre.center()
//
//let newPoint: Point = Point(x: 15.0, y: 15.0)
//
//squre.setCenter(newPoint)
//squre.origin
//squre.center()

// MARK: - Shorthand Syntax
struct CompactRect {
    var origin: Point = Point()
    var size: Size = Size()

    var center: Point {
        get {
            Point(x: origin.x + (size.width / 2), y: origin.y + (size.height / 2))
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

// MARK: - ReadOnly

struct ReadOnlyRect {
    var origin: Point = Point()
    var size: Size = Size()
    
    var center: Point {
        Point(x: origin.x + (size.width / 2), y: origin.y + (size.height / 2))
    }
}

//: [Next](@next)
