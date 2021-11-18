//: [Previous](@previous)

import Foundation

// MARK: - Do Catch Statement
// do 는 필수
// try를 안에 작성하여 에러가 발생할 수 있는 코드를 실행시킨다.
// Errorr가 발생하면 catch 에서 처리한다.
// catch는 do에서 발생할 수 있는 모든 에러를 처리해야한다. 아니면 컴파일 에러가 발생한다.
// else if문처럼 가장 까다로운 조건부터 처리해줘야한다.

/*
do {
    
} catch pattern {
    
} catch pattern where condition {
    
}
*/

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
    
    print("Success!!")
}


// 사용 예제
do {
    try parsing(data: [:])
} catch DataParsingError.invalidType {
    print("ERROR: InvalidType")
} catch {
    print("ERROR: Another Error")
}

// 만약 모든 에러를 처리하지 않았다면 에러가 발생한다.
// 해결 방법은 해당 스코프가 에러를 던지도록 해서 에러를 전파할 수 있도록 해야한다.

// 모든 에러를 catch하지 않은 예제
/*
func handleError() {
    do {
        try parsing(data: [:])
    } catch DataParsingError.invalidType {
        print("ERROR: InvalidType")
    }
}
*/

func handleError() throws {
    do {
        try parsing(data: [:])
    } catch DataParsingError.invalidType {
        print("ERROR: InvalidType")
    }
}

// pattern이 없는 catch에서는 error라는 변수가 제공된다.
// error는 Error 프로토콜 타입이므로 타입캐스팅 후 사용하면 된다.
func handleErrorWithNoPattern() {
    do {
        try parsing(data: [:])
    } catch {
        if let dataError = error as? DataParsingError {
            switch dataError {
            case .invalidType:
                print("ERROR: InvalidType")
            case .missingRequiredField(let field):
                print("ERROR: Missing \(field)Field")
            default:
                print("ERROR")
            }
        }
    }
}


// MARK: - Multi-pattern Catch
// Swift5.3부터 사용가능
// 여러 Error를 ,로 한번에 catch에서 처리할 수 있다.

do {
    try parsing(data: [:])
} catch DataParsingError.invalidType, DataParsingError.invalidField {
    print("ERROR: Invalid error")
} catch DataParsingError.missingRequiredField(let field) {
    print("ERROR: Missing \(field)Field")
}

 
//: [Next](@next)
