import UIKit

// MARK: - ERROR
// Compile Time Error
// 대부분 문법과 관련되어있다.
// 컴파일러가 잘 잡아준다.

// Run Time Error
// 프로그램이 실행하는 도중 발생한다.


// MARK: - Error Type 만들기
// Error 프로토콜을 채용한 Type, 대부분 enum으로 만들어둔다.
// Swift Error처리 시스템에 통합된다.

enum DataParsingError: Error {
    case invalidType
    case invalidField
    case missingRequiredField(String)
}


// MARK: - Throw
// 에러를 발생시키는것을 에러를 throw한다고 표현한다.
// 제한없이 에러를 발생시킬수 없다.
// 에러가 발생할 수 있다고 선언이 필요하다.
// 함수, 생성자, 클로저가 에러를 발생시킬수 있다.
// throws를 통해서 에러를 던질수 있다고 표현할 수 있다.

// throw expression(Error 인스턴스)
// func name(parameter) throws -> ReturnType { }
// init(parameters) throws { }
// { (parameter) throws -> ReturnType in }

// throw를 아무곳에서 사용할 수 없는 예제
/*
func parsing(data: [String: Any]) {
    guard let _ = data["name"] else {
        throw DataParsingError.missingRequiredField("name")
    }
}
*/

func parsing(data: [String: Any]) throws {
    guard let _ = data["name"] else {
        throw DataParsingError.missingRequiredField("name")
    }
    
    guard let _ = data["age"] as? Int else {
        throw DataParsingError.invalidType
    }
    
    print("Success!!")
}



// MARK: - throw하는 함수를 호출하는 방법
// 기본 함수처럼 그냥 호출할 수 없다.
// try, try?, try!와 함께 사용해야한다.
// try는 do catch와 함께 사용해야한다.
// try?는 에러가 발생하면 nil을 리턴하게된다.

// 그냥 호출하면 에러가 나는 예제
// parsing(data: ["name": "Beepeach"])

// 실패
try? parsing(data: [:])
try? parsing(data: ["name": "Beepeach"])

// 성공
try? parsing(data: ["name": "Beepeach", "age": 30])


// MARK: - throw 함수를 처리하는 세가지 방법
// 1. do - catch
// 2. try? - optionalBiding
// 3. rethrow
