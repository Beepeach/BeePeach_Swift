import UIKit

// MARK: - Equatable
// 값을 비교하기위해서 채용해야하는 프로토콜
// == !=
// Standard Libray의 Type들은 이미 채용하고 있다.


// MARK: - Enum
// 기본적으로 자동으로 추가된다.
enum Gender {
    case female
    case male
}

Gender.female == Gender.male


// 그럼 RawValue가 있다면??
enum Planet: Int {
    case mercury
    case venus
    case earth
}

Planet.earth == Planet.mercury
Planet(rawValue: 0) == Planet.mercury


// 연관값있고 모든 타입이 equtable을 채용하고 있다면 Equatable을 채용해주기만하면 알아서 제공된다.
//enum Transporation: Equatable {
//    case taxi(company: String)
//    case bus(number: Int)
//    case subway(line: Int, express: Bool)
//    case airplane(departures: String, arrival: String)
//}


// 만약 하나라도 equtable을 채용하지 않은 타입이 있다면 직접 구현해야한다.
class Company {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

extension Company: Equatable {
    static func ==(lhs: Company, rhs:Company) -> Bool {
        return lhs.name == rhs.name
    }
}


enum Transporation: Equatable {
    case taxi(company: Company)
    case bus(number: Int)
    case subway(line: Int, express: Bool)
    case airplane(departures: String, arrival: String)
}

let bus = Transporation.bus(number: 7002)
let subway = Transporation.subway(line: 2, express: false)

subway == bus


// MARK: - Struct
// 프로퍼티가 모두 equtable을 채용했다면 Equtable을 채용하기만 하면 된다.
struct Person: Equatable {
    let name: String
    let age: Int
}

let beepeach: Person = Person(name: "Beepach", age: 20)
let somsom: Person = Person(name: "Somsom", age: 12)

beepeach == somsom
// false


// MARK: - Class
// 프로퍼티가 모두 채용했다고해도 기본으로 제공해주지 않는다
// 무엇을 비교할지 직접 구현해야한다.
// 특별한 이유가 없다면 모든 프로퍼티를 비교하도록 구현하는게 좋다.

// Company 구현은 위에 있다.
let apple: Company = Company(name: "Apple")
let kakao: Company = Company(name: "Kakao")

apple == kakao

apple === kakao
// false

let companies: [Company] = [Company(name: "Apple"), Company(name: "MS"), Company(name: "Kakao")]
companies.contains(apple)



companies.contains {
    $0.name == "Apple"
}
