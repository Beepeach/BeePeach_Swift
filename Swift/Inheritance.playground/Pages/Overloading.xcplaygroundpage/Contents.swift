//: [Previous](@previous)

import Foundation

// MARK: - Overloading
// 같은 이름을 가진 다수의 멤버를 구현할때 사용 (함수, 메서드, 생성자, 서브스크립트)
// Override와 헷갈리지말자.

func process(value: Int) {
    print("Int")
}

func process(value: String) {
    print("String")
}

func process(value: String, anotherValue: String) {
    
}

func process(_ value: String) {
    print("argument")
}

/*
func process(value: Doble) -> Int {
    return Int(value)
}

func process(value: Double) -> String {
    return String(value)
}
 */

process(value: 0)
process(value: "str")
process("str")

// let result = process(value: 12.34) as Int

// 함수이름, 파라미터, 리턴형을 모두 포함해서 함수를 식별한다.
// 1 이름이 동일하면 파라미터의 갯수로 식별
// 2 파라미터의 타입을 식별
// 3 ArgumentLabel로 식별
// 4 리턴형으로 구별


// 인스턴스멤버와 타입멤버는 겹처도 괜찮다.
struct Rectangle {
    func area() -> Double {
        return 0.0
    }
    
    static func area() -> Double {
        return 0.0
    }
}



//: [Next](@next)
