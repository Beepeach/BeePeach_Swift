//: [Previous](@previous)

import Foundation

// MARK: - Reduce
// 컨테이너 내부의 값들을 하나로 합하는 기능을 수행합니다.
// 2가지가 존재합니다.
// 결과 값을 return해서 다시 연산에 사용하는 reduce(_:_:)
// inout파라미터를 사용해서 클로저 내부에서 직접 변경하는 reduce(into:_:)

let numbers: [Int] = [1, 2, 3]

var sum: Int = numbers.reduce(0, {(result: Int, element: Int) -> Int in
    print("\(result) + \(element)")
    return result + element
})

print(sum)

var subtractFromTen: Int = numbers.reduce(10) {
    print("\($0) - \($1)")
    return $0 - $1
}
// var subtractFromTen: Int = numbers.reduce(10) { $0 - $1 }

print(subtractFromTen)


var conbinedNumbersWithReduce: [Int] = numbers.reduce([-2, -1, 0]) { result, element in
    var mutableArray = result
    mutableArray.append(element)
    
    return mutableArray
}
print(conbinedNumbersWithReduce)



// ERROR!! : 직접 변경할 수 없습니다.
/*
var conbinedNumbersWithReduce: [Int] = numbers.reduce([-2, -1, 0]) { result, element in
    result.append(element)

    return result
}

var conbinedNumbersWithReduce: [Int] = numbers.reduce([-2, -1, 0]) { result, element in
    return result.append(element)
}
*/

print(conbinedNumbersWithReduce)



// MARK: - reduce(into:_:)

var sumFromTen: Int = numbers.reduce(into: 10) { (result: inout Int, element: Int) in
    print("\(result) + \(element)")
    result += element
}
print(sumFromTen)

var subtractFromZero: Int = numbers.reduce(into: 0) { $0 -= $1 }
print(subtractFromZero)

var conbinedNumbers: [Int] = numbers.reduce(into: [-2, -1, 0]) { (result: inout [Int], element) in
    result.append(element)
}
print(conbinedNumbers)


let letters: String = "abracadabra"

let charDict: [Character: Int] = letters.reduce(into: [:]) { counts, letter in
    counts[letter, default: 0] += 1
}
print(charDict)


Optional

//: [Next](@next)
