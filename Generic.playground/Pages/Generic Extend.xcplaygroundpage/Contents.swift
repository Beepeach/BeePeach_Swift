//: [Previous](@previous)

import Foundation

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

/*
Error
extension Stack<Element> {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}
*/

extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}




//: [Next](@next)
