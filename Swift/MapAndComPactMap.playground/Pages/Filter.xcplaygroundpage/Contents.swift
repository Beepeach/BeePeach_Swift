//: [Previous](@previous)

import Foundation

// MARK: - Filter
// 특정 조건에 맞게 걸러내는 역할을 합니다.
// 새로운 컨테이너에 포함시키려면 true 버리려면 false

let numbers: [Int] = [0, 1, 2, 3, 4, 5]
let evenNumbers: [Int] = numbers.filter({ (number: Int) -> Bool in
    return number.isMultiple(of: 2)
})
evenNumbers

let oddNumbers: [Int] = numbers.filter { $0 % 2 == 1 }
oddNumbers


//: [Next](@next)
