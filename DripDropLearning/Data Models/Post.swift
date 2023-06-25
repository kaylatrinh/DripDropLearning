//
//  Post.swift
//  DripDropLearning
//
//  Created by Ariel Park on 6/25/23.
//

import Foundation

// MARK: struct for a post...
struct Post: Codable {
    var image_data: String
    var name: String
    var photo_token: String
    var post_name: String
}

//MARK: struct for Posts...
struct Posts: Codable {
    var posts: [Post]
}

