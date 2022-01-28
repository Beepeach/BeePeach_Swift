import UIKit

// MARK: - CaseIterable

enum Beverage: CaseIterable {
    case coffee(price: Int)
    case tea(isIce: Bool)
    case juice(flavor: String)
    
    static var allCases: [Beverage] = [
        .coffee(price: 4500),
        .tea(isIce: true),
        .juice(flavor: "Orange")
    ]
}

let beverages = Beverage.allCases

for beverage in beverages {
    print(beverage)
}

