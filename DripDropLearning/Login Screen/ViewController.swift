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
        
        loginScreen.buttonSignIn.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        loginScreen.buttonRegister.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }
    
    //Action listeners for Buttons
    @objc func signInButtonTapped(){
        guard let email = loginScreen.textfieldEmail.text, let password = loginScreen.textfieldPass.text,
              !email.isEmpty, !password.isEmpty else {
                alerUserLoginError()
                 return
        }
        
        let homeViewController = HomeViewController()
        navigationController?.pushViewController(homeViewController, animated: true)
              
    }
    
    func alerUserLoginError(){
        let alert = UIAlertController(title: "Error", message: "Empty Text Field", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
    //Action listeners for Buttons
    @objc func registerButtonTapped(){
        let registerViewController = RegisterViewController()
        navigationController?.pushViewController(registerViewController, animated: true)
    }


}
