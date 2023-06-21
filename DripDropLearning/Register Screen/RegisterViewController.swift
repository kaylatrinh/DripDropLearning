//
//  RegisterViewController.swift
//  DripDropLearning
//
//  Created by Kayla Nguyen on 6/19/23.
//

import UIKit

class RegisterViewController: UIViewController {
    
    let registerView = RegisterView()
    override func loadView() {
        view = registerView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        registerView.buttonCreateAccount.addTarget(self, action: #selector(createAccountTapped), for: .touchUpInside)
    }
    
    @objc func createAccountTapped(){
        let homeScreen = HomeViewController()
        navigationController?.pushViewController(homeScreen, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
