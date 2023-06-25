//
//  User.swift
//  DripDropLearning
//
//  Created by Ariel Park on 6/25/23.
//

import Foundation

//MARK: struct for a user...
struct User: Codable {
    var name: String
    var password: String
    var email: String
    var token: String
    
    init(name: String, password: String, email: String, token: String) {
        self.name = name
        self.email = email
        self.password = password
        self.token = token
    }
}
