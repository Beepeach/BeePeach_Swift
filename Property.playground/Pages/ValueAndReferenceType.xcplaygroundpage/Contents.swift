//: [Previous](@previous)

import Foundation
import Darwin

// MARK: - Value Type
struct Resolution {
    var width = 0
    var height = 0
}

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

hd.width
cinema.width

cinema.width = 2048

cinema.width
hd.width


// MARK: - Reference Type
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty

alsoTenEighty.frameRate
tenEighty.frameRate

alsoTenEighty.frameRate = 30.0

alsoTenEighty.frameRate
tenEighty.frameRate

//MARK: - Identical

if alsoTenEighty === tenEighty {
    print("alsoTenEighty and tenEighty refer to same instance")
}

//: [Next](@next)
