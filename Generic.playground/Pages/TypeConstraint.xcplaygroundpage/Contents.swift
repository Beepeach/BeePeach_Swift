//: [Previous](@previous)

import Foundation


// MARK: - Syntax
/*
func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
    // funcbody
}
*/


// MARK: - Exam

// StringArray에 해당 string이 존재한다면 index를 리턴, 없으면 nil리턴
func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    
    return nil
}




// ERROR!!
/*
func findIndex<T>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
*/


func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

findIndex(of: 10.1, in: [11.0, 204.55, 10.4])

findIndex(of: "BeePeach", in: ["SomSom", "BeePeach", "Xcode"])

//: [Next](@next)
