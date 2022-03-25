//: [Previous](@previous)

import Foundation


// MARK: - throw하는 함수를 호출하는 방법
// 기본 함수처럼 그냥 호출할 수 없다.

// ERROR!!
// validate(num: 100)


// MARK: - throw 함수를 처리하는 4가지 방법
// 1. propagate Error
// 2. do - catch
// 3. try? - optional Biding
// 4. assert

enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Coca cola": Item(price: 1500, count: 10),
        "Pepsi cola": Item(price: 1000, count: 5),
        "Sprite": Item(price: 1300, count: 7)
    ]
    var insertedCoin = 0
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard insertedCoin < item.price else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - insertedCoin)
        }
        
        insertedCoin -= item.price
        inventory[name]?.count -= 1
        
        print("Dispensing \(name)")
    }
}



// MARK: - 1. Propagate Error (에러 전파하기)
// 예외처리를 하지않고 그대로 다시 Error를 전파합니다.
// try와 throws를 사용하면 됩니다,

let favoriteDrink = [
    "BeePeach": "Coca coala",
    "Judy": "Ice tea",
    "SomSom": "Water"
]

func buyFavoritesDrink(client: String, vendingMachine: VendingMachine) throws {
    let drinkName = favoriteDrink[client] ?? "Sprite"
    try vendingMachine.vend(itemNamed: drinkName)
}



// MARK: - rethrows
// 파라미터로 throws 함수가 전달됐을때 이 함수가 Error를 모두 처리하지 못하고 전파할때 rethrows 키워드를 사용합니다.




// MARK: - 2. Do Catch Statement
// do 는 필수 catch는 선택
// try를 안에 작성하여 에러가 발생할 수 있는 코드를 실행시킨다.
// Error가 발생하면 catch 에서 처리한다.
// do-catch문을 포함한 함수가 throws를 하지않는다면 모든 에러를 처리해야한다.
// throws를 포함한다면 모든 에러를 처리하지 않아도된다.
// else if문처럼 가장 까다로운 조건부터 처리해줘야한다.

/*
do {
    try expression
    
} catch pattern {
    // 패턴 매칭이 가능합니다.
} catch pattern where condition {
    // where을 이용해서 조건을 추가할 수 있습니다.
} catch pattern, pattern {
    // Swift 5.3부터 여러개의 패턴을 한번에 처리할 수 있습니다.
} catch pattern, pattern where condition {
    // 여러개의 패턴을 한번에 처리하면서 조건을 추가할 수도 있습니다.
} catch {
    // 아무 패턴도 매칭하지않는다면 error라는 변수가 제공됩니다.
    // 이곳에서는 모든 error를 처리합니다.
    let localError = error
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
