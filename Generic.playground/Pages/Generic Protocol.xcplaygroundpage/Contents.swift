//: [Previous](@previous)

import Foundation

// MARK: - Generic Protocol

// 기존에 하던것처럼 <>로 선언하면 에러가 발생한다.

/*
protocol QueueCompatible<T> {
    func enqueue(value: T)
    func dequeue() -> T?
}

*/


// MARK: - Syntax

// associatedtype Name

protocol QueueCompatible {
    associatedtype Element
    func enqueue(value: Element)
    func dequeue() -> Element?
}

// 사용할때 associatedtype이름을 그대로 사용하면 당연히 에러가 난다.

/*
class IntegerQueue: QueueCompatible {
    func enqueue(value: Element) {
        
    }
    
    func dequeue() -> Element? {
        return 0
    }
}
*/

class DoubleQueue: QueueCompatible {
    typealias Element = Double
    func enqueue(value: Element) {

    }
    
    func dequeue() -> Element? {
        return 0.0
    }
}


// typealias를 생략하려면 이렇게 하면 된다.
class IntegerQueue: QueueCompatible {
    func enqueue(value: Int) {
        
    }
    
    func dequeue() -> Int? {
        return 0
    }
}


// Type Constraint

// associatedtype Name: Protocol




//: [Next](@next)
