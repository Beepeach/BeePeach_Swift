import UIKit

// MARK: - Memory

// Bit와 Byte의 개념을 알고있나??
// 0,1 = 1bit
// 8bit -> 1byte
// 수를 저장하는 방식에 대해서 알고있나?
// 프로세스의 메모리구조를 알고있나??


// MARK: - ValueType vs Reference Type
// ValueType: Structure, Enum, Tuple
// ReferenceType: Class, Closure
// COW(Copy on Write)의 개념
// let keyword는 스택을 잠구다고 생각하며 이해가 쉽다.
// ==, ===의 차이
// 비교 연산자는 값형식을 비교할때 스택의 값, 참조형식을 비교할때는 힙의 값을 비교 (항상 실제 값을 비교한다)
// 항등 연산자는 참조형식의 스택에 저장된 주소의 값을 비교한다.

struct SizeValue {
    var width = 0.0
    var height = 0.0
}

var value = SizeValue()
var value2 = value
value2.width = 10.0
value.width


class SizeObject {
    var width = 0.0
    var height = 0.0
}

var object = SizeObject()
var object2 = object

object2.width = 10.0
object.width


