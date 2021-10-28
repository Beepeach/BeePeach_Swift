import UIKit

// MARK: Property Wrapper
struct PlayerSetting {
    var initialSpeed: Double {
        get {
            return UserDefaults.standard.double(forKey: "initialSpeed")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "initialSpeed")
        }
    }
    
    var supportGesture: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "supportGesture")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "supportGesture")
        }
    }
}


var currentSetting: PlayerSetting = PlayerSetting()
currentSetting.initialSpeed = 1.0
currentSetting.initialSpeed

currentSetting.initialSpeed = 1.5
currentSetting.initialSpeed

currentSetting.supportGesture
currentSetting.supportGesture = true
currentSetting.supportGesture



// MARK: -

@propertyWrapper
struct UserDefaultHelper<Value> {
    let key: String
    let defaultValue: Value
    
    var wrappedValue: Value {
        get {
            return UserDefaults.standard.object(forKey: key) as? Value ?? defaultValue
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: key)
        }
    }
    
    func reset() {
        UserDefaults.standard.setValue(defaultValue, forKey: key)
    }
    
    // 반드시 이런 형태는 아니다.  대부분 wrapper의 타입으로
    // 이 이름으로 작성하면 컴파일러가 $속성을 추가시켜준다.
    var projectedValue: Self { return self }
}

struct Setting {
    @UserDefaultHelper(key: "initialValue", defaultValue: 1.0)
    var initialSpeed: Double
    
    @UserDefaultHelper(key: "supportGesture", defaultValue: true)
    var supportGesture: Bool
    
    // underbar를통해서 wrapper에 접근할 수 있다.
    func resetAll() {
        _initialSpeed.reset()
        _supportGesture.reset()
    }
}

// var setting: Setting = Setting(initialSpeed: 1.0, supportGesture: true)

var setting: Setting = Setting()

setting.initialSpeed = 1.5
// Why Error??
// setting.supportGesture


// MARK: - Projected Value
// 구현시에 projectedValue 속성을 정의해줘야한다.

//setting._initialSpeed
setting.$initialSpeed.reset()



// MARK: -

@propertyWrapper
class SimpleWrapper {
    var wrappedValue: Int
    var metadata: String?
    
    init() {
        print(#function)
        wrappedValue = 0
        metadata = nil
    }
    
    /* value를 사용하면 기본값 설정에서 에러가 난다.
    init(value: Int) {
        print(#function)
        wrappedValue = value
    }
    */
    
    init(wrappedValue value: Int) {
        print(#function)
        wrappedValue = value
        metadata = nil
    }

    init(wrappedValue: Int, metadata: String?) {
        print(#function)
        self.wrappedValue = wrappedValue
        self.metadata = metadata
    }
}

struct MyType {
    // 이건 잘 안쓰는 방식
    @SimpleWrapper
    var a: Int = 123
    
    // 주로 이렇게 생성한다.
    @SimpleWrapper(wrappedValue: 456)
    var b: Int
    
    @SimpleWrapper(wrappedValue: 789, metadata: "number")
    var c: Int
    
    // 이것도 잘 안쓰는 방식
    @SimpleWrapper(metadata: "number")
    var d: Int = 789
    
    /* lazy도 못쓴다.
    @SimpleWrapper(wrappedValue: 123, metadata: "number")
    lazy var e: Int
    */
    
    /* Computed property에서도 못쓴다.
    @SimpleWrapper(wrappedValue: 123, metadata: "number")
    var f: Int {
        get {
            
        }
        set {
            
        }
    }
    */
}

let t = MyType()

// 이건 에러
// let t = MyType(a: 0)


/* Global에서 못쓴다.
@SimpleWrapper
var a: Int
*/
