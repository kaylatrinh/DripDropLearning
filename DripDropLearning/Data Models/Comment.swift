//
//  Comment.swift
//  DripDropLearning
//
//  Created by Ariel Park on 6/26/23.
//

import Foundation

// MARK: struct for a comment...
struct Comment: Codable {
    var comment: String
    var name: String
    var photo_token: String
    var token: String
}

//MARK: struct for Comments...
struct Comments: Codable {
    var comments: [Comment]
}
