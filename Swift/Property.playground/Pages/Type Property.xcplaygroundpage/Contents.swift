//: [Previous](@previous)

import Foundation

// MARK: - Instance Property
struct Dog {
    let name: String
    var age: Int
}

let somsom: Dog = Dog(name: "somsom", age: 11)
let mung: Dog = Dog(name: "mung", age: 2)

somsom.name
mung.name


// MARK: - Type Property
// Type.property로 호출한다.
// class, struct, enum에서 사용가능

// lazy와 마찬가지로 접근할때 초기화
// 항상 default 값이 있어야한다.



/*
class ClassName {
    static var name: Type = DefaultValue
    static let name: Type = DefaultValue
    
    static var name: Type {
        get {
            statement
        }
        set {
            statement
        }
    }
}
 */

struct Math {
    static let pi: Double = 3.14
}

Math.pi

// MARK: - More Example
struct SomeStruct {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 1
    }
}

enum SomeEnum {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 2
    }
}

class SomeClass {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 3
    }
    class var overrideComputedTypeProperty: Int {
        return 4
    }
}

class AnotherClass: SomeClass {
    override class var overrideComputedTypeProperty: Int {
        return 40
    }
    
    /* Error!!
    override static var storedTypeProperty: Int {
        return 30
    }
    */
}

SomeStruct.storedTypeProperty
SomeStruct.storedTypeProperty = "Another value"

SomeEnum.computedTypeProperty

SomeClass.overrideComputedTypeProperty


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

