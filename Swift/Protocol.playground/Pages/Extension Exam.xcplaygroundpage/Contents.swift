//: [Previous](@previous)

import Foundation

protocol Animal {
    var name: String { get }
    var age: Int { get set }
}

extension Animal {
    func introduce() {
        print("Hi my name is \(name), I'm \(age)")
    }
}

class Dog: Animal {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let somsom: Dog = Dog(name: "SomSom", age: 12)
somsom.introduce()

class Cat: Animal {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func introduce() {
        print("I'm Cat!!")
    }
}

let cat: Cat = Cat(name: "Bee", age: 1)
cat.introduce()


extension Animal {
    var name: String {
        return "Animal"
    }
}

class Bird: Animal {
    var age: Int
    init(age: Int) {
        self.age = age
    }
}

let bird: Bird = Bird(age: 2)
bird.name



//: [Next](@next)

