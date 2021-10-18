import UIKit
import Foundation

// MARK: - Class

class ClassName {
    // proprty
    // method
    // init
    // deinit
    // subscript
}

class ClassPerson {
    var name: String = "Beepeach"
    var age: Int = 29
    
    func speak() {
        print("Hello")
    }
}

let p: ClassPerson = ClassPerson()



// MARK: - Struct

struct StructName {
    // property
    // method
    // initializer
    // subscript
}

struct StructPerson {
    var name: String
    var age: Int
    
    func speak() {
        print("Hello")
    }
}

let person: StructPerson = StructPerson(name: "Beepeach", age: 29)
person.name
person.age
person.speak()



// MARK: - Initializer Syntax
// 인스턴스를 생성하는 메서드!

let str = "123"
let num = Int(str)

class Position {
    var x: Double
    var y: Double
    
    init() {
        x = 0.0
        y = 0.0
    }
    
    init(value: Double) {
        x = value
        y = value
    }
}

var position:Position = Position()
position.x
position.y

position = Position(value: 100)
position.x
position.y
