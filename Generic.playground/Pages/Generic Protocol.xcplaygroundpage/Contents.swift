//: [Previous](@previous)

import Foundation
import Darwin

// MARK: - Generic Protocol

// 기존에 하던것처럼 <>로 선언하면 에러가 발생한다.

/*
protocol Container<Element> {
    var count: Int { get }
    mutating func append(_ item: Element)
    subscript(i: Int) -> Element { get }
}
*/

// MARK: - Syntax

protocol Container {
    associatedtype Element
    
    var count: Int { get }
    mutating func append(_ item: Element)
    subscript(i: Int) -> Element? { get }
}


// MARK: - Usage
// 사용할때 associatedtype 이름을 그대로 사용하면 당연히 에러가 난다.

struct IntStack: Container {
    typealias Element = Int
    
    var items: [Int] = []
    
    mutating func push(_ item: Int) {
        items.append(item)
    }
    
    mutating func pop() -> Int? {
        return items.popLast()
    }
    
    var count: Int {
        return items.count
    }
    
    mutating func append(_ item: Element) {
        self.items.append(item)
    }
    
    subscript(i: Int) -> Element? {
        if i < items.count {
            return items[i]
        }
        
        return nil
    }
}


struct Stack<Element> {
    var items: [Element] = []
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element? {
        return items.popLast()
    }
    
    var count: Int {
        return items.count
    }
    
    mutating func append(_ item: Element) {
        self.items.append(item)
    }
    
    subscript(i: Int) -> Element? {
        if i < items.count {
            return items[i]
        }
        
        return nil
    }
}




//: [Next](@next)
