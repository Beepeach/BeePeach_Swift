//: [Previous](@previous)

import Foundation
import Darwin

// MARK: - self
// class, struct, enum에서 사용가능
// 인스턴스멤버에서 접근하면 인스턴스를 리턴
// 타입멤버에서 접근하면 타입자체를 리턴

class Size {
    var width: Double = 0.0
    var height: Double = 0.0
    
    func calculateArea() -> Double {
        return self.width * self.height
    }
    
    var area: Double {
        return self.calculateArea()
    }
    
    func update(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    func doSomething() {
        let c = { self.width * self.height }
        c()
    }
    
    static let unit: String = ""
    static func doSomething() {
        // self.width
        self.unit
    }
}


struct SizeValue {
    var width: Double = 0.0
    var height: Double = 0.0
    
    mutating func reset(value: Double) {
        self = SizeValue(width: value, height: value)
    }
}


// MARK: - super
// class에서 사용가능


// MARK: - Self Type
// extension, protocol, class, struct, enum에 자주 쓰인다.
// Property가 아니라 Type이다.
// 현재 Type을 나타낸다.
// Type에 의존적이지 않은 코드를 작성할 수 있다.

extension Int {
    static let zero: Self = 0
    
    var zero: Self {
        return 0
    }
    
    func makeZero() -> Self {
        Self.zero
        Int.zero
        return Self()
    }
}

extension Double {
    static let zero: Self = 0.0
    
    var zero: Self {
        Self.zero
        Int.zero
        return 0.0
    }
    
    func makeZero() -> Self {
        return Self()
    }
}

type(of: Int.zero)
type(of: Double.zero)
//: [Next](@next)
