import UIKit


// MARK: -
// inout, defaultValue는 안된다
// parameter 생략 불가능
// 리턴형은 저장하는 값의 형식이기도 하다.
// 리턴형은 생략할 수없다.
// set은 생각이 가능하다.

/*
subscript(parameters) -> ReturnType {
    get {
        return expression
    }
    set(name) {
        statement
    }
}
*/


class List {
    var data: [Int] = [1 ,2, 3]
    
    subscript(i index: Int) -> Int {
        get {
            return data[index]
        }
        set {
            data[index] = newValue
        }
    }
}

var list: List = List()
list[i: 0]

list[i: 1] = 123
list.data

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
