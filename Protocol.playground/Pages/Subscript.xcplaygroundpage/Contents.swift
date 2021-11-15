//: [Previous](@previous)

import Foundation

// MARK: - Subscript

// 마찬가지로 구현부분은 생략이다.
// protocol(parameter) -> ReturnType { get set }

protocol List {
    subscript(index: Int) -> Int { get }
}

struct DataStore: List {
    subscript(index: Int) -> Int {
        return 0
    }
}



//: [Next](@next)
