//: [Previous](@previous)

import Foundation

@objc protocol SomeProtocol {
    @objc optional var optionalProperty: String { get set }
    
    @objc optional func optionalMethod(parameter: Int) -> String
    
    @objc optional subscript(parameter: Int) -> String { get set }
    
    var property: String { get set }
    
    func method(parameter: Int) -> String
}

@objc protocol Person {
    var name: String { get }
    
    @objc optional var job: String { get set }
    @objc optional func work()
}

class Employed: Person {
    let name: String
    var job: String
    
    init(name: String, job: String) {
        self.name = name
        self.job = job
    }
    
    func work() {
        print("\(self.name) works!!")
    }
}

class Jobless: Person {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

let employed: Employed = Employed(name: "BeePeach", job: "Bee")
let unemployed: Jobless = Jobless(name: "somsom")

print(employed.job)
employed.work()

// ERROR!!
//unemployed.job
//unemployed.work()


var person: Person = employed
print(person.job?.count as Any)
person.work?()
print(person.job as Any)


person = unemployed
person.work?()
print(person.job as Any)

//: [Next](@next)
