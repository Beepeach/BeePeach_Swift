import UIKit

// MARK: - Property

// Instance Stored Property
class Dog {
    let name: String = "SomSom"
    var age: Int = 11
}

let somsom: Dog = Dog()
somsom.name
somsom.age

somsom.age = 12
//somsom.name = "SumSum"


struct Cat {
    let name: String
    var age: Int
}

let tac: Cat = Cat(name: "tac", age: 2)

tac.name
tac.age

// tac.age = 3

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
    lazy var image: Image = Image()
    
    lazy var titleAndContent: String = {
        let allContents: String = title + content

        return allContents
    }()
}

var post = BlogPost()

post.titleAndContent

// 인스턴스도 var이어야한다.
// let todayPost: BlogPost = BlogPost()
// todayPost.titleAndContent


//class BlogPost {
//    let title: String = "Title"
//    let content: String = "Content"
//    lazy var image: Image = Image()
//    
//    lazy var titleAndContent: String = {
//        let allContents: String = title + content
//
//        return allContents
//    }()
//}
//
//let todayPost: BlogPost = BlogPost()
//todayPost.titleAndContent           // OK!!
