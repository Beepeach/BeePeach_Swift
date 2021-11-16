//: [Previous](@previous)

import Foundation

// MARK: - Comparable
// > < >= <=와 같이 대소를 비교하려면 꼭 채용해야한다.
// 기본적으로 String, Number들은 채용하고 있다.
// Equatable을 채용하고있다.
// 4가지 요구사항중 < 만 구현해도 된다.

// MARK: - Enum
// 연관값이 없어도 자동으로 제공하지않고 채용만 하면 알아서 구현해준다.
// rawValue를 사용한다면 직접 구현해줘야한다.

enum Weekday: Int {
    case sunday
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
}

extension Weekday: Comparable {
    static func < (lhs: Weekday, rhs: Weekday) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

Weekday.sunday > Weekday.monday
Weekday.saturday <= Weekday.thursday

// 연관값이 있고 타입이 모두 Comparable을 채용하고 있다면 채용만 해주면 된다.



// MARK: - Struct
// 알아서 제공안해준다!
// 무엇을 기준으로 비교할건지 목적에 맞게 우리가 정해야한다.

struct Person: Equatable {
    let name: String
    let age: Int
}

extension Person: Comparable {
    static func < (lhs: Person, rhs: Person) -> Bool {
        return lhs.age < rhs.age
    }
}

let older: Person = Person(name: "Beepeach", age: 100)
let younger: Person = Person(name: "Somsom", age: 10)

older > younger



// MARK: - Class
// 당연히 제공 안해준다.




//: [Next](@next)
