import UIKit

// MARK: - Property
// let은 주로 선언에서 초기화를 해준다. 다른 값에 의존적이라면 init에서 초기화한다.


// Instance Stored Property
class Person {
    let name: String = "Beepeach"
    var age: Int = 100
}

let person = Person()
person.name
person.age
person.age = 30
// p.name = "Peach"

struct People {
    let name: String = "Beepeach"
    var age: Int = 100
}

let people = People()
// people.age = 30


// MARK: - Lazy Stored Properties
// 선언시점에 초기화를 시켜놔야한다.
// 접근할때 초기화가 된다.
// lazy var name: Type = DefaultValue

struct Image {
    init() {
        print("new image")
    }
}

struct BlogPost {
    let title: String = "Title"
    let content: String = "Content"
    lazy var attachment: Image = Image()
    
    let date: Date = Date()
    
    // lazy가 없다면 에러가 발생한다.
    // 저장속성을 클로저로 초기화할때 다른 속성에 접근하려면 lazy로 해야한다.
    lazy var formattedDate: String = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .medium
        
        return f.string(from: date)
    }()
}

// 인스턴스도 var이어야한다.
var post = BlogPost()
post.attachment
post.formattedDate
