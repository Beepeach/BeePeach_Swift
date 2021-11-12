import UIKit

// MARK: - Inheritance
// 두개이상의 클래스를 상속할 수 없다.

/*
class ClassName: SuperClassName {
    
}
*/

class Figure {
    var name: String = "Unknown"
    var description: String {
        return "This Figure is \(self.name)"
    }
    func draw() {
    }
}

let figure: Figure = Figure()

class Circle: Figure {
    var radius: Double = 0.0
    
    override func draw() {
        print("🔵")
    }
    
    override var description: String {
            return "This Circle is 🔵"
    }
    
    // Error!!
    // override var name: String = "Circle"
    
    override var name: String {
        get {
            return "Circle"
        }
        set {
            super.name = newValue
        }
    }
}

let circle: Circle = Circle()
circle.description
circle.name

class CustomCicle: Circle {
    var isCustom: Bool = true
    
    override func draw() {
        super.draw()
        print("🔴")
    }
}

let customCircle: CustomCicle = CustomCicle()
customCircle.draw()
// 🔵
// 🔴





// final keyword를 앞에 붙이면 상속이 금지된다.
/*final*/ class Rectangle: Figure {
    var width: Double = 0.0
    var height: Double = 0.0
}


class Square: Rectangle {
    
}

/*
// MARK: - Type Casting
let figure: Figure = Figure(name: "Unknown")
figure.name
// figure.witdh
// figure.height

let rectangle: Rectangle = Rectangle(name: "Rect")
rectangle.width
rectangle.height
rectangle.name

let square: Square = Square(name: "Square")
square.width
square.height
square.name

// Upcasting
// 같은 상속에서는 안전하다
var upcastedSquare: Figure = Square(name: "Square")
// square1.height
// square1.width
upcastedSquare.name


// Downcasting
// upcasting된 인스턴스를 원래 형식으로 처리할때 필요하다.
// 실패가능성이 있다.
let downcastedSquare = upcastedSquare as? Square
downcastedSquare?.width
downcastedSquare?.height

let downcastedSquare2 = upcastedSquare as? Rectangle
downcastedSquare?.width
downcastedSquare?.height


class Rhombus: Square {
    var angle: Double = 45.0
}

// 아래로 가는 캐스팅은 실패
// let rhom = upcastedSquare as! Rhombus


// MARK: - TypeCasting
// is (Type check operator)
// 형식이 동일하거나 계층에서 상위라면 true
// 런타임에 체크한다. 코드를 실행하고나서 알수있다.
let num: Int = 123
num is Int
num is Double
num is String

rectangle is Rectangle
rectangle is Figure
rectangle is Square

// as (Type casting operator)
// 새로운 인스턴스를 생성하는게 아니라 임시인스턴스를 생성한다.
// 컴파일에 체크된다.
// 다운캐스팅에서는 as를 사용할 수 없다.
// as? as! 런타임에 체크된다.

let nsstr = "Str" as NSString
// "str" as Int

rectangle as? Rectangle
rectangle as! Rectangle

upcastedSquare = square as Figure
upcastedSquare as? Square
upcastedSquare as? Rectangle
// upcastedSquare as Rectangle

if let circle = upcastedSquare as? Circle {
    
}

// 가장 인접한 super클래스로 업캐스팅되어서 저장된다
let list = [rectangle, square, circle]
type(of: list)

// 다형성 체크
for item in list {
    item.draw() // overried된게 적용된다.

    // item.radius
    if let c = item as? Circle {
        c.radius
    }
}

*/
