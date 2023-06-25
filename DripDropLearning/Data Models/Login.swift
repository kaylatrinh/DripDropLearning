//
//  Login.swift
//  DripDropLearning
//
//  Created by Ariel Park on 6/25/23.
//

import Foundation

// MARK: struct for an account being logged in...
struct Login: Codable {
    var auth: Bool
    var token: String
}
