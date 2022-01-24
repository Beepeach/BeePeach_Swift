//: [Previous](@previous)

import Foundation


// MARK: - Gereric Type

// 기존 형식에 타입파라미터만 추가하면 된다.
// 프로퍼티의 Type, 메서드의 Return Type, Parameter Type등 타입이 들어가는 곳이 타입파라미터로 대체될 수 있다.

/*
 class Name<T> {
 let property: T
 }
 
 struct Name<T> {
 func method(param: T) -> T {
 code
 }
 }
 
 enum Name<T> {
 case one(associated: T)
 }
 */

enum CustomEnum<T> {
    case custom(associated: T)
}

struct IntStack {
    var items: [Int] = []
    
    mutating func push(_ item: Int) {
        items.append(item)
    }
    
    mutating func pop() -> Int? {
        return items.popLast()
    }
}

var intStack: IntStack = IntStack()
intStack.push(10)
intStack.push(20)

intStack.pop()
intStack.pop()
intStack.pop()


struct Stack<Element> {
    var items: [Element] = []
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element? {
        return items.popLast()
    }
}

var stringStack: Stack<String> = Stack()
stringStack.push("Bee")

var doubleStack = Stack<Double>()
doubleStack.push(3.14)

// var errorStack = Stack()



//: [Next](@next)
