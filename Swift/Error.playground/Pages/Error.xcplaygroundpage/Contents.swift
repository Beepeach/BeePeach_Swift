import UIKit

// MARK: - ERROR
// Run Time Error
// 프로그램이 실행하는 도중 발생한다.


// MARK: - Error Type 만들기
// Error 프로토콜을 채용한 Type, enum으로 만들면 편합니다.
// Error 프로토콜은 Type을 에러가 에러처리에사용될수 있음을 나타냅니다.

enum NumberError: Error {
    case largeNumber(over: Int)
    case negativeNumber
}


// MARK: - Throw
// 에러를 발생시키는것을 에러를 throw 한다고 표현합니다.
// 에러가 발생할 수 있다고 선언이 필요하다.
// 함수, 생성자, 클로저가 에러를 발생시킬수 있다.
// throws를 통해서 에러를 던질수 있다고 표현할 수 있다.

// throw 키워드를 이용해서 에러를 throw할 수 있습니다.
throw NumberError.largeNumber(over: 1000)


// MARK: - Throws
// func name(parameter) throws -> ReturnType { }
// init(parameters) throws { }
// { (parameter) throws -> ReturnType in }


// throw를 아무곳에서 사용할 수 없습니다.
/*
func validate(num: Int) {
    guard num > 1000 else {
        throw NumberError.largeNumber(over: 1000)
    }
    
    print("This num is less than 1000")
}
*/

func validate(num: Int) throws {
    guard num > 1000 else {
        throw NumberError.largeNumber(over: 1000)
    }
    
    guard num > 0 else {
        throw NumberError.negativeNumber
    }
    
    print("This positive num is less than 1000")
}




// MARK: - throw하는 함수를 호출하는 방법
// 기본 함수처럼 그냥 호출할 수 없다.

// ERROR!!
// validate(num: 100)



// try, try?, try!와 함께 사용해야한다.
// try는 do catch와 함께 사용해야한다.
// try?는 에러가 발생하면 nil을 리턴하게된다.

// 그냥 호출하면 에러가 나는 예제
// parsing(data: ["name": "Beepeach"])




// MARK: - throw 함수를 처리하는 세가지 방법
// 1. do - catch
// 2. try? - optional Biding
// 3. rethrow
