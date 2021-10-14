import UIKit

// MARK: - KeyValue Pairs

let words: KeyValuePairs<String, String> = ["A": "Apple", "B": "Beepeach", "B": "Banana"]

// let dict: Dictionary<String, String> = ["A": "Apple", "B": "Beepeach", "B": "Banana"]

words.count
words.isEmpty

words.first { (key, _) -> Bool in
    return key == "B"
}

// words["A"]
words[0]
words[1].key
words[1].value

for elem in words {
    print(elem)
}

// words[0] = nil
//words[1] = ["C": "Car"]

