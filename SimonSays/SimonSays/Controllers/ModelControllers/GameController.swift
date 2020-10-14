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
    func userSelected(_ value: Int) {
        userMoves.append(value)
        
        if correctMoves.count == userMoves.count {
            if correctMoves == userMoves {
                // call create next round func
                //return
            } else {
                print("Incorrect")
                // return
            }
        } else {
            for number in 0..<userMoves.count {
                if correctMoves[number] != userMoves[number] {
                    print("Incorrect")
                    //return
                }
            }
            print("All moves are correct so far")
            // return Move.correctAndContinue
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
