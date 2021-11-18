//: [Previous](@previous)

import Foundation


// MARK: - Gereric Type

// 기존 형식에 타입파라미터만 추가하면 된다.
// 속성의 자료형, 메서드 리턴형, 파라미터 타입처럼 타입들을 타입파라미터로 대체할 수 있다.

/*
class Name<T> {
    
}

struct Name<T> {
    
}

enum Name<T> {
    
}
*/
 
 
struct Color<T> {
    var red: T
    var green: T
    var blue: T
}

var color: Color<Int> = Color(red: 100, green: 200, blue: 255)
// color = Color(red: 10.0, green: 20.0, blue: 30.0)

var doubleColor: Color<Double> = Color(red: 10.0, green: 20.0, blue: 30.0)


// 지금까지 써왔던 GenericType 예시
let array: Array<Int> = [1, 2, 3 ,4, 5]
let dictionary: Dictionary<String, Int> = ["one": 1]


// MARK: - Extension으로 GenericType확장하기
// 타입파라미터를 적어주지 않는다.
// 오히려 적으면 에러가 난다.
// 기존에 사용하던 타입파라미터를 그대로 사용한다.

extension Color {
    func getComponents() -> [T] {
        return [red, green, blue]
    }
}

let intColot: Color<Int> = Color(red: 1, green: 2, blue: 3)
intColot.getComponents()
doubleColor.getComponents()


// Type constaraint를 where을 이용해서 지정할 수 있다.
// 그럼 해당 프로토콜을 채용한 경우에만 멤버가 추가된다.
extension Color where T: FixedWidthInteger {
    func getFixedWidthComponents() -> [T] {
        return [red, green, blue]
    }
}

extension Color where T == Int {
    func getIntComponents() -> [T] {
        return [red, green, blue]
    }
}



//: [Next](@next)
