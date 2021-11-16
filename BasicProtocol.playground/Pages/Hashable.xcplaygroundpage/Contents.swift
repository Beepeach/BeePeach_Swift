//: [Previous](@previous)

import UIKit

// MARK: -Hashable
// 암호화기법으로 어떠한 값을 -> 문자열, 정수값으로 바꾸는 것
// Dictionary의 key로 하고 싶거나 Set에 저장하고 싶을때 사용하자
// 이 값들은 Hashable 프로토콜을 채용해야한다.
// 값의 유일성을 보장하고 검색속도가 빠르다.


// MARK: - Enum
// 연관값이 없다면 Hashable이 자동으로 채용된다.

enum ServiceType {
    case onlineCourse
    case offlineCamp
}

let types: [ServiceType: String]
let typeSet: Set = [ServiceType.offlineCamp]


// 연관값이 있다면 모든 타입이 Hashable를 채용하고 있을때만 자동으로 구현이된다.
// CGSize가 Hashable이 아니므로 직접 구현해야한다.
enum VideoInterface {
    case dvi(width: Int, height: Int)
    case hdmi(width: Int, height: Int, version: Double, audioEnable: Bool)
    case displayPort(size: CGSize)
}

extension VideoInterface: Hashable {
    func hash(into hasher: inout Hasher) {
        switch self {
        case .displayPort(let value):
            hasher.combine(value)
        default:
            break
        }
    }
}

extension CGSize: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(width)
        hasher.combine(height)
    }
}

let interfaces: [VideoInterface: String]
let interfaceSet: Set = [VideoInterface.displayPort(size: CGSize(width: 3840.0, height: 2560.0))]



// MARK: - Struct
// 마찬가지로 프로퍼티가 hashable를 채용하고 있다면 Hashable을 채용하기만 하면 자동으로 제공된다.

struct Person: Hashable {
    let name: String
    let age: Int
}

let beepeach: Person = Person(name: "Beepach", age: 100)
let somsom: Person = Person(name: "Somsom", age: 20)

let personSet: Set = [beepeach, somsom]



// MARK: - Class
// Class는 직접 구현을 해야한다.
// Hashable은 Equatable을 채용하고 있다.
// 그니까 함께 구현해야한다.
// hashValue 프로퍼티는 더이상 사용하지 않는다.
// hash(into:) 메서드만 구현하면 된다.
// 알고리즘을 직접 구현할 필요는 없다. hasher 파라미터를 이용하자
// 모든 StoredProperty를 combine으로 전달해주자.

class PersonObject {
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

extension PersonObject: Hashable {
    static func == (lhs: PersonObject, rhs: PersonObject) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(age)
    }
}



//: [Next](@next)
