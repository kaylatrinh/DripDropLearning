//
//  UserDetails.swift
//  DripDropLearning
//
//  Created by Ariel Park on 6/25/23.
//

import Foundation

//MARK: struct for a user's details...
struct UserDetails: Codable {
    var email: String
    var name: String
    var password: String
    
    init(email: String, name: String, password: String) {
        self.email = email
        self.name = name
        self.password = password
    }
}
