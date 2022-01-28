import UIKit

// MARK: - Extension
// Type을 확장한다.
// Member를 추가한다.
// class struct enum protocol에서 사용
// overriding은 불가능하다.
// computed property
// method
// init, class는 convinence init만
// subscript
// Nested Type


/*
extension Type {
    member
}
*/

/*
extension Type: Protocol {
    requiredments code
}
*/

struct Size {
    var width: Double = 0.0
    var height: Double = 0.0
}

extension Size {
    var area: Double {
        return width * height
    }
}

let s = Size()
s.area

// 프로토콜 구현도 추가가 가능하다.
extension Size: Equatable {
    public static func ==(lhs: Size, rhs: Size) -> Bool {
        return lhs.width == rhs.width && lhs.height == rhs.height
    }
}


// MARK: - Property
// 계산속성만 추가가 가능하다.
// 저장속성이나 옵저버를 추가하는것은 불가능하다.
// 속성 override도 불가능하다.

extension Date {
    var year: Int {
        let cal = Calendar.current
        
        return cal.component(.year, from: self)
    }
    
    var month: Int {
        let cal = Calendar.current
        
        return cal.component(.month, from: self)
    }
}

let today: Date = Date()
today.year
today.month

extension Double {
    var radianValue: Double {
        return (Double.pi * self) / 180.0
    }
    
    var degreeValue: Double {
        return self * 180.0 / Double.pi
    }
}

let degree = 90.0
degree.radianValue


// MARK: - Method

extension Double {
    func toFahrenheit() -> Double {
        return self * 9 / 5 + 32
    }
    
    func toCelsius() -> Double {
        return (self - 32) * 5 / 9
    }
    
    static func convertToFahrenheit(from celsius: Double) -> Double {
        return celsius.toFahrenheit()
    }
    
    static func convertToCelsius(from fahrenheit: Double) -> Double {
        return fahrenheit.toCelsius()
    }
}

extension Date {
    func toString(format: String = "yyyy/MM/dd") -> String {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = format
        
        return formatter.string(from: self)
    }
}

today.toString()
today.toString(format: "MM/dd")


extension String {
    static func random(length: Int, charactersIn chars: String = "abcdefg" ) -> String {
        var randomString = String()
        randomString.reserveCapacity(length)
        
        for _ in 0 ..< length {
            guard let char = chars.randomElement() else {
                continue
            }
            
            randomString.append(char)
        }
        
        return randomString
    }
}

String.random(length: 5)


// MARK: - Init

extension Date {
    init?(year: Int, month: Int, day: Int) {
        let calendar: Calendar = Calendar.current
        var components: DateComponents = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        
        guard let date = calendar.date(from: components) else {
            return nil
        }
        
        self = date
    }
}

Date(year: 2020, month: 10, day: 20)

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: 1.0)
    }
}
UIColor(red: 0, green: 0, blue: 255)


// MARK: - Subscript

extension String {
    subscript(index: Int) -> String? {
        guard (0..<self.count).contains(index) else {
            return nil
        }
        
        let target = self.index(startIndex, offsetBy: index)
        return String(self[target])
    }
}

let str = "Swift"
str[1]
str[100]


extension Date {
    subscript(component: Calendar.Component) -> Int? {
        let cal = Calendar.current
        return cal.component(component, from: self)
    }
}

today[.year]

