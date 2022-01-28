//: [Previous](@previous)

import Foundation

class Document {
    var name: String?
    
    init() {
        
    }
    
    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        
        self.name = name
    }
}

class AutomaticallyNameDocument: Document {
    override init() {
        super.init()
        self.name = "Untitled"
    }
    
    override init(name: String) {
        super.init()
        
        if name.isEmpty {
            self.name = "Untitled"
        } else {
            self.name = name
        }
    }
}





//: [Next](@next)
