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
    let notificationCenter = NotificationCenter.default
    var user: User!
    
    override func loadView() {
        view = loginScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loginScreen.buttonSignIn.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        loginScreen.buttonRegister.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        
        // when logout is tapped
        notificationCenter.addObserver(
            self,
            selector: #selector(notificationReceivedLogout(notification:)),
            name: Notification.Name("Logout"),
            object: nil)
    }
    
    // when logout is tapped
    @objc func notificationReceivedLogout(notification: Notification) {
        loginScreen.textfieldPass.text = ""
        loginScreen.textfieldEmail.text = ""
        self.user = notification.object as? User
    }
    
    //Action listeners for Buttons
    @objc func signInButtonTapped(){
        guard let email = loginScreen.textfieldEmail.text, let password = loginScreen.textfieldPass.text,
              !email.isEmpty, !password.isEmpty else {
                alerUserLoginError()
                 return
        }
        print(email + password)
        self.user = User(name: "nil", password: password, email: email, token: "nil")
        login()
        //let homeViewController = HomeViewController()
        //navigationController?.pushViewController(homeViewController, animated: true)
              
    }
    
    func login() {
        if let url = URL(string: APIConfigs.baseURL + "login?email=" + self.user.email + "&password=" + self.user.password) {
                let headers: HTTPHeaders = [
                    "Content-Type": "application/json"
                ]
                
                AF.request(url, method: .post, encoding: JSONEncoding.default, headers: headers)
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
                                    .decode(Login.self, from: data)
                                self.user.token = receivedData.token
                                
                                let homeViewController = HomeViewController()
                                homeViewController.user = self.user
                                self.navigationController?.pushViewController(homeViewController, animated: true)
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
                            if let statusCode = response.response?.statusCode {
                                        print("Status Code: \(statusCode)")
                                    }
                                    
                                    if let error = response.error {
                                        print("Error: \(error)")
                                    }
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
