//: [Previous](@previous)

import Foundation


// MARK: - Overriding
// 동일한 멤버를 subclass에서 구현하는것
// method, property, subscript, initializer 가능
// 기능을 추가하거나 무시하고 새롭게 구현하거나
// 멤버 앞에 final을 사용하면 해당 멤버의 override를 금지시킬수 있다.

class Figure {
    var name: String = "Unknown"
    
    init(name: String) {
        self.name = name
    }
    
    func draw() {
        print("draw \(self.name)")
    }
}

class Circle: Figure {
    var radius: Double = 0.0
    
    var diameter: Double {
        return radius * 2
    }
    
    override func draw() {
        super.draw()
        print("🔴")
    }
}

let circle: Circle = Circle(name: "Circle")
circle.draw()


// 저장프로퍼티로는 override가 안된다.
class Oval: Circle {
    // 변수 저장속성은 프로퍼티 옵저버 추가 가능
    override var radius: Double {
        willSet {
            print(newValue)
        }
        didSet {
            print(oldValue)
        }
    }
    
    // 읽기 -> 읽기 쓰기 가능
    // 읽기 쓰기 -> 읽기 불가능
    // 여기서 super가 아니라 self로 접근하면 recursivea문제가 발생한다.
  
    override var diameter: Double {
        get {
            return super.diameter
        }
        set {
            super.radius = newValue / 2
        }
        
        // 읽기전용을 override해서 observer추가가 불가능하다.
        /*
        willSet {
            
        }
        didSet {
            
        }
        */
    }
}

// override가 금지되는거지 상속이 금지되는게 아니다.
let oval: Oval = Oval(name: "Oval")
oval.radius

//: [Next](@next)
