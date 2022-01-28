//: [Previous](@previous)

import Foundation

// MARK: - Optional Try
// try는 do catch에서 사용해야한다.
// try? try!는 그냥 사용할 수 있다.
// 실패시 nil이 반환된다.
// Error가 옵셔널값으로 변경되므로 바인딩과 함께 사용한다.

enum DataParsingError: Error {
    case invalidType
    case invalidField
    case missingRequiredField(String)
}

func parsing(data: [String: Any]) throws {
    guard let _ = data["name"] else {
        throw DataParsingError.missingRequiredField("name")
    }
    
    guard let _ = data["age"] as? Int else {
        throw DataParsingError.invalidType
    }
}


// 두 코드는 같은 코드이다.
if let _ = try? parsing(data: [:]) {
    print("Success")
} else {
    print("Fail")
}

do {
    try parsing(data: [:])
    print("Success")
} catch {
    print("Fail")
}


// 위험한 try!
// try! parsing(data: [:])



//: [Next](@next)
