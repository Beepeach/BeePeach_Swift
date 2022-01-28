import UIKit

// MARK: - ResultType

// throws는 결국 어떤 종류의 Error를 던지는지 나타나지 않는다.
// Error 프로토콜형태로 전달되기때문에 직접 타입캐스팅을 사용해서 사용해야하는데 뭐가 날아오는지 레퍼런스를 확인하던가 내 코드를 확인해야한다.
// 어떤 에러인지 모르니까 논리적인 에러가 발생할 수 있다.


enum NumberError: Error {
    case negativeNumber
    case evenNumber
}

enum AnotherNumberError: Error {
    case tooLarge
}

func process(oddNumber: Int) throws -> Int {
    guard oddNumber >= 0 else {
        throw NumberError.negativeNumber
    }
    
    guard !oddNumber.isMultiple(of: 2) else {
        throw NumberError.evenNumber
    }

    guard oddNumber < 1000 else {
        throw AnotherNumberError.tooLarge
    }
    
    return oddNumber * 2
}


// 기존에 error를 처리하는 방법
do {
    let result = try process(oddNumber: 1001)
    print(result)
} catch let numberError as NumberError {
    switch numberError {
    case .negativeNumber:
        print("Negative number")
        
    case .evenNumber:
        print("Even number")
    }
} catch {
    print(error.localizedDescription)
}


// MARK: - Usage

// Result가 어떻게 만들어져있나 확인!
/*
@frozen public enum Result<Success, Failure> where Failure : Error {
    /// A success, storing a `Success` value.
    case success(Success)

    /// A failure, storing a `Failure` value.
    case failure(Failure)
}
*/

let resultExam = Result { try process(oddNumber: 1) }

switch resultExam {
case .success(let data):
    print(data)
    
case .failure(let error):
    print(error)
}


// 함수를 throwing func으로 선언하지 않아도 된다.
// 성공과 실패가 enum으로 리턴된다.
// 에러를 처리하는 시점이 더이상 함수를 호출하는 시점이 아니다. (Delayed Error Handling)
func processResult(oddNumber: Int) -> Result<Int, NumberError> {
    guard oddNumber >= 0 else {
        return .failure(NumberError.negativeNumber)
    }
    
    guard !oddNumber.isMultiple(of: 2) else {
        return .failure(NumberError.evenNumber)
    }
    
    return .success(oddNumber * 2)
}

let result = processResult(oddNumber: 1)


switch result {
case .success(let data):
    print(data)
case .failure(let error):
    print(error.localizedDescription)
}

// failure를 처리하지 않으려면 break를 사용하던지 default를 사용해야하는 불편함이 있다.
// Result가 제공하는 get 메서드를 이용하면 된다.
if let result = try? result.get() {
    print(result)
}
