//: [Previous](@previous)

import Foundation

// MARK: ARC(Automatic Reference Counting)
// 컴파일러가 메모리 관리코드를 직접 관리해준다.
// stack에 저장되는 데이터는 알아서 관리되므로 신경쓰지 않아도된다.
// Heap에 저장되는 데이터는 신경을 좀 써줘야한다.

// Owner policy(소유정책)
// Reference Count(참조 카운트)
// RC가 1이상이면 메모리에 존재. 0이 되면 삭제
// 변수가 인스턴스를 참조한다. RC + 1


// MARK: - Strong Reference
// 기본적으로 인스턴스와 소유자는 강한참조로 연결된다.
// 소유하면 RC + 1
// 포기하면 RC - 1
// 0이되면 deinit

class Person {
    var name = "Beepeach"
    var car: Car?
    deinit {
        print("person deinit")
    }
}

class Car {
    var model: String
    weak var lessee: Person?
    
    init(model: String) {
        self.model = model
    }
    
    deinit {
        print("car deinit")
    }
}

var person1: Person?
var person2: Person?
var person3: Person?

person1 = Person()
person2 = person1
person3 = person1

person1 = nil
person2 = nil
person3 = nil

var beepeach: Person? = Person()
var rentedCar: Car? = Car(model: "model3")

beepeach?.car = rentedCar
rentedCar?.lessee = beepeach

// 서로를 참조하여 메모리 누수가 발생!!
// Strong Reference Cycle
beepeach = nil
rentedCar = nil


// MARK: - Weak Reference
// 인스턴스를 참조하지만 소유하지않는다.
// 그래서 RC를 증가시키지 않는다.
// 참조하는 인스턴스가 해제되면 자동으로 nil로 초기화된다.

// weak var name: Type?
beepeach = Person()
rentedCar = Car(model: "model3")

beepeach?.car = rentedCar
rentedCar?.lessee = beepeach

beepeach = nil
rentedCar?.lessee


// MARK: - Unowned Reference
// weak와 비슷한 방식으로 동작한다.
// non-optional 방식으로 작동한다.
// 해제된 인스턴스에 접근하면 런타임에러가 발생한다.

// unowned var name: Type


//: [Next](@next)
