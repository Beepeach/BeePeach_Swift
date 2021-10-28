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

var beepeachAudio: StereoAudio = StereoAudio()
beepeachAudio.leftVolume
beepeachAudio.rightVolume

beepeachAudio.leftVolume = 200
beepeachAudio.rightVolume = 60

beepeachAudio.leftVolume
beepeachAudio.rightVolume

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
