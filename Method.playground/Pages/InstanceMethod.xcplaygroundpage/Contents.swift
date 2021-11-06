import UIKit

// MARK: - Method
// struct, class, enum 에서 구현가능
// 호출시에 인스턴스이름 통해 호출한다.

struct Counter {
    private var count: Int = 0
    static let zero: Int = 0
    
    public mutating func increse() {
        self.count += 1
    }
    
    public mutating func increse(by amount: Int) {
        self.count += amount
    }
    
    public mutating func reset() {
        count = 0
    }
    
    public func getCount() -> Int {
        return count
    }
    
    public func printZero() {
        print(Self.zero)
        print(Counter.zero)
    }
}

var counter: Counter = Counter()
// 0
counter.increse()
// 1
counter.increse()
// 2
counter.increse(by: 10)
// 12

counter.getCount()
//12
counter.reset()
// 0

counter.printZero()


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

