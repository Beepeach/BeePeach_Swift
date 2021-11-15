//: [Previous](@previous)

import Foundation

// MARK: -
// 기본값을 구현할 수 있다.
// 물론 override처럼 재정의도 가능하다.

// where Self: Equtable

protocol Figure {
    var name: String { get }
    func draw()
}

extension Figure {
    func draw() {
        print("draw figure")
    }
}

struct Rectangle: Figure {
    var name: String = "Rectangle"
}


let rectangle: Rectangle = Rectangle()
rectangle.draw()

//: [Next](@next)
