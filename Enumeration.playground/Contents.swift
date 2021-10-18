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
//enum PhoneError: Int {
//    case unknown
//    case batteryLevelLow
//    case outOfMemory = 100
//    case missingPowerConnection
//}
//
//PhoneError.unknown.rawValue
//PhoneError.batteryLevelLow.rawValue
//PhoneError.outOfMemory.rawValue
//PhoneError.missingPowerConnection.rawValue
//
//// PhoneError.unknown.rawValue = 999
//PhoneError(rawValue: 0)
//PhoneError(rawValue: 100)
//PhoneError(rawValue: 1000)


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

enum EnumType {
    case enumcase1(Int)
    case enumcase2(String, Int)
    case enumcase3(size: CGSize, name: String)
    case enumcase4(Int, Int, Int, Int, Int)
}


// raw value와 함께 사용할 수 없다.
enum Transportation {
    case taxi(number: String)
    case bus(number: Int, isRed: Bool)
    case subway(line: Int, isExpress: Bool)
    case airplane(Float, String)
}

var transportation: Transportation = .bus(number: 7200, isRed: true)

// Enumeration case pattern
switch transportation {
case .taxi(number: "12가 1234"):
    print("Taxi number is 12가 1234")
case .bus(number: 7200, isRed: true):
    print("Bus is 7200 red bus")
case .bus(_, isRed: true):
    print("Bus is red bus")
case .subway:
    print("Is subway")
case .airplane(_, var destination):
    destination += "!"
    print("Airplane's destination is \(destination)")
case let .airplane(price, destination) where price > 1000:
    print("\(destination) Airplane's tiket is expensive than 1000")
default:
    break
}

transportation = .airplane(1000000.0, "Canada")
transportation = .taxi(number: "33삼3333")
// MARK: - Enumeration Case Pattern

enum PhoneError {
    case unknown
    case batteryLevelLow(level: Int)
    case outOfMemory(errorNum: Int, description: String)
}

var error: PhoneError = .batteryLevelLow(level: 20)

switch error {
case .unknown:
    print("Unknown Error")
case .batteryLevelLow(let level):
    print("BetteryLevel is \(level)")
case .outOfMemory(let num, var description):
    description = "Editable"
    print(num, description)
case .outOfMemory(let myNumber, _):
    print("Memory Error num is \(myNumber)")
case let .outOfMemory(num, des):
    print(num, des)
}


if case .batteryLevelLow(10) = error {
    print("Battery Level is 10")
}

if case .outOfMemory(errorNum: 0, let des) = error {
    print(des)
}

if case let .outOfMemory(0, des) = error {
    print(des)
}

if case let .outOfMemory(_, des) = error {
    print(des)
}

//enum Transportation {
//    case taxi(number: String)
//    case bus(number: Int, isRed: Bool)
//    case subway(line: Int, isExpress: Bool)
//    case airplane(Float, String)
//}

let transportations: [Transportation] = [
    .taxi(number: "12가 1234"),
    .bus(number: 7200, isRed: true),
    .bus(number: 720-3, isRed: false),
    .subway(line: 1, isExpress: true),
    .subway(line: 2, isExpress: false),
    .subway(line: 7, isExpress: true)
]

for case .bus(let num, true) in transportations {
    print("\(num) bus is Red bus")
}

for case let .subway(1, isExpress) in transportations {
    if isExpress {
        print("Line1 is express")
    } else {
        print("No express")
    }
}

for case let .taxi(num) in transportations where num.hasPrefix("12가") {
    print("\(num) Taxi's number is started with 12가")
}


//MARK: - CaseIterable Protocol

enum Exam: Int, CaseIterable {
    case zero = 100
    case one
    case two
    case three
}

let rnd = Int.random(in: 0...3)
Exam(rawValue: rnd)

let random = Int.random(in: 0...Exam.allCases.count)

Exam.allCases
Exam.allCases.randomElement()


// MARK: - Nonfrozem Enum

enum ServiceType {
    case onlineCourse
    case offlineCamp
    case onlineCamp
}

let selectedType = ServiceType.onlineCourse

switch selectedType {
case .onlineCourse:
    print("")
case .offlineCamp:
    print("")
case .onlineCamp:
    print("")
@unknown default:
    break
}
