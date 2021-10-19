//: [Previous](@previous)

import Foundation

// MARK: - Computed Property
// 저장공간을 따로 가지지 않는다.

// let을 사용할 수 없다.
// class, struct, enum에서 사용가능하다.

//var name: Type {
//    get {
//        statement
//        return expression
//    }
//    set(name) {
//        newValue
//        statement
//    }
//}

class Person {
    var name: String
    var yearOfBirth: Int
    
    init(name: String, year: Int) {
        self.name = name
        self.yearOfBirth = year
    }
    
    var age: Int {
        get {
            let calendar: Calendar = Calendar.current
            let now: Date = Date()
            let year = calendar.component(.year, from: now)
            
            return year - yearOfBirth
        }
        set {
            let calendar: Calendar = Calendar.current
            let now = Date()
            let year = calendar.component(.year, from: now)
            yearOfBirth = year - newValue
        }
    }
}

let p = Person(name: "Beepeach", year: 2002)
p.age

p.age = 50
p.yearOfBirth



//: [Next](@next)
