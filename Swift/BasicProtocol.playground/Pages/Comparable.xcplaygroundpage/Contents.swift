//: [Previous](@previous)

import Foundation

// MARK: - Comparable
// >, < 비교연산자를이용해 대소를 비교하려면 꼭 채용해야한다.
// Equatable을 상속하고 있다.
// 4가지 요구사항중 < 만 구현해도 된다.


// MARK: - Class

class CustomDate {
    let year: Int
    let month: Int
    let day: Int
    
    init(year:Int, month: Int, day: Int) {
        self.year = year
        self.month = month
        self.day = day
    }
}

extension CustomDate: Comparable {
    static func < (lhs: CustomDate, rhs: CustomDate) -> Bool {
        if lhs.year != rhs.year {
            return lhs.year < rhs.year
        } else if lhs.month != rhs.month {
            return lhs.month < rhs.month
        } else {
            return lhs.day < rhs.day
        }
    }

    static func == (lhs: CustomDate, rhs: CustomDate) -> Bool {
        return (
            lhs.year == rhs.year &&
            lhs.month == rhs.month &&
            lhs.day == rhs.day
        )
    }
}


let goodDay = CustomDate(year: 2021, month: 12, day: 24)
let birthDay = CustomDate(year: 2022, month: 1, day: 15)

goodDay >= birthDay


let date1 = CustomDate(year: 2020, month: 10, day: 11)
let date2 = CustomDate(year: 2021, month: 6, day: 8)
let date3 = CustomDate(year: 2021, month: 11, day: 26)
let date4 = CustomDate(year: 1990, month: 9, day: 21)

var dates: [CustomDate] = [date1, date2, date3, date4]

dates.sort()


// MARK: - Struct
// 알아서 제공안해준다!
// 하지만 Equtable은 제공해주기때문에 모든 저장프로퍼티가 Equtable을 채용한 형식이라면 == 구현을 하지 않아도 된다.

struct Person {
    let name: String
    let age: Int
}

extension Person: Comparable {
    static func < (lhs: Person, rhs: Person) -> Bool {
        return lhs.age < rhs.age
    }
}

let beepeach: Person = Person(name: "Beepeach", age: 26)
let judy: Person = Person(name: "Judy", age: 22)

beepeach > judy



// MARK: - Enum
// 연관값이 없어도 자동으로 제공하지않고 채용만 하면 알아서 구현해준다.
// rawValue를 사용한다면 직접 구현해줘야한다.
// 연관값이 있고 타입이 모두 Comparable을 채용하고 있다면 채용만 해주면 된다.
// 설명엔 꼭 original에 채용하라고 나오는데 extension에서 채용해도 문제가 없다?!?

//enum School: Comparable {
//    case elementary
//    case middle
//    case high
//    case university
//}
//
//School.elementary < School.middle
//School.university > School.high


//enum School {
//    case elementary(grade: Int)
//    case middle(grade: Int)
//    case high(grade: Int)
//    case university(grade: String, department: String)
//}
//
//extension School: Comparable {
//
//}
//
//School.elementary(grade: 2) > School.middle(grade: 3)
//School.elementary(grade: 4) < School.elementary(grade: 5)
//School.elementary(grade: 6) > School.high(grade: 1)
//
//School.university(grade: "freshman", department: "Computer Science") > School.high(grade: 1)
//School.university(grade: "freshman", department: "Math") > School.university(grade: "freshman", department: "Computer Science")


enum School: Int {
    case elementary
    case middle
    case high
    case university
}

extension School: Comparable {
    static func < (lhs: School, rhs: School) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

School.high > School.middle
// true
School(rawValue: 3)! < School(rawValue: 0)!
// false



//: [Next](@next)
