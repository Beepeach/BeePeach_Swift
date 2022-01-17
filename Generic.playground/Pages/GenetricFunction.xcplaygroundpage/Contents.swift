import UIKit

// MARK: - Generic Function
// 타입파라미터의 개수는 여러개 ,로 나열 가능하다.

/*
func name<T>(parameters) -> Type {
    code
}
*/

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temp: Int = a
    a = b
    b = temp
}

var someInt: Int = 10
var anotherInt: Int = 20

swapTwoInts(&someInt, &anotherInt)

print(someInt)
print(anotherInt)


func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
    let temp: Double = a
    a = b
    b = temp
}

func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let temp: String = a
    a = b
    b = temp
}

func swapTwoAny(_ a: inout Any, _ b: inout Any) {
    let temp: Any = a
    a = b
    b = temp
}

//swapTwoAny(&someString, &anotherString)

protocol SomeProtocol {
    
}

func swapAdoptedProtocol(_ a: inout SomeProtocol, _ b: inout SomeProtocol) {
    let temp: SomeProtocol = a
    a = b
    b = temp
}

/* ERROR
func swapEqutable(_ a: inout Equatable, _ b: inout Equatable) {
    let temp: Equatable = a
    a = b
    b = temp
}
*/


// MARK: - TypeParameter
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temp: T = a
    a = b
    b = temp
}

var someFloat: Float = 11.22
var anotherFloat: Float = 33.44

var someString: String = "Bee"
var anotherString: String = "Peach"

swapTwoValues(&someFloat, &anotherFloat)
swapTwoValues(&someString, &anotherString)

// swapTwoValues<Int>(&someInt, &anotherInt)
// swapTwoValues<T: Int>(&someInt, &anotherInt)
// ERROR!!

// MARK: - Type Constraints(형식 제한)
// 특정 프로토콜을 채용한 형식으로만 제한할 수 있다.
// 그럼 모든 타입이 가능한 코드가 아니라 해당 프로토콜만 채용한 형식만 가능하게된다.
// <TypeParameter: ProtocolName>과 같이 타입파라미터이름뒤에 :과 함께 적어준다.
/*
func name<T: ProtocolName>(parameters) -> Type {
    code
}
*/



// MARK: - Specialization
// 특정 형식을 위한 코드를 구현할 수 있다.
// 타입파라미터를 쓰지않고 함수이름과 파라미터를 같게 만들어주면 된다.
// override의 개념과 비슷하다.

func swapTwoValues(_ a: inout String, _ b: inout String) {
    print("Special Version")
    
    if a.compare(b) == .orderedSame {
        return
    }
    
    let temp: String = a
    a = b
    b = temp
}

swapTwoValues(&someString, &anotherString)
// "Special Version"

swap(<#T##a: &T##T#>, <#T##b: &T##T#>)
