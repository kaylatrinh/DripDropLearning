//
//  ProfileViewController.swift
//  DripDropLearning
//
//  Created by Kayla Nguyen on 6/19/23.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileScreen = ProfileView()
    let notificationCenter = NotificationCenter.default
    var user: User!
    
    override func loadView() {
        view = profileScreen
        title = "Profile"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        fillInDetails()
        
        profileScreen.buttonLogOut.addTarget(self, action: #selector(onButtonLogoutTapped), for: .touchUpInside)
    }
    
    func fillInDetails() {
        profileScreen.labelName.text! += self.user.name
        profileScreen.labelEmail.text! += self.user.email
    }
    
    @objc func onButtonLogoutTapped() {
        let eraseUser = User(name: "nil", password: "nil", email: "nil", token: "nil")
        self.notificationCenter.post(
            name: Notification.Name("Logout"),
            object: eraseUser)
        navigationController?.popToRootViewController(animated: true)
    }
}
