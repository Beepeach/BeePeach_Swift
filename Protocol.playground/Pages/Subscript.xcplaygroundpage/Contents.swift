//: [Previous](@previous)

import Foundation

// MARK: - Subscript

// 마찬가지로 구현부분은 생략이다.
/*
protocol ProtocolName {
    subscript(name: Type) -> ReturnType { get set }
}
*/

protocol List {
    subscript(index: Int) -> Int { get }
}

struct DataStore: List {
    subscript(index: Int) -> Int {
        return 0
    }
}

protocol Indexable {
    subscript(index: Int) -> Int { get set }
}

struct CustomData: Indexable {
    var data: [Int] = []
    
    subscript(index: Int) -> Int {
        get {
            return 0
        }
        set {
            data.insert(newValue, at: index)
        }
    }
}


//: [Next](@next)
