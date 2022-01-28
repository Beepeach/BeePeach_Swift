//: [Previous](@previous)

import Foundation

// MARK: - map
// Sequence와 Collection을 따르면 Map을 사용할 수 있다.
// 기존 데이터를 변형하는데 사용된다.
let numbers: [Int] = [0, 1, 2, 3, 4]

var doubleNumbers: [Int] = []
var strings: [String] = []


// MARK: - for-in 사용
for number in numbers {
    doubleNumbers.append(number * 2)
    strings.append(String(number))
}

doubleNumbers
strings


// MARK: - map 사용
var doubleNumbersWithMap = numbers.map({ (number: Int) -> Int in
    return number * 2
})

var stringsWithMap = numbers.map({ (number: Int) -> String in
    return String(number)
})

doubleNumbersWithMap
stringsWithMap


// MARK: - 단축문법
doubleNumbersWithMap = numbers.map { $0 * 2 }
stringsWithMap = numbers.map { "\($0)" }


// MARK: - 미리 closure를 등록해서 사용하기

let evenNumbers: [Int] = [0, 2, 4, 6, 8]
let oddNumbers: [Int] = [1, 3, 5, 7, 9]
let multiplyTwo: (Int) -> Int = { $0 * 2 }

let doubleEvenNumbers = evenNumbers.map(multiplyTwo)
let doubleOddNumbers = oddNumbers.map(multiplyTwo)


//: [Next](@next)


