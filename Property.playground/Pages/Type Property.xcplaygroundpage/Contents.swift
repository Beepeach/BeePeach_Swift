//: [Previous](@previous)

import Foundation

// MARK: - Type Property
// Type.property로 호출한다.
// class, struct, enum에서 사용가능

// lazy와 마찬가지로 접근할때 초기화
// 항상 default 값이 있어야한다.


/*
static var name: Type = DefaultValue
static let name: Type = DefaultValue
 */

class Math {
    static let pi: Double = 3.14
}

Math.pi


// MARK: - Computed Type Property

// class로 사용하면 override가 가능해진다.

/*
static var name: Type {
    get {
        
    }
    set(name) {
        
    }
}

class var name: Type {
    get {
        
    }
    set(name) {
        
    }
}
*/


enum Weekday: Int {
    case sunday = 1, monday, tuesday, wednesday, thursday, friday, saturday
    
    static var today: Weekday? {
        let calendar: Calendar = Calendar.current
        let today: Date = Date()
        let weekday = calendar.component(.weekday, from: today)
        
        return Weekday(rawValue: weekday)
    }
}

Weekday.today
//: [Next](@next)

