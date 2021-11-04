//: [Previous](@previous)

import Foundation

@propertyWrapper
struct UserDefaultsHelper<Value> {
    let key: String
    let value: Value
    
    init(key: String, value: Value) {
        self.key = key
        self.value = value
        
        UserDefaults.standard.set(self.value, forKey: self.key)
    }
    
    public var wrappedValue: Value {
        get {
            return UserDefaults.standard.object(forKey: self.key) as? Value ?? self.value
        }
        set {
            UserDefaults.standard.set(newValue, forKey: self.key)
            print("Save")
        }
    }
    
    func remove() {
        UserDefaults.standard.removeObject(forKey: key)
        print("Remove")
    }
    
    func reset() {
        UserDefaults.standard.set(self.value, forKey: self.key)
    }
}

struct MySoundSetting {
    @UserDefaultsHelper(key: "myVolume", value: 60)
    var volume: Int
    
    @UserDefaultsHelper(key: "myStereo", value: false)
    var isStereo: Bool
    
    func removeAll() {
        _volume.remove()
        _isStereo.remove()
    }
    
    func reset() {
        _volume.reset()
        _isStereo.reset()
    }
}

var test: MySoundSetting = MySoundSetting()
UserDefaults.standard.object(forKey: "myVolume") as? Int


//: [Next](@next)
