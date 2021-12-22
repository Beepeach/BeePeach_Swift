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

//: [Next](@next)
