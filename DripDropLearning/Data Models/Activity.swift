//
//  Activity.swift
//  DripDropLearning
//
//  Created by Ariel Park on 6/26/23.
//

import Foundation
import UIKit

struct Activity {
    var name: String
    var description: String
    var time: String
    var image: UIImage
    
    init(name: String, description: String, time: String, image: UIImage) {
        self.name = name
        self.description = description
        self.time = time
        self.image = image
    }
}
