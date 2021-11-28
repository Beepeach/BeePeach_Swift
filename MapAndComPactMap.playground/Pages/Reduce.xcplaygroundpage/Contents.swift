//: [Previous](@previous)

import Foundation

// MARK: - Reduce
// 컨테이너 내부의 값들을 하나로 합하는 기능을 수행한다.
// 2가지가 존재한다. inout파라미터를 사용해서 원본값을 변경하는 reduce(into:_:)
// 새로운 값을 return 하는 reduce(_:_:)

let numbers: [Int] = [1, 2, 3]

var sum: Int = numbers.reduce(0, {(result: Int, next: Int) -> Int in
    print("\(result) + \(next)")
    return result + next
})

print(sum)


//: [Next](@next)
