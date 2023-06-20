//
//  ViewController.swift
//  DripDropLearning
//
//  Created by Kayla Nguyen on 6/16/23.
//

import UIKit

class ViewController: UIViewController {
    
    let loginScreen = LoginView()
    
    override func loadView() {
        view = loginScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

