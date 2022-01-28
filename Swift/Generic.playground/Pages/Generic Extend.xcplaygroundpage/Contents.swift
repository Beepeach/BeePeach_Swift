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
}

/*
// ERROR
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
