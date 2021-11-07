import UIKit


// MARK: - Subscript
// inout parameter는 사용할 수 없다.
// parameter 생략 불가능
// 리턴형은 저장하는 값의 형식이기도 하다.
// 리턴형은 생략할 수없다.
// set은 생각이 가능하다.

let numbers: [Int] = [1, 2, 3, 4, 5]
numbers[0]

let dict: [String: Int] = ["one": 1, "two": 2, "three": 3]
dict["two"]
dict["four"]

/*
subscript(parameters) -> ReturnType {
    get {
 
    }
    set(name) {
 
    }
}
*/


class List {
    var data: [Int] = [1, 2, 3, 4, 5]
    
    subscript(i index: Int) -> Int? {
        get {
            if isValidIndex(index: index) {
                return data[index]
            } else {
                return nil
            }
        }
        set {
            if let newValue = newValue {
                data[index] = newValue
            }
        }
    }
    
    private func isValidIndex(index: Int) -> Bool {
        return index >= self.data.count ? false : true
    }
}

var list: List = List()
print(list[i: 0])
list[i: 1] = 123
print(list.data)

print(list[i: 10])

// list[0, 1]
// list["A"]

struct Matrix {
    var data = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
        ]
    
    // 읽기전용
    subscript(row: Int, col: Int) -> Int {
        return data[row][col]
    }
}

let m = Matrix()

m[0, 0]
// 범위를 확인하지 않으면 에러가 난다.
// m[0, 10]


// MARK: - Dynamic Member Lookup
// Python과의 호환성을 위한것이다.
// parameter의 argumentLabel은 dynamicMember이어야하고 type은 String이어야 한다.
@dynamicMemberLookup
struct Person {
    var name: String
    var address: String
    
    subscript(dynamicMember member: String) -> String {
        switch member {
        case "nameKey":
            return self.name
        case "addressKey":
            return self.address
        default:
            return "n/a"
        }
    }
}

let p = Person(name: "Beepeach", address: "Korea")
p.name
p.address

p[dynamicMember: "nameKey"]
p[dynamicMember: "addressKey"]

p.nameKey
p.addressKey
p.keykey

// 자동완성에 안나온다/
// 컴파일 타임에 오타가 발생해도 모른다.
// 가독성과 유지보수에 힘들어진다.


// MARK: - Type Subscript

enum Planet: Int {
    case mercury = 1
    case vinus
    case earth
    case mars
    case jupiter
    case saturn
    case uranus
    case neptune
    
    static subscript(rawValue: Int) -> Planet? {
        return Planet.init(rawValue: rawValue) ?? nil
    }
}

Planet[3]
Planet[6]
Planet[100]
