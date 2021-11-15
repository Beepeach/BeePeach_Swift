//: [Previous](@previous)

import UIKit

// MARK: - Optional Required
// 해당 요구사항을 꼭 구현하지 않아도될때 사용한다.
// class 전용이다.
// @objc 특성을 채용하면 AnyObject를 자동으로 상속하게 된다.

/*
@objc protocol ProtocolName {
    @objc optional requirements
}
*/

@objc protocol Drawable {
    @objc optional var strokeWidth: Double { get set }
    @objc optional var strokeColor: UIColor { get set }
    func draw()
    @objc optional func reset()
}

class Rectangle: Drawable {
    func draw() {
        
    }
}

let rectangle:Drawable =  Rectangle()
rectangle.draw()
rectangle.strokeColor
rectangle.reset?()

/*
struct Circle: Drawable {
    func draw() {
    }
}
*/
 
//: [Next](@next)
