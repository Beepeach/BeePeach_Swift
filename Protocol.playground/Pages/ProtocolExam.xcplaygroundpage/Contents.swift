//: [Previous](@previous)

import Foundation


// MARK: - Syntax
protocol AProtocol {
    
}

protocol BProtocol {
    
}


struct SomeStruct: AProtocol, BProtocol {
    
}


class SuperClass {
    
}

class SubClass: SuperClass, AProtocol, BProtocol {
    
}

// MARK: - Property

/*
protocol SomeProtocol {
    var doesNotNeedToBeSettable: String { get }
    var mustBeSettable: Int { get set }
    
    // ERROR!!
    let mustBeGettable: Int { get }
    var onlySettable: Double { set }
}
 */


protocol SomeProtocol {
    static var someTypeProperty: Int { get set }
}


protocol AnotherProtocol {
    func someInstanceMethod(name: String) -> String
}

protocol SomeFailablePorotocol {
//     func someInstaneMethod(name: String = "Name")
}

protocol MethodExamProtocol {
    static func someTypeMethod(value: Int...)
    
    mutating func someMutatingMethod()
}

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

var bathRoomSwitch: OnOffSwitch = OnOffSwitch.off
bathRoomSwitch.toggle()
print(bathRoomSwitch)



//: [Next](@next)
