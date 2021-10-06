import UIKit


// MARK: - Dictionary

let dict = ["B": "Beepeach", "P": "Peach"]
type(of: dict)

let emptyDict: [String: String] = [:]

let dict1: Dictionary<String, Int>
let dict2: [String: Int]


// MARK: - Create
let words = ["A": "Apple", "B":"Banana", "C": "City"]
let emptyDict1: [String: String] = [:]

let emptyDict2 = [String: String]()
let emptyDict3 = Dictionary<String, String>()


// MARK: - Read
words.count

words.isEmpty
emptyDict.isEmpty

words["A"]

// Dictionary is optional
words["Apple"]

for key in words.keys {
    print(key)
}

for value in words.values {
    print(value)
}

for sortedKey in words.keys.sorted() {
    print(sortedKey)
}

let keys = Array(words.keys)
let values = Array(words.values)


// MARK: - Update
let a = words["E"]
type(of: a)
let b = words["E", default: "Empty"]
type(of: b)

var names = [String: String]()
names["B"] = "Beepeach"
names["P"] = "Peach"

names.count
names

names["B"] = "Bee"
names.count
names

names.updateValue("Zelda", forKey: "Z")
names.updateValue("Zee", forKey: "Z")


// MARK: - Delete

names
names["B"] = nil
names
names["L"] = nil

names.removeValue(forKey: "Z")
names
names.removeValue(forKey: "Z")

names.removeAll()
names.removeAll(keepingCapacity: true)


// MARK: - Compare

let left = ["B": "Beepeach", "Z": "Zelda", "L": "Link"]
let right = ["B": "Beepeach", "L": "Link", "Z": "Zelda"]

left == right
left != right

let lowerRight = ["B": "beepeach", "L": "link", "Z": "zelda"]
right == lowerRight

// Wrong case
right.elementsEqual(lowerRight) { (lhs, rhs) -> Bool in
    print(lhs.key, rhs.key)
    return lhs.key.caseInsensitiveCompare(rhs.key) == .orderedSame && lhs.key.caseInsensitiveCompare(rhs.key) == .orderedSame
}

// Correct case
let leftKeys = left.keys.sorted()
let rightKeys = right.keys.sorted()

leftKeys.elementsEqual(rightKeys) { (lhs, rhs) -> Bool in
    guard lhs.caseInsensitiveCompare(rhs) == .orderedSame else {
        return false
    }
    
    guard let leftVlaue = left[lhs], let rightValue = right[rhs], leftVlaue.caseInsensitiveCompare(rightValue) == .orderedSame else {
        return false
    }
    
    return true
}


// MARK: Search
let c: ((String, String)) -> Bool = {
    $0.0 == "B" || $0.1.contains("e")
}

left.contains(where: c)

let firstElement = left.first(where: c)
firstElement?.key
firstElement?.value

left.filter(c)
