//
//  SaveActivity.swift
//  DripDropLearning
//
//  Created by Ariel Park on 6/26/23.
//

import Foundation

struct Save: Codable {
    var activity: String
    var type: String
    var description: String
    var grade_level: String
    var image_data: String
}
