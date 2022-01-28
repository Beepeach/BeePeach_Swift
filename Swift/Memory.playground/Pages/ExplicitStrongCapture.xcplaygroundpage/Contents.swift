//: [Previous](@previous)

import Foundation

// MARK: - Explicit Strong Capture


// 구조체는 self가 생략이 가능하다.
// 3가지 모두 같은 코드
struct PersonValue {
    let name: String = "Beepeach"
    let age: Int = 0
    
    func doSomething() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            print(name, age)
        }
    }
    
    func doSomething1() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            print(self.name, self.age)
        }
    }
    
    func doSomething2() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
            print(name, age)
        }
    }
}


// class는 self를 생략할 수 없다.
// [self] [weak self]의 차이는 강한 참조와 약한참조의 차지
// [self]는 self를 생략하고 싶을때 주로 사용하게 된다.
class PersonObject {
    let name: String = "Beepeach"
    let age: Int = 0
    
    func doSomething() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
         print(name, age)
        }
    }
}


//: [Next](@next)
