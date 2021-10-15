import UIKit

// MARK: - Enumeration

// Wrong case

//let north: Int = 0
//let south: Int = 1
//let east: Int = 2
//let west: Int = 3
//
//var headDirection: Int = north
//headDirection = south
//headDirection = 100

let north: String = "north"
let south: String = "south"
let east: String = "east"
let west: String = "west"

var headDirction: String = east
if headDirction == "East" {
    print("head is east")
}


// Good case

enum CompassPoint {
    case north
    case south
    case east
    case west
}

CompassPoint.north
CompassPoint.west

var directionToHead: CompassPoint = CompassPoint.west
directionToHead = .east

if directionToHead == .east {
    print("Head is east")
}

// directionToHead = 1

switch directionToHead {
case .north:
    print("Head is north")
case .south:
    print("Head is south")
case .east:
    print("Head is east")
case .west:
    print("Head is west")
}


// MARK: - Raw Value

// 주로 Objective-C와 호환을 위해 Int로 하는게 좋다.
enum PhoneError: Int {
    case unknown
    case batteryLevelLow
    case outOfMemory = 100
    case missingPowerConnection
}

PhoneError.unknown.rawValue
PhoneError.batteryLevelLow.rawValue
PhoneError.outOfMemory.rawValue
PhoneError.missingPowerConnection.rawValue

// PhoneError.unknown.rawValue = 999
PhoneError(rawValue: 0)
PhoneError(rawValue: 100)
PhoneError(rawValue: 1000)


enum Weekday: String {
    case sunday
    case monday
    case tuesday
    case wednesday = "Wed"
    case thursday
    case friday = "friday"
    case saturday
}

Weekday.sunday.rawValue
Weekday.wednesday.rawValue
Weekday.friday.rawValue


enum Platform: Character {
    case nintendo = "n"
    case sony = "s"
    case microsoft = "m"
}

// MARK: - Associdated Value

enum VideoInterface {
    case dvi(width: Int, height: Int)
    case hdmi(Int, Int, Double, Bool)
    case displayPort(CGSize)
}
// raw value와 함께 사용할 수 없다.

var input = VideoInterface.dvi(width: 2048, height: 1536)

// Enumeration case pattern
switch input {
case .dvi(2048, 1536):
    print("dvi 2048 x 1536")
case .dvi(2048, _):
    print("dvi 2048 x Any")
case .hdmi(let witdh, let height, let version, var audioEnalbed):
    audioEnalbed = false
    print(witdh, height, version, audioEnalbed)
default:
    print("Default")
}

input = .hdmi(3840, 2160, 2.1, true)

