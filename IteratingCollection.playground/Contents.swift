import UIKit

// MARK: - Iterating
print("========= Array ===========")
let arr: [Int] = [1 ,2 ,3]

for num in arr {
    print(num)
}


print("========= Set ===========")
let set: Set = [1, 2, 3]

for num in set {
    print(num)
}

print("========= Dict ===========")
let dict: [String: Int] = ["A": 1, "B": 2, "C": 3]

for (key, value) in dict {
    print(key, value)
}

for elem in dict {
    print(elem)
}


// MARK: - forEach

print("========= Array ===========")
arr.forEach { num in
    print(num)
}


print("========= Set ===========")
set.forEach { num in
    print(num)
}


print("========= Dict ===========")
dict.forEach { (key, value) in
    print(key, value)
}

dict.forEach { elem in
    print(elem.key, elem.value)
}


// MARK: - Difference

func withForIn() {
    print(#function)
    let arr = [1, 2, 3]
    for num in arr {
        print(num)
        return
    }
}

func withForeach() {
    print(#function)
    let arr = [1 ,2, 3]
    arr.forEach { num in
        print(num)
        return
    }
}

withForIn()
withForeach()

