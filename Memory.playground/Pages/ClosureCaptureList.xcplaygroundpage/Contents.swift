//: [Previous](@previous)

import Foundation
import CoreGraphics

// MARK: - Closure CaptureList
// Closure <-> Instance
// 클로져가 인스턴스를 캡쳐하고, 인스턴스가 클로져를 강한참조로 저장하고 있다면 강한참조사이클이 발생한다.

/*
{ [list] (parameters) =-> ReturnType in
    Code
}

{ [list] in
    Code
}

{ [valueName] in
    Code
}
*/


class Car {
    var totalDrivingDistance: Double = 0.0
    var totalUsedGas: Double = 0.0
    
    // self를 통해서 인스턴스를 캡쳐  클로저실행이 종료될때까지 self를 강한 참조로 캡쳐
    // 그리고 인스턴스를 캡쳐하는 클로져가 인스턴스의 속성에 저장된다. 그럼 인스턴스는 클로저를 강한 참조한다.
    lazy var gasMileage: () -> Double = { [weak self] in
        guard let self = self else { return 0.0 }
        return self.totalDrivingDistance / self.totalUsedGas
    }
    
    func drive() {
        self.totalDrivingDistance = 1200.0
        self.totalUsedGas = 73.0
    }
    
    deinit {
        print("Car deinit")
    }
}

var myCar: Car? = Car()
myCar?.drive

// 여기까지는 클로처를 호출하지 않아서 문제가 없다.
// myCar = nil

// 이 시점에서 셀프를 캡쳐
// 그럼 서로를 참조하면서 강한 참조 사이클 발생
myCar?.gasMileage()
myCar = nil



// MARK: - ValueType Capture
// 클로저가 값을 캡쳐하면 복사본이 아닌 참조가 전달된다.
// 값형식을 캡쳐리스트에 전달하면 참조대신 복사본이 캡쳐된다.

var a: Int = 0
var b: Int = 0
var c =  { [a, b] in
    print(a, b)
}

a = 1
b = 2
c()


// MARK: - Reference Type Capture
// 참조형식을 캡쳐리스트에 추가하려면 weak, unowned를 추가해야한다.
// weak로 사용했다면 guard let self = self 처럼 바인딩을 해줘야한다.

// unowned는 바인딩하지않는 편함이 있지만 에러의 위험이 있으므로 잘 사용하지 않는다.

//: [Next](@next)
