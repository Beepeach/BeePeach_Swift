//: [Previous](@previous)

import UIKit

UITableViewDelegate

protocol CustomRandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: CustomRandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy: m))
        
        return lastRandom / m
    }
}

class Dice {
    let sides: Int
    let generator: CustomRandomNumberGenerator
    
    init(sides: Int, generator: CustomRandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var dice6 = Dice(sides: 6, generator: LinearCongruentialGenerator())

for _ in 1 ... 5 {
    print("Random dice roll is \(dice6.roll())")
}

protocol DiceGame {
    var dice: Dice { get }
    func play()
}

protocol DiceGameDelegate: AnyObject {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func game(_ game: DiceGame, didEndTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}

class SnakeAndLadders: DiceGame {
    let finalSquare: Int = 25
    let dice: Dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square: Int = 0
    var board: [Int]
    
    weak var delegate: DiceGameDelegate?
    
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08
        board[06] = +11
        board[09] = +09
        board[10] = +02
        board[14] = -10
        board[19] = -11
        board[22] = -02
        board[24] = -08
    }
    
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            
            switch square + diceRoll {
            case finalSquare:
                print("결승점에 도착했습니다.")
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
            delegate?.game(self, didEndTurnWithDiceRoll: diceRoll)
        }
        delegate?.gameDidEnd(self)
    }
}

class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns: Int = 0
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        
        if game is SnakeAndLadders {
            print("Snakes and Ladders 게임을 시작합니다.")
        }
        print("이 게임은 \(game.dice.sides)면 주사위를 사용합니다.")
    }
    
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("\(numberOfTurns)번째 턴: \(diceRoll)이 나왔습니다.")
    }
    
    func game(_ game: DiceGame, didEndTurnWithDiceRoll diceRoll: Int) {
        guard let snakeGame = game as? SnakeAndLadders else {
            print("\(numberOfTurns)턴이 종료되었습니다.")
            return
        }
        print("현재 위치: \(snakeGame.square)")
    }
    
    func gameDidEnd(_ game: DiceGame) {
        print("\(numberOfTurns)턴에서 게임이 끝났습니다.")
    }
}

let traker = DiceGameTracker()
let game = SnakeAndLadders()
game.delegate = traker
game.play()



//: [Next](@next)
