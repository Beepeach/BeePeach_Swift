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

class Dog {
    let name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func speak() {
        print("Mung!!")
    }
}


let somsom: Dog = Dog(name: "SomSom", age: 11)
somsom.name
somsom.age
somsom.speak()


// MARK: - Struct

struct StructName {
    // property
    // method
    // initializer
    // subscript
}

struct Cat {
    let name: String
    var age: Int
    
    func speak() {
        print("Meow~")
    }
}

let tac: Cat = Cat(name: "Tac", age: 2)
tac.name
tac.age
tac.speak()


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

