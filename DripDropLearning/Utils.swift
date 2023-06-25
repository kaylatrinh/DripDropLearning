//
//  Utils.swift
//  DripDropLearning
//
//  Created by Ariel Park on 6/25/23.
//

import Foundation
import UIKit

public class Utils {
    // a function that takes a base64 String and converts it into an image
    public static func imageFromBase64(_ base64String: String) -> UIImage? {
        if let imageData = Data(base64Encoded: base64String) {
            return UIImage(data: imageData)
        }
        return nil
    }

    
    // a function that takes an image and turns it into a base64 String
    public static func base64StringFromImage(_ image: UIImage) -> String? {
        // Convert the image to Data
        guard let imageData = image.pngData() else {
            return nil
        }
        
        // Convert the image data to base64 string
        let base64String = imageData.base64EncodedString(options: [])
        
        return base64String
    }
}
