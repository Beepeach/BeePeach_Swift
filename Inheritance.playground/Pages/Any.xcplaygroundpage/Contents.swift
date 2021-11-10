//: [Previous](@previous)

import Foundation

// MARK: - Any, AnyObject
// 잘 사용하지는 않고 이런게 있군하고 넘어가자.
// Any: 모든형식
// AnyObject: 모든 class 형식

var data: Any = 1
data = 2.3
data = "str"
data = [1, 2, 3]
data = NSString()


var obj: AnyObject = NSString()
// obj = 1

if let str = data as? String {
    print(str.count)
} else if let list = data as? [Int] {
    
}


//MARK: - Type Casting Pattern

// as? as!는 사용할 수 없다.
// as나 is만 사용이 가능하다.
switch data {
case let str as String:
    print(str.count)
case let list as [Int]:
    print(list.count)
case is Double:
    print("Double")
default:
    break
}



//: [Next](@next)


