import UIKit

let numbers: [String] = ["1", "2", "Three", "$$4$$", "5"]

print(numbers.map { Int($0) })
print(numbers.compactMap { Int($0) })
