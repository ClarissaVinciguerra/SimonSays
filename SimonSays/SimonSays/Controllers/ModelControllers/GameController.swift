//
//  GameController.swift
//  SimonSays
//
//  Created by Clarissa Vinciguerra on 10/14/20.
//

import Foundation

class GameController {
    
    // MARK: - Properties
    var userMoves: [Int] = []
    var correctMoves: [Int] = []
    
    // add a return value to the following func
    func userSelected(_ value: Int) -> Move {
        userMoves.append(value)
        
        if correctMoves.count == userMoves.count {
            if correctMoves == userMoves {
                createNextRound()
                return Move.correctAndNewRound
            } else {
                print("Incorrect")
                return Move.incorrect
            }
        } else {
            for number in 0..<userMoves.count {
                if correctMoves[number] != userMoves[number] {
                    print("Incorrect")
                    return Move.incorrect
                }
            }
            print("All moves are correct so far")
            return Move.correctAndContinue
        }
    }
    
    // function create next round
    func createNextRound() {
        correctMoves.append(pickRandomNumberBetween0and3())
        userMoves = []
        print("Correct moves: \(correctMoves)")
    }
    
    // function to start a new game
    func startNewGame() {
        correctMoves = [pickRandomNumberBetween0and3(), pickRandomNumberBetween0and3(), pickRandomNumberBetween0and3()]
        userMoves = []
        
        print("Correct moves: \(correctMoves)")
    }
    
    // function to pick a random number between 0 - 3
    private func pickRandomNumberBetween0and3() -> Int {
        return Int(arc4random_uniform(4))
    }
}
