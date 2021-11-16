import UIKit

// MARK: - Equatable
// 값을 비교하기위해서 채용해야하는 프로토콜
// == !=
// Standard Libray의 Type들은 이미 채용하고 있다.


// MARK: - Enum
// 연관값이 없다면 자동으로 추가된다.
enum Gender {
    case female
    case male
}

Gender.female == Gender.male


// 연관값이 가지고 모든 타입이 equtable을 채용하고 있다면 Equatable을 채용해주기만하면 알아서 제공된다.
enum VideoInterface: Equatable {
    case dvi(width: Int, height: Int)
    case hdmi(width: Int, height: Int, version: Double, audioEnable: Bool)
    case displayPort(size: CGSize)
}

let hdmi = VideoInterface.hdmi(width: 2560, height: 1440, version: 2.0, audioEnable: true)
let dp = VideoInterface.displayPort(size: CGSize(width: 3840, height: 2160))

hdmi != dp


// 만약 하나라도 equtable을 채용하지 않은 타입이 있다면 직접 구현해야한다.




// MARK: - Struct
// 프로퍼티가 모두 equtable을 채용했다면 Equtable을 채용하기만 하면 된다.
struct Person: Equatable {
    let name: String
    let age: Int
}

let beepeach: Person = Person(name: "Beepach", age: 100)
let somsom: Person = Person(name: "Somsom", age: 20)

beepeach == somsom



// MARK: - Class
// 프로퍼티가 모두 채용했다고해도 기본으로 제공해주지 않는다
// 무엇을 비교할지 직접 구현해야한다.
// == 만 구현하면 !=가 알아서 구현된다.
// 특별한 이유가 없다면 모든 프로퍼티를 비교하도록 구현하는게 좋다.

class PersonObject: Equatable {
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

extension PersonObject {
    static func ==(lhs: PersonObject, rhs: PersonObject) -> Bool {
        return lhs.name == rhs.name && lhs.age == lhs.age
    }
}

let beepeachObject: PersonObject = PersonObject(name: "Beepaech", age: 100)
let unknown: PersonObject = PersonObject(name: "Unknown", age: 100)

beepeachObject != unknown


