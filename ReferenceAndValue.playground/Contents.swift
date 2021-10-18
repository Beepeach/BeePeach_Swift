import UIKit

// MARK: - ReferenceType vs ValueType
struct PositionValue {
    var x = 0.0
    var y = 0.0
}

class PositionObject {
    var x = 0.0
    var y = 0.0
}

var v = PositionValue()
var o = PositionObject()

var v2 = v
var o2 = o

v2.x = 12
v2.y = 34

print(v)
print(v2)

o2.x = 12
o2.y = 34

dump(o)
dump(o2)


// MARK: - Identity Operator

// classInstance === classInstance
class A {
    
}

let a = A()
let b = a
let c = A()

a === b
a === c
b !== c


// MARK: - Nested Type

class One {
    struct Two {
        enum Three {
            case a
            
            class Four {
                
            }
        }
    }
    
    var a = Two()
}

let two: One.Two = One.Two()


