//: [Previous](@previous)

import Foundation

class Figure {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "Unknown")
    }
}

class Rectangle: Figure {
    let width: Double
    let height: Double
    
    init(width: Double, height: Double, name: String) {
        self.width = width
        self.height = height
        super.init(name: name)
    }
    
    convenience override init(name: String) {
        self.init(width: 0, height: 0, name: name)
    }
}


// MARK: - Inheritance Exam

class Food {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

class RecipeIngredient: Food {
    var quantity: Int
    
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

let sixEggs = RecipeIngredient(name: "Egg", quantity: 6)

let bacon = RecipeIngredient(name: "Bacon")


class ShoppingListItem: RecipeIngredient {
    var purchased: Bool = false
    var description: String {
        var output = "\(quantity) X \(name)"
        output += purchased ? " ✔" : " ✘"
        
        return output
    }
}

var breakfastList = [
    ShoppingListItem(),
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name: "Eggs", quantity: 6)
]

breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true

for breakfast in breakfastList {
    print(breakfast.description)
}

//: [Next](@next)
