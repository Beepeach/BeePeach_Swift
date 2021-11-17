//: [Previous](@previous)

import Foundation

// MARK: - Unowned Optional Reference
// Swift4에서부터는 optional로 선언이 가능하다.
// 그럼 weak와는 무슨차이???
// 참조한 인스턴스가 사라질때 차이가 생긴다.
// weak는 참조한 인스턴스가 사라지면 자동적으로 nil이 할당된다.
// unowned는 참조한 인스턴스가 가라지면 자동적으로 nil을 할당하지 않는다.

class Person {
    var name: String = "Beepeach"
    var car: Car?
    
    deinit {
        print("person deinit")
    }
}

class Car {
    var model: String
    unowned var lessee: Person?
    
    init(model: String, lessee: Person) {
        self.model = model
        self.lessee = lessee
    }
    
    deinit {
        print("car deinit")
    }
}

var person: Person? = Person()
var rentedCar: Car? = Car(model: "Model3", lessee: person!)

person?.car = rentedCar
person = nil

// 여기서 에러가 발생
// rentedCar?.lessee = nil로 직접 할당해줘야한다.
// rentedCar?.lessee

rentedCar = nil



//: [Next](@next)

