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


// MARK: - Extension으로 GenericType확장하기
// 타입파라미터를 적어주지 않는다.
// 오히려 적으면 에러가 난다.
// 기존에 사용하던 타입파라미터를 그대로 사용한다.

struct Color<T> {
    var red: T
    var green: T
    var blue: T
}

var color: Color<Int> = Color(red: 100, green: 200, blue: 255)
// color = Color(red: 10.0, green: 20.0, blue: 30.0)

var doubleColor: Color<Double> = Color(red: 10.0, green: 20.0, blue: 30.0)

extension Color {
    func getComponents() -> [T] {
        return [red, green, blue]
    }
}

let intColot: Color<Int> = Color(red: 1, green: 2, blue: 3)
intColot.getComponents()
doubleColor.getComponents()


// Type constaraint를 where을 이용해서 지정할 수 있다.
// 그럼 해당 프로토콜을 채용한 경우에만 멤버가 추가된다.
extension Color where T: FixedWidthInteger {
    func getFixedWidthComponents() -> [T] {
        return [red, green, blue]
    }
}

extension Color where T == Int {
    func getIntComponents() -> [T] {
        return [red, green, blue]
    }
}



//: [Next](@next)
