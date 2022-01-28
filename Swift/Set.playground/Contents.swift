import UIKit

// MARK: - Create

let noSet = [1, 2, 2, 3, 3, 3, 10, 10, 1]
let set: Set<Int> = [1, 2, 2, 3, 3, 3, 10, 10, 1]
let anotherSet: Set = ["Apple", "MS", "Google", "Apple"]


// MARK: - Read

noSet.count
set.count
set.isEmpty

set.contains(1)
anotherSet.contains("Amazon")


// MARK: - Update

var words: Set<String> = []
var insertedWord = words.insert("Apple")
insertedWord.inserted
insertedWord.memberAfterInsert

insertedWord = words.insert("Apple")
insertedWord.inserted
insertedWord.memberAfterInsert

var updatedWords = words.update(with: "Samsung")
updatedWords
updatedWords = words.update(with: "Apple")

var value = "Apple"
value.hashValue
updatedWords = words.update(with: value)

// MARK: - Difference Update, Insert

struct MyType: Hashable {
    let hashValue: Int = 100
    var data: String
    
    init(_ data: String) {
        self.data = data
    }
    
    static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}
let apple: MyType = MyType("Apple")
let google: MyType = MyType("Google")
let samsung: MyType = MyType("Samsung")

var myTypeSet: Set = [apple, google, samsung]
myTypeSet.count

apple == google
apple == samsung

let ms: MyType = MyType("MS")

var insertedInc = myTypeSet.insert(ms)
myTypeSet

var updatedInc = myTypeSet.update(with: ms)
myTypeSet


// MARK: - Delete
words.remove("Apple")
words

words.remove("MS")
words.removeAll()


// MARK: - Compare
var numSet: Set = [1, 2, 3, 4, 5, 6, 7, 8]
var evenSet: Set = [2, 4, 6, 8]
var reversedEvenSet: Set = [8, 6, 4, 2]
var otherSet: Set = [1, 2, 1, 3, 4, 5, 6, 7, 8]
var oddSet: Set = [1, 3, 5, 7]

numSet == otherSet
evenSet == reversedEvenSet
numSet != numSet

evenSet.elementsEqual(reversedEvenSet)

numSet.isSubset(of: numSet)
numSet.isStrictSubset(of: numSet)
numSet.isStrictSuperset(of: numSet)

evenSet.isSubset(of: numSet)
evenSet.isStrictSubset(of: numSet)

numSet.isSuperset(of: evenSet)

numSet.isDisjoint(with: evenSet)
oddSet.isDisjoint(with: evenSet)


// MARK: - Combine
numSet = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
evenSet = [2, 4, 6, 8, 10]
oddSet = [1, 3, 5, 7, 9]


// 합집합
var result: Set = evenSet.union(oddSet)
result == numSet

evenSet.formUnion(oddSet)
evenSet

// 교집합
evenSet = [2, 4, 6, 8, 10]
result = numSet.intersection(oddSet)
result = evenSet.intersection(oddSet)

numSet.formIntersection(evenSet)
numSet

oddSet.formIntersection(evenSet)

// 여집합
numSet = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
evenSet = [2, 4, 6, 8, 10]
oddSet = [1, 3, 5, 7, 9]

result = numSet.symmetricDifference(evenSet)
result = evenSet.symmetricDifference(oddSet)


// 차집합
result = numSet.subtracting(evenSet)

numSet.subtract(evenSet)
numSet
