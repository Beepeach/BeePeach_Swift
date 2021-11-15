import UIKit

// MARK: Protocol
// class struct enum
// 형식에서 공통적으로 제공하는 member
// 구현은 포함되지 않는다. 구현은 채용한 타입에서 해준다.

// MARK: - Syntax

/*
protocol ProtocolName {
    member
}

protocol ProtocolName: Protocol, ... {
    
}
*/

protocol Something {
    func doSomething()
}

struct Size: Something {
    func doSomething() {
    }
}

// Class only protocol

protocol ProtocolName: AnyObject {
    
}

protocol SomethingObject: AnyObject, Something {
    
}

/*
struct Value: SomethingObject {
    
}
*/

class Object: SomethingObject {
    func doSomething() {
    }
}



