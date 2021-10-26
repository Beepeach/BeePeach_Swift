//: [Previous](@previous)

import Foundation

// MARK : - Property Observer
// var로 선언된 stored property에서 선언 가능하다.
// 예외로 subclass에 override한 computed Property에서 사용가능하다.

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("Set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter: StepCounter = StepCounter()

stepCounter.totalSteps = 200
// Set totalSteps to 200
// Added 200 steps

stepCounter.totalSteps = 600
// Set totalSteps to 600
// Added 400 steps

stepCounter.totalSteps = 600
// Set totalSteps to 600


// MARK: - NonDefault


struct Size {
    var width: Int {
        willSet {
            print("\(width) will change \(newValue)")
        }
        didSet {
            print("\(oldValue) is changed by \(width)")
        }
    }
}

var square: Size = Size(width: 10)

square.width = 20
// 10 will change 20
// 10 is changed by 20

square.width = 20
//20 will change 20
//20 is changed by 20
//: [Next](@next)
