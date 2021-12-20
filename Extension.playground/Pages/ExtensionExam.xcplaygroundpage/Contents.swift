//: [Previous](@previous)

import Foundation

extension Date {
    var year: Int {
        let calendar: Calendar = Calendar.current
        
        return calendar.component(.year, from: self)
    }
}

let now = Date()
print(now.year)





//: [Next](@next)
