//: [Previous](@previous)

import Foundation

// MARK: - map
// 함수로 전달된 매개변수를 각각 요소에 적용시켜서 다시 반환시켜주는 메서드입니다.
// 기존 데이터를 변형하는데 사용됩니다.
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
// 클로저 파라미터가 Int인 이유는 [Int]에서 호출했기 때문!
// 반환값은 내가 원하는대로 정하면 됩니다.

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


// MARK: - Optional

func addFive(_ num: Int) -> Int {
    return num + 5
}

var value: Int? = 2
// ERROR!!
// addFive(value)

// map은 컨테이너에 담긴 값에 함수를 적용시킨후에 다시 컨테이너에 담아서 반환합니다.
// 그래서 optional에 addFive 함수를 map의 파라미터로 전달하면 적용이 가능!
value.map(addFive)
value.map {
    $0 + 5
}

value = nil
value.map(addFive)

func doubledEven(_ num: Int) -> Int? {
    if num.isMultiple(of: 2) {
        return num * 2
    } else {
        return nil
    }
}

value = 4
print(value.map(doubledEven))
print(value.flatMap(doubledEven))




//: [Next](@next)


