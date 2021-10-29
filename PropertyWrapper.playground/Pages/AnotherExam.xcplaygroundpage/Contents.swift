//: [Previous](@previous)

import Foundation

// MARK: - NonWrapper
struct CustomStereoAudio {
    private var leftVolume: Int = 0
    private var rightVolume: Int = 0
    
    var currentLeftVolume: Int {
        get {
           return leftVolume
        }
        set {
            leftVolume = min(newValue, 100)
        }
    }
    
    var currentRightVolume: Int {
        get {
            return rightVolume
        }
        set {
            rightVolume = min(newValue, 100)
        }
    }
}

var myAudio: CustomStereoAudio = CustomStereoAudio()

myAudio.currentLeftVolume = 200
myAudio.currentLeftVolume

myAudio.currentRightVolume = 60
myAudio.currentRightVolume


// MARK: - UseWrapper

@propertyWrapper
struct HundredOrLess {
    private var number = 0
    
    var wrappedValue: Int {
        get {
            return number
        }
        set {
            number = min(newValue, 100)
        }
    }
}

struct StereoAudio {
    @HundredOrLess var leftVolume: Int
    @HundredOrLess var rightVolume: Int
}

// 이렇게 초기화 시키지 않는다.
// var beepeachAudio: StereoAudio = StereoAudio(leftVolume: 120, rightVolume: 50)

var beepeachAudio: StereoAudio = StereoAudio()
beepeachAudio.leftVolume
beepeachAudio.rightVolume

beepeachAudio.leftVolume = 200
beepeachAudio.rightVolume = 60

beepeachAudio.leftVolume
beepeachAudio.rightVolume


@propertyWrapper
class LimitedNumber {
    private var number: Int
    private var maxNumber: Int
    
    public var wrappedValue: Int {
        get {
            return number
        }
        set {
            number = min(number, maxNumber)
        }
    }
    
    init() {
        print(#function)
        self.number = 0
        self.maxNumber = 100
    }
    
    init(wrappedValue: Int) {
        print(#function)
        self.number = min(wrappedValue, 100)
        self.maxNumber = 100
    }
    
    init(number: Int, maxNumber: Int) {
        print(#function)
        self.number = min(number, maxNumber)
        self.maxNumber = maxNumber
    }
}

struct PerfectStereoAudio {
    @LimitedNumber var leftVolume: Int = 120
    @LimitedNumber var rightVolume: Int = 120
    
    init() {
        print(#function, "PerfectStereoAudio init")
    }
}

let basicAudio: PerfectStereoAudio = PerfectStereoAudio()
basicAudio.leftVolume
basicAudio.rightVolume

struct UnbalancedStereoAudio {
    @LimitedNumber(number: 50, maxNumber: 200)
    var leftVolume: Int
    @LimitedNumber(number: 400, maxNumber: 150)
    var rightVolume: Int
    
    init() {
        print(#function, "UnbalancedStereoAudio init")
    }
}

let unbalancedStereoAudio: UnbalancedStereoAudio = UnbalancedStereoAudio()


// MARK: - NoUse Wrapper attribute
struct NonAttributeAudio {
    private var _leftVolume: HundredOrLess = HundredOrLess()
    private var _rightVolume: HundredOrLess = HundredOrLess()
    
    var leftVolume: Int {
        get {
            return _leftVolume.wrappedValue
        }
        set {
            _leftVolume.wrappedValue = newValue
        }
    }
}


//: [Next](@next)
