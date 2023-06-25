//
//  RegisterViewController.swift
//  DripDropLearning
//
//  Created by Kayla Nguyen on 6/19/23.
//

import UIKit
import Alamofire

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
        guard let name = registerView.textfieldRegisterName.text, let email = registerView.textfieldRegisterEmail.text, let password = registerView.textfieldRegisterPass.text,
              !name.isEmpty, !email.isEmpty, !password.isEmpty else {
                //alerUserLoginError()
                 return
        }
        register(name: name, email: email, password: password)
        //let homeScreen = HomeViewController()
        //navigationController?.pushViewController(homeScreen, animated: true)
    }

    func register(name: String, email: String, password: String) {
        if let url = URL(string: APIConfigs.baseURL + "register?name=" + name + "&email=" + email + "&password=" + password) {
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
                                    .decode(Register.self, from: data)
                                //self.user.token = receivedData.token
                                
                                let loginViewController = ViewController()
                                //homeViewController.user = self.user
                                self.navigationController?.pushViewController(loginViewController, animated: true)
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

}
