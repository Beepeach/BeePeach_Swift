import UIKit

// MARK: - Init
// 인스턴스를 만드는것이 초기화
// 생성자는 초기화를 담당
// 모든 속성을 기본값으로 초기화해서 인스턴스를 기본상태로 만든다.
// init이 완료됐을때 모든 속성이 기본값을 가지고 있다.
// 기본값이 없는 속성이 존재하면 초기화에 실패하고 인스턴스는 생성되지않는다.

class Position {
    var x: Double = 0.0
    var y: Double = 0.0
    // Optional일때 값이 없다면 nil로 초기화
    var z: Double? = nil
}

// 기본값이 있고 init이 하나도 없다면
// Default Init이 제공된다.
let p = Position()


// MARK: - Syntax

/*
init(parameter) {
    code
}
*/

class SizeObject {
    var width: Double = 0.0
    var height: Double = 0/0
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    convenience init(value: Double) {
        // Initializer Delegation
        // 가능한 중복을 없애는게 좋으므로 다른 init을 호출
        self.init(width: value, height: value)
    }
}


// MARK: - MemberwiseInit
// sturct에서 제공한다.
// init을 하나라도 생성하면 지원되지 않는다.
struct SizeValue {
    var width: Double = 0.0
    var height: Double = 0.0
}

let s = SizeValue()
SizeValue(width: 1.2, height: 1.2)

struct First {
    let a: Int
    let b: Int
    let c: Int
}

let first: First = First(a: 10, b: 20, c: 30)

struct Second {
    let a: Int = 0
    let b: Int = 1
    let c: Int
}

let second: Second = Second(c: 2)

struct Third {
    var a: Int = 0
    var b: Int = 1
    var c: Int
}

let third: Third = Third(a: 10, b: 20, c: 30)

struct Forth {
    let a: Int
    let b: Int
    let c: Int
}

extension Forth {
    init(value: Int) {
        a = value
        b = value
        c = value
    }
}

let forth: Forth = Forth(a: 10, b: 20, c: 30)
