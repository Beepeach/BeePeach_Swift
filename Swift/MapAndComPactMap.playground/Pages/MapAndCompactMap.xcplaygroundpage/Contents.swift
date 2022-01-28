import UIKit

// MARK: - Map, CompackMap

let numbers: [String] = ["1", "2", "Three", "$$4$$", "5"]

print(numbers.map { Int($0) })
print(numbers.compactMap { Int($0) })



// MARK: - Map

let result = [1, 2, 3].map { $0 + 1 }.map { "만 \($0)살" }
print(result)

let num: Int? = 1
let result2 = num.map { $0 + 1 }
print(result2)

let myResult: Result<Int, Error> = .success(2)
let result3 = myResult.map { $0 + 1}
print(result3)

// 1. 제네릭으로 선언

// 2. transform 함수를 인자로 받는다.

// t: A -> B
// F<A> map -> F<B>



// MARK: - FlatMap
let ageString: String? = "10"
let result4 = ageString.map { Int($0) }
type(of: result4)

// t: A -> Optional<B>
// Optional<A> map -> Optional<Optional<B>>

if let x = ageString.map(Int.init), let y = x {
    print(y)
}

if case let .some(.some(x)) = ageString.map(Int.init) {
    print(x)
}

if case let x?? = ageString.map(Int.init) {
    print(x)
}

let result5 = ageString.flatMap(Int.init)
// t: A -> Optional<B>
// Optional<A> - flatMap - Optional<B>


// MARK: - map, flatMap을 이용한 구현

struct MyModel: Decodable {
    let name: String
}

let myLabel = UILabel()

if let data = UserDefaults.standard.data(forKey: "my_data_key") {
    if let model = try? JSONDecoder().decode(MyModel.self, from: data) {
        let welcomeMassage = "Hello \(model.name)"
        myLabel.text = welcomeMassage
    }
}

let welcomMessage = UserDefaults.standard.data(forKey: "my_data_key")
    .flatMap { try? JSONDecoder().decode(MyModel.self, from: $0) }
    .map(\.name)
    .map { "Hello \($0)" }

myLabel.text = welcomMessage
