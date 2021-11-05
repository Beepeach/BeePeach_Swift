import UIKit

// MARK: - Method
// struct, class, enum 에서 구현가능
// 호출시에 인스턴스이름 통해 호출한다.

class Sample {
    var data = 0
    static var sharedData = 123
    
    func doSomething() {
        print(data)
        print(Self.sharedData)
        print(Sample.sharedData)
    }
    
    func call() {
        doSomething()
    }
}

let a: Sample = Sample()
a.data
Sample.sharedData

a.doSomething()
a.call()



// MARK: - Mutating func
struct Size {
    var width: Double = 0.0
    var height: Double = 0.0
    
    mutating func enlarge() {
        self.width += 1.0
        self.height += 1.0
    }
}

var s = Size()
s.enlarge()

