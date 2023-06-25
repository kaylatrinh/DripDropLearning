//
//  FriendsBathtubViewController.swift
//  BathtubScreens
//
//  Created by Kevin Daliri on 6/21/23.
//

import UIKit

class FriendsBathtubViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let bathtubFriendsScreenView = FriendsBathtubView()  // Changed variable name
        view = bathtubFriendsScreenView
        title = "Name"
        
        let menuButton = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: #selector(menuButtonTapped))
        navigationItem.rightBarButtonItem = menuButton
    }
    
    @objc func menuButtonTapped() {
        // Handle menu button tapped event
    }


}
