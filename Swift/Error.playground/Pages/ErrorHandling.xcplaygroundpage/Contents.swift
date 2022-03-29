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
        
        guard insertedCoin >= item.price else {
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
    "BeePeach": "Coca cola",
    "Judy": "Ice tea",
    "SomSom": "Water"
]

func buyFavoritesDrink(client: String, vendingMachine: VendingMachine) throws {
    let drinkName = favoriteDrink[client] ?? "Sprite"
    try vendingMachine.vend(itemNamed: drinkName)
}



// MARK: - rethrows
// 파라미터로 throws 함수가 전달됐을때 이 함수가 Error를 모두 처리하지 못하고 전파할때 rethrows 키워드를 사용합니다.
enum MyError: Error {
    case throwsError
    case rethrowsError
}

func someErrorFunction() throws {
    throw MyError.throwsError
}


func nonThrowsFunction(callback: () throws -> Void) {
    // ERROR: throws가 아니라면 그냥 try하면 에러가 발생합니다.
    // try callback()
    
    // throws 키워드없이 호출하려면 do-catch 또는 try?로 에러 처리를 해줘야합니다.
    do {
        try callback()
    } catch {
        print(error)
    }
}

func throwsFunction(callback: () throws -> Void) throws {
    try callback()
    
    // throws는 내부에서 바로 throw를 할 수 있습니다. (Propagate Error)
    // throw MyError.throwsError
}


func rethrowsFunction(callback: () throws -> Void) rethrows {
    try callback()
    
    // rethrows는 내부에서 바로 throws 할 수 없습니다.
    // ERROR!!
    // throw MyError.rethrowsError
}

func anotherThrowsFunction(callback: () throws -> Void) throws {
    // throws는 외부함수에 대한 제약도 없습니다.
    do {
        try callback()
    } catch {
        throw MyError.rethrowsError
    }
    
    do {
        try someErrorFunction()
    } catch {
        throw MyError.rethrowsError
    }
}

func anotherRethrowsFunction(callback: () throws -> Void) rethrows {
    do {
        try callback()
    } catch {
        // catch에서는 throw할 수 있습니다.
        throw MyError.rethrowsError
    }
    
    // 파라미터로 전달한 함수가 아니라면 throw할 수 없습니다.
    do {
        try someErrorFunction()
    } catch {
        // ERROR!!
        // throw MyError.rethrowsError
    }
}


// throws와 rethrows의 차이
// map, filter등이 rethrows에 해당합니다.
// rethrows는 파라미터로 throws를 받는데 중요한건 반드시 오는 함수가 throws라는 말은 아닙니다.
// 그냥 일반 함수가 올 수도 있습니다.
// 즉 rethrows는 꼭 try를 붙이지 않아도됩니다. 파라미터로 전달된 함수가 throws일때만 try로 호출합니다.
func generalFunc() {
    print("No throws")
}

func throwsFunc() throws {
    MyError.throwsError
    print("Throw Error")
}

try throwsFunction(callback: generalFunc)
try throwsFunction(callback: throwsFunc)

rethrowsFunction(callback: generalFunc)
try rethrowsFunction(callback: throwsFunc)


// MARK: - 2. Do Catch Statement
// do 는 필수 catch는 선택
// try를 안에 작성하여 에러가 발생할 수 있는 코드를 실행시킵니다.
// Error가 발생하면 catch 에서 처리합니다.
// do-catch문을 포함한 함수가 throws를 하지않는다면 모든 에러를 처리해야합니다.
// throws를 포함한다면 모든 에러를 처리하지 않아도됩니다.
// else if문처럼 가장 까다로운 조건부터 처리해줘야합니다.

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

var vendingMachine = VendingMachine()
vendingMachine.insertedCoin = 1000

func buyFavoritesDrinks(client: String, vendingMachine: VendingMachine) {
    let drinkName = favoriteDrink[client] ?? "Sprite"
    
    do {
        try vendingMachine.vend(itemNamed: drinkName)
        print("Get Drink!!")
    } catch VendingMachineError.invalidSelection {
        print("Invalind Selection")
    } catch VendingMachineError.outOfStock {
        print("Out of Stock")
    } catch VendingMachineError.insufficientFunds(let coinsNeeded) {
        print("Insert an additional \(coinsNeeded)won")
    } catch {
        print("Another Error: \(error)")
    }
}


buyFavoritesDrinks(client: "BeePeach", vendingMachine: vendingMachine)


// 만약 catch문으로 모든 에러를 처리하지 않았다면 에러가 발생합니다.
// 해결 방법은 throws를 이용해서 에러를 전파시켜야합니다.


 
//: [Next](@next)
