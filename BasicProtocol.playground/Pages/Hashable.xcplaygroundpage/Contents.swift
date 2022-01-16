//: [Previous](@previous)

import UIKit

// MARK: -Hashable
// 암호화기법으로 어떠한 값을 -> 정수값으로 바꾸는 것
// Dictionary의 key로 하고 싶거나 Set에 저장하고 싶을때 사용하자
// 이 값들은 Hashable 프로토콜을 채용해야한다.


// MARK: - Class
// Class는 직접 구현을 해야한다.
// Hashable은 Equatable을 상속한다.
// hash(into:) 메서드만 구현하면 된다.
// 알고리즘을 직접 구현할 필요는 없다. hash(into:) 메서드의 hasher 파라미터를 이용하자
// 모든 StoredProperty를 combine()메서드에 파라미터로 전달해주자.

class Person {
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

extension Person: Hashable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(age)
    }
}

let beepeach: Person = Person(name: "Beepeach", age: 20)

let dictValue: [String: Person] = ["Beepeach": beepeach]

let dictKey: [Person: String] = [beepeach: "Beepeach"]



// MARK: - Struct
// 마찬가지로 프로퍼티가 hashable를 채용하고 있다면 Hashable을 채용하기만 하면 자동으로 제공된다.

struct Dog: Hashable {
    let name: String
    let age: Int
}

let somsom: Dog = Dog(name: "Somsom", age: 12)

let dict: [Dog: String] = [somsom: "Somsom"]



// MARK: - Enum
// 연관값이 없다면 Hashable이 자동으로 채용된다.
enum Coffee {
    case Americano
    case Latte
}

let enumDict: [Coffee: String] = [Coffee.Americano: "Ameri"]


// 연관값이 있다면 모든 타입이 Hashable를 채용하고 있을때만 자동으로 구현이된다.
// CGSize가 Hashable이 아니므로 직접 구현해야한다.
class Company {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

extension Company: Hashable {
    static func == (lhs: Company, rhs: Company) -> Bool {
        return lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

enum Transportation {
    case taxi(company: Company)
    case bus(number: Int)
    case subway(line: Int, express: Bool)
    case airplane(departures: String, arrival: String)
}

extension Transportation: Hashable {
}

let taxi = Transportation.taxi(company: Company(name: "Kakao"))
let dictAssociatedEnum: [Transportation: String] = [taxi: "Trans"]






//: [Next](@next)
