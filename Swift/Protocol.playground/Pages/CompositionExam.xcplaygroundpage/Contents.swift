//: [Previous](@previous)

import Foundation

// SomeProtocol & AnotherProtocol & OtherProtocol

protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct Person: Named, Aged {
    var name: String
    var age: Int
}

struct Dog: Named, Aged {
    var name: String
    var age: Int
}

func wishHappyBirthday(to celebrator: Person) {
    print("Happy birthday \(celebrator.name), you're \(celebrator.age)!!")
}

let beepeach: Person = Person(name: "BeePeach", age: 20)
let somsom: Dog = Dog(name: "SomSom", age: 12)

wishHappyBirthday(to: beepeach)
// Happy birthday BeePeach, you're 20!!



/*
 // ERROR!!
func wishHappyBirthday(to celebrator: Named, Aged) {
    print("Happy birthday \(celebrator.name), you're \(celebrator.age)!!")
}
*/

func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy birthday \(celebrator.name), you're \(celebrator.age)!!")
}

wishHappyBirthday(to: beepeach)
// Happy birthday BeePeach, you're 20!!

wishHappyBirthday(to: somsom)
// Happy birthday SomSom, you're 12!!


class Cat: Named, Aged {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class Persian: Cat {
    
}

func wishHappyBirthdayCat(to celebrator: Cat & Named & Aged) {
    print("Happy birthday Cat \(celebrator.name), you're \(celebrator.age)!!")
}

let persian: Persian = Persian(name: "Persian", age: 5)

wishHappyBirthdayCat(to: persian)
// Happy birthday Cat Persian, you're 5!!

//wishHappyBirthdayCat(to: somsom)


//: [Next](@next)
