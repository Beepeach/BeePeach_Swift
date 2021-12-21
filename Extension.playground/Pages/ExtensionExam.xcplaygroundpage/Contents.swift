//: [Previous](@previous)

import UIKit

extension Date {
    var year: Int {
        let calendar: Calendar = Calendar.current
        
        return calendar.component(.year, from: self)
    }
}

let now = Date()
print(now.year)


// MARK: - Method
extension Date {
    func convertString(to format: String = "yyyy/MM/dd") -> String {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = format
        
        return formatter.string(from: self)
    }
}

now.convertString()
now.convertString(to: "yyyy/MM/dd - HH:mm:ss")

struct Point {
    var x: Double = 0.0
    var y: Double = 0.0
}

extension Point {
    static func ==(lhs: Point, rhs: Point) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}

let point1: Point = Point(x: 10.0, y: 10.0)
let point2: Point = Point()

point1 == point2


// MARK: - Init Extension
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red / 255), green: CGFloat(green / 255), blue: CGFloat(blue / 255), alpha: 1)
    }
}

UIColor(red: 255, green: 255, blue: 255)


// MAKR: - Subscript
extension String {
    subscript(_ index: Int) -> Character? {
        if index >= self.count {
            return nil
        } else {
            let target: String.Index = self.index(self.startIndex, offsetBy: index)
            return self[target]
        }
    }
}

let name = "BeePeach"
name[0]
name[3]
name[7]
name[8]


// MARK: - Extension


//class ViewController: UIViewController {
//    let tableView: UITableView = UITableView()
//
//    override func viewDidLoad() {
//        self.tableView.dataSource = self
//    }
//}

//extension ViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//    }
//}


// MARK: - Nested Type

extension Int {
    enum Kind {
        case zero
        case positive
        case negative
    }
    
    var kind: Kind {
        switch self  {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

let number = 10
print(number.kind)


//: [Next](@next)
