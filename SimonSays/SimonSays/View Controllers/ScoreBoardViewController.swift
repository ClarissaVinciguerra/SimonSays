//
//  ScoreBoardViewController.swift
//  SimonSays
//
//  Created by LAURA JELENICH on 10/14/20.
//

import UIKit

class ScoreBoardViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var scoreBoardTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func loginButtonPressed(_ sender: Any) {
        presentAlertController()
    }
    
    //MARK: - Class Functions
    func presentAlertController() {
        let alertController = UIAlertController(title: "Enter Username", message: "", preferredStyle: .alert)
        
        alertController.addTextField { (usernameTextField) in
            usernameTextField.placeholder = "Enter your name here..."
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let letsGoAction = UIAlertAction(title: "Let's Go!!", style: .default) { (_) in
            guard let username = alertController.textFields?[0].text, !username.isEmpty else { return }
            
//            UserController.shared.addUser()
            
            let gamePlayVC = GamePlayViewController()
            self.navigationController?.pushViewController(gamePlayVC, animated: true)

        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(letsGoAction)
        
        present(alertController, animated: true)
    }

}//END OF CLASS
