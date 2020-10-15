//
//  GamePlayViewController.swift
//  SimonSays
//
//  Created by LAURA JELENICH on 10/14/20.
//

import UIKit

class GamePlayViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var gameLabel: UILabel!
    
    
    //MARK: - Properties
    let game = GameController()
    var isGameOver = false
    
    //MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        addActionsToColorViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        game.startNewGame()
    }

    //MARK: - Actions
    @objc func handleRedTapped(_ sender: UITapGestureRecognizer? = nil) {
        if isGameOver {
           isGameOver = false
           gameLabel.text = ""
           game.startNewGame()
           showSequenceOfPresses()
        }
       let response = game.userSelected(0)
        switch response {
        case .correctAndContinue:
           print("correct, now tell the user they were right")
           show("Correct", after: 0)
        case .correctAndNewRound:
           show("Correct, time for new round", after: 0)
           showSequenceOfPresses()
           print("correct, now tell the user what the next round should be")
        case .incorrect:
           gameLabel.alpha = 1
           gameLabel.text = "You lost. Press any button to start again"
           isGameOver = true
        }
    }
    
    @objc func handleGreenTapped(_ sender: UITapGestureRecognizer? = nil) {
        if isGameOver {
            isGameOver = false
            gameLabel.text = ""
            game.startNewGame()
            showSequenceOfPresses()
        }
        let response = game.userSelected(1)
        switch response {
        case .correctAndContinue:
           print("correct, now tell the user they were right")
           show("Correct", after: 0)
        case .correctAndNewRound:
           show("Correct, time for new round", after: 0)
           showSequenceOfPresses()
           print("correct, now tell the user what the next round should be")
        case .incorrect:
           gameLabel.alpha = 1
           gameLabel.text = "You lost. Press any button to start again"
           isGameOver = true
        }
    }
    
    @objc func handleBlueTapped(_ sender: UITapGestureRecognizer? = nil) {
        if isGameOver {
            isGameOver = false
            gameLabel.text = ""
            game.startNewGame()
            showSequenceOfPresses()
        }
        let response = game.userSelected(2)
        switch response {
        case .correctAndContinue:
           show("Correct", after: 0)
        case .correctAndNewRound:
           show("Correct, time for new round", after: 0)
           showSequenceOfPresses()
        case .incorrect:
           gameLabel.alpha = 1
           gameLabel.text = "You lost. Press any button to start again"
           isGameOver = true
        }
    }
    
    @objc func handleYellowTapped(_ sender: UITapGestureRecognizer? = nil) {
        if isGameOver {
            isGameOver = false
            gameLabel.text = ""
            game.startNewGame()
            showSequenceOfPresses()
        }
        let response = game.userSelected(3)
        switch response {
        case .correctAndContinue:
           show("Correct", after: 0)
        case .correctAndNewRound:
           show("Correct, time for new round", after: 0)
           showSequenceOfPresses()
        case .incorrect:
            gameLabel.alpha = 1
            gameLabel.text = "You lost. Press any button to start again"
            isGameOver = true
            presentGameOverAlert(score: 1)
        }
    }
    
    //MARK: - Helper Functions
    func gameResponse(response: Move) {
        switch response {
        case .correctAndContinue:
           show("Correct", after: 0)
        case .correctAndNewRound:
           showSequenceOfPresses()
        case .incorrect:
           gameLabel.alpha = 1
//           gameLabel.text = "You lost. Press any button to start again"
            //Add Alert
            //Add score
           isGameOver = true
        presentGameOverAlert(score: 1)
        }
    }
    
    func addActionsToColorViews() {
        let tapRed = UITapGestureRecognizer(target: self, action: #selector(self.handleRedTapped(_:)))
        redView.addGestureRecognizer(tapRed)
        let tapGreen = UITapGestureRecognizer(target: self, action: #selector(self.handleGreenTapped(_:)))
        greenView.addGestureRecognizer(tapGreen)
        let tapBlue = UITapGestureRecognizer(target: self, action: #selector(self.handleBlueTapped(_:)))
        blueView.addGestureRecognizer(tapBlue)
        let tapYellow = UITapGestureRecognizer(target: self, action: #selector(self.handleYellowTapped(_:)))
        yellowView.addGestureRecognizer(tapYellow)
    }
    
    func showSequenceOfPresses() {
        view.isUserInteractionEnabled = false
        var count = 1.0
        
        for move in game.correctMoves {
            var colorAsString: String
            switch move {
            case 0:
                colorAsString = "red"
            case 1:
                colorAsString = "green"
            case 2:
                colorAsString = "blue"
            case 3:
                colorAsString = "yellow"
            default:
                colorAsString = "none"
            }
            show(colorAsString, after: count)
            count += 1.0
        }
        view.isUserInteractionEnabled = true
    }

    func show(_ text: String, after delay: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.gameLabel.text = text
            self.gameLabel.alpha = 1.0
            UIView.animate(withDuration: 1.0, animations:  {
                self.gameLabel.alpha = 0.0
            })
        }
    }
    
    func presentGameOverAlert(score: Int) {
        let alert = UIAlertController(title: "Game Over", message: "You scored \(score)", preferredStyle: .alert)
        let scoreBoardAction = UIAlertAction(title: "See score board", style: .default) { (_) in
            let scoreBoardVC = ScoreBoardViewController()
            self.navigationController?.pushViewController(scoreBoardVC, animated: true)
        }
        let playAgainAction = UIAlertAction(title: "Play Again", style: .destructive) { (_) in
            print("Play again")
        }
        alert.addAction(scoreBoardAction)
        alert.addAction(playAgainAction)
        present(alert, animated: true)
    }
    
    func saveScore() {
        
    }
    
}
