import UIKit

// MARK: - Generic Function
// 타입에 의존적이지 않은 범용코드를 작성할 수 있다.
// 타입 파라미터를 func funcName<TypeParameterName>과 같이 적어주면 된다.
// 타입파라미터의 개수는 여러개 ,로 나열 가능하다.

/*
func name<T>(parameters) -> Type {
    code
}
*/

func swapValue<T: Equatable> (lhs: inout T, rhs: inout T) {
    print("Generic version")
    if lhs == rhs {
        return
    }
    
    let temp:T = lhs
    lhs = rhs
    rhs = temp
}

var a: Int = 1
var b: Int = 2
swapValue(lhs: &a, rhs: &b)
a
b


var c: Double = 12.34
var d: Double = 45.67
swapValue(lhs: &c, rhs: &d)
c
d


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

func swapValue(lhs: inout String, rhs: inout String) {
    print("Specialized version")
    
    if lhs.caseInsensitiveCompare(rhs) == .orderedSame {
        return
    }
    
    let temp: String = lhs
    lhs = rhs
    rhs = temp
}

swapValue(lhs: &a, rhs: &b)
var e: String = "Swift"
var f: String = "Objected-C"
swapValue(lhs: &e, rhs: &f)
