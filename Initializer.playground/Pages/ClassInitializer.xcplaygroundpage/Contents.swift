//: [Previous](@previous)

import Foundation
// MARK: - Designated Initializer
// class가 가진 모든 속성을 초기화해야한다.
// init이 완료되기 전에 superClass의 init을 호출해야한다.
// 대부분 1개만 구현한다.

class Position {
    var x: Double
    var y: Double
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    convenience init(x: Double) {
        self.init(x: x, y: 0.0)
    }
}


// MARK: - Convenience Initializer
// 반드시 모든 속성을 초기화하지 않아도 된다.
// 필요한 속성만 초기화하고 나머지는 다른 init을 호출하는 형식으로 구현한다.
// superClass의 init을 호출할 수 없다.


// MARK: - Inheritance
// 상속에 조건이 있다.
// 기본적으로 super -> sub로 상속되진않는다.
// subclass에서 모든 속성이 기본값으로 초기화되어있고 Designated init을 선언하지 않았다면 superclass의 모든 designated init이 상속된다.
// subclass가 모든 designated init을 상속받았거나 override했다면 superClass의 모든 convenience init이 상속된다.

class Figure {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "unknown")
    }
    
    func draw() {
        print("draw \(name)")
    }
}

class Rectangle: Figure {
    var width: Double = 0.0
    var height: Double = 0.0
    
    init(name: String, width: Double, height: Double) {
        self.width = width
        self.height = height
        
        super.init(name: name)
    }
    
    override init(name: String) {
        width = 0
        height = 0
        super.init(name: name)
    }
    
    // convenience init은 override하는게 아니다.
    convenience init() {
        self.init(name: "unknown")
    }
}



//: [Next](@next)

