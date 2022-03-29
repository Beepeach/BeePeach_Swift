//: [Previous](@previous)

import Foundation

// MARK: - Optional Try
// try? try!는 catch 또는 throws없이 사용할 수 있습니다.
// 실패시 nil이 반환됩니다.
// Error가 옵셔널값으로 변경되므로 바인딩과 함께 사용합니다.

enum NumberError: Error {
    case negativeNumber
}

func someThrowingFunc() throws -> Int {
    let number = Int.random(in: -5 ... 10)
    
    if number < 0 {
        throw NumberError.negativeNumber
    } else {
        return number
    }
}

let x = try? someThrowingFunc()

let y: Int?
do {
    y = try someThrowingFunc()
} catch {
    y = nil
}

if let _ = try? someThrowingFunc() {
    print("Sucess")
} else {
    print("Fail")
}

do {
    try someThrowingFunc()
    print("Sucess")
} catch {
    print("Fail")
}


// 위험한 try!
// try! parsing(data: [:])



//: [Next](@next)
