//
//  ViewController.swift
//  DripDropLearning
//
//  Created by Kayla Nguyen on 6/16/23.
//

import UIKit
import Alamofire

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
        
        login()
        let homeViewController = HomeViewController()
        navigationController?.pushViewController(homeViewController, animated: true)
              
    }
    
    func login() {
        if let url = URL(string: APIConfigs.baseURL+"login"){
            
            AF.request(url, method: .post, parameters:
                        [
                            //MARK: we can unwrap them here since we made sure they are not null above...
                            "email": self.user.email,
                            "password": self.user.password
                        ])
            .responseData(completionHandler: { response in
                //MARK: retrieving the status code...
                let status = response.response?.statusCode
                
                switch response.result {
                case .success(let data):
                    //MARK: there was no network error...
                    
                    //MARK: status code is Optional, so unwrapping it...
                    if let uwStatusCode = status{
                        switch uwStatusCode{
                        case 200...299:
                            //MARK: the request was valid 200-level...
                            let decoder = JSONDecoder()
                            do {
                                let receivedData = try decoder
                                    .decode(Register.self, from: data)
                                self.user.token = receivedData.token
                                
                                let mainNotesScreen = MainViewController()
                                mainNotesScreen.user = self.user
                                self.navigationController?.pushViewController(mainNotesScreen, animated: true)
                                print("IT WORKED!!!!!!!!!!!")
                            } catch {
                                print("JSON COULDN'T BE DECODED")
                                print(data)
                            }
                            break
                            
                        case 400...499:
                            //MARK: the request was not valid 400-level...
                            print(data)
                            print("400 LEVEL ERROR")
                            self.showIncorrectErrorAlert()
                            break
                            
                        default:
                            //MARK: probably a 500-level error...
                            print(data)
                            break
                            
                        }
                    }
                    break
                    
                case .failure(let error):
                    //MARK: there was a network error...
                    print(error)
                    break
                }
            })
        }else{
            //alert that the URL is invalid...
            print("URL invalid")
        }
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
