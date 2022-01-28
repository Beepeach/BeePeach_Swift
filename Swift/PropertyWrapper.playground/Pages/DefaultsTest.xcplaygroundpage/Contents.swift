//: [Previous](@previous)

import Foundation

// MARK: - UserDefaultsHelper

@propertyWrapper
struct UserDefaultsHelper<Value> {
    private let key: String
    private let defaultValue: Value
    var projectedValue: Self {
        return self
    }
    
    init(key: String, defaultValue: Value) {
        self.key = key
        self.defaultValue = defaultValue
        
        UserDefaults.standard.set(defaultValue, forKey: key)
        print("Save")
    }
    
    public var wrappedValue: Value {
        get {
            return UserDefaults.standard.object(forKey: self.key) as? Value ?? self.defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: self.key)
            print("Save")
        }
    }
    
    func remove() {
        UserDefaults.standard.removeObject(forKey: self.key)
        print("Remove")
    }
}


struct SoundSetting {
    @UserDefaultsHelper(key: "volume", defaultValue: 60)
    var volume: Int
    
    @UserDefaultsHelper(key: "stereo", defaultValue: false)
    var isStereo: Bool
    
    func removeAll() {
        _volume.remove()
        _isStereo.remove()
    }
}

var mySetting: SoundSetting = SoundSetting()
mySetting.isStereo
mySetting.volume

print(UserDefaults.standard.value(forKey: "stereo") as? Bool)
print(UserDefaults.standard.value(forKey: "volume"))

mySetting.isStereo = true
mySetting.volume = 100
print(UserDefaults.standard.value(forKey: "stereo") as? Bool)
print(UserDefaults.standard.value(forKey: "volume"))

mySetting.removeAll()
print(UserDefaults.standard.value(forKey: "stereo") as? Bool)
print(UserDefaults.standard.value(forKey: "volume"))

mySetting.isStereo = true
mySetting.volume = 100
print(UserDefaults.standard.value(forKey: "stereo") as? Bool)
print(UserDefaults.standard.value(forKey: "volume"))

mySetting.$volume.remove()
print(UserDefaults.standard.value(forKey: "stereo") as? Bool)
print(UserDefaults.standard.value(forKey: "volume"))




// MARK: - Another EX

@propertyWrapper
struct HundredOrLess {
    private var number = 0
    
    private(set) var projectedValue: Bool
    
    var wrappedValue: Int {
        get {
            return number
        }
        set {
            if newValue > 100 {
                number = 100
                projectedValue = true
            } else {
                number = newValue
                projectedValue = false
            }
        }
    }
    
    init() {
        self.number = 0
        self.projectedValue = false
    }
}

struct NumberStruct {
    @HundredOrLess var value: Int
}

var num: NumberStruct = NumberStruct()
print(num.value)

num.value = 20
print(num.value)
print(num.$value)

num.value = 5000
print(num.value)
print(num.$value)

num.value = 80
print(num.$value)

//: [Next](@next)
