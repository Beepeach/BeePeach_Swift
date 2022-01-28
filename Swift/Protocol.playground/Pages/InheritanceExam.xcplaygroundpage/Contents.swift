//: [Previous](@previous)

import Foundation

protocol SomeProtocol {
    
}

protocol AnotherProtocol {
    
}

protocol InheritingProtocol: SomeProtocol, AnotherProtocol {
    
}


protocol Readable {
    func read()
}

protocol Writable {
    func write()
}

protocol TextFile: Readable, Writable {
    var title: String { get set }
}

class CustomFile: TextFile {
    var title: String = "Title"
    
    func read() {
        print("Read")
    }
    
    func write() {
        print("Write")
    }
}

let myFile: CustomFile = CustomFile()
myFile is CustomFile
myFile is Readable
myFile is Writable
myFile is Repeatable


protocol ClassOnlyProtocol: AnyObject {
    func doSomething()
}

/*
struct SomeStruct: ClassOnlyProtocol {
    func doSomething() {
        print("Something")
    }
}
*/



protocol Playable {
    func play()
}

class ReadableFile: Readable {
    func read() {
        print("read")
    }
}

class WritableFile: Writable {
    func write() {
        print("write")
    }
}

class PlayableVedioFile: Playable {
    func play() {
        print("play")
    }
}

let readableFile: ReadableFile = ReadableFile()
let writableFile: WritableFile = WritableFile()
let readAndWritableFile: CustomFile = CustomFile()
let playableVedio: PlayableVedioFile = PlayableVedioFile()

let files: [AnyObject] = [readableFile, writableFile, readAndWritableFile, playableVedio]

for file in files {
    if let vedio = file as? Playable {
        vedio.play()
    }
}

//: [Next](@next)
