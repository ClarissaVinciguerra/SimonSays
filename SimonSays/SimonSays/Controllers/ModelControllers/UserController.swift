//
//  UserController.swift
//  SimonSays
//
//  Created by Clarissa Vinciguerra on 10/14/20.
//

import Foundation

class UserController {
    // MARK: - Properties
    static let shared = UserController()
    var users: [User] = []
    
    // MARK: - CRUD
    func addUser(name: String, score: Int) -> [User] {
        let newUser = User(name: name, score: score)
        UserController.shared.users.append(newUser)
        let sortedUsers = UserController.shared.users.sorted(by: { $0.score > $1.score })
        return sortedUsers
    }
}
