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
    
    // 꼭 Computed property가 아니여도 된다.
    var wrappedValue: Value {
        get {
            return UserDefaults.standard.object(forKey: key) as? Value ?? defaultValue
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: key)
        }
    }
    
    // 꼭 읽고 쓰는 코드만 작성하는게 아니다. 원하는 코드를 작성하자
    func reset() {
        UserDefaults.standard.setValue(defaultValue, forKey: key)
    }
    
    // 반드시 이런 형태는 아니다.
    // 대부분 wrapper의 타입으로 만들어준다.
    // projectedValue 이름으로 작성하면 컴파일러가 $속성을 추가시켜준다.
    var projectedValue: Self { return self }
}

struct Setting {
    @UserDefaultHelper(key: "initialValue", defaultValue: 1.0)
    var initialSpeed: Double
    
    @UserDefaultHelper(key: "supportGesture", defaultValue: true)
    var supportGesture: Bool
    
    // underbar를통해서 wrapper에 접근할 수 있다.
    func resetAll() {
        // 이렇게 호출은 못한다.
        // initialSpeed.reset()
        
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

// 이러한 접근은 불가능하다.
// setting._initialSpeed

// 이러한 패턴은 SwiftUI에서 자주 쓰인다.
setting.$initialSpeed.reset()



// MARK: - WrapperInitializer

@propertyWrapper
class SimpleWrapper {
    // 이렇게 stored property로 선언해도 괜찮다.
    var wrappedValue: Int
    var metadata: String?
    
    init() {
        print(#function)
        wrappedValue = 0
        metadata = nil
    }
    
    /*
    value를 이용한 생성자를 하나만 생성하면 호출한 프로퍼티의 기본값 설정에서 에러가 난다.
    기본값을 저장하면 파라미터가 wrappedValue인 생성자를 호출하도록 되어있기때문이다.
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
    // init(wrappedValue:)를 호출하게 된다.
    @SimpleWrapper
    var a: Int = 123
    
    // 주로 이렇게 생성한다.
    @SimpleWrapper(wrappedValue: 456)
    var b: Int
    
    @SimpleWrapper(wrappedValue: 789, metadata: "number")
    var c: Int
    
    // 이것도 잘 안쓰는 방식
    // 컨벤션을 하나로 통일하도록 하자.
    @SimpleWrapper(metadata: "number")
    var d: Int = 789
    
    
    /*
    lazy도 못쓴다.
     
    @SimpleWrapper(wrappedValue: 123, metadata: "number")
    lazy var e: Int
    */
    
    /*
    Computed property에서도 못쓴다.
     
    @SimpleWrapper(wrappedValue: 123, metadata: "number")
    var f: Int {
        get {
            
        }
        set {
            
        }
    }
    */
}


// MARK: - Restriction
let t = MyType()

// 이건 에러
// let t = MyType(a: 0)


/* Global에서 못쓴다.
@SimpleWrapper
var a: Int
*/
