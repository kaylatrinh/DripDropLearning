//
//  ProfileViewController.swift
//  DripDropLearning
//
//  Created by Kayla Nguyen on 6/19/23.
//

import UIKit
import Alamofire

class ProfileViewController: UIViewController {
    
    let profileScreen = ProfileView()
    let notificationCenter = NotificationCenter.default
    var user: User!
    
    override func loadView() {
        view = profileScreen
        title = "Profile"
        
        navigationController?.navigationBar.barTintColor = UIColor(named: "Background")
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        
        getUserDetails()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        fillInDetails()
        self.navigationItem.hidesBackButton = true
        
        profileScreen.buttonLogOut.addTarget(self, action: #selector(onButtonLogoutTapped), for: .touchUpInside)
        
        // Buttons
        profileScreen.homeButton = UIBarButtonItem(image:UIImage(systemName: "house"), style: .plain, target: nil, action: #selector(homeButtonTapped))
        profileScreen.bathtubButton = UIBarButtonItem(image:UIImage(systemName: "bathtub"), style: .plain, target: nil, action: #selector(bathtubButtonTapped))
        profileScreen.bookmarkButton = UIBarButtonItem(image:UIImage(systemName: "bookmark"), style: .plain, target: nil, action: #selector(bookmarkButtonTapped))
        profileScreen.profileButton = UIBarButtonItem(image:UIImage(systemName: "person"), style: .plain, target: nil, action: nil)

        // Bottom Bar
        let fixedSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        fixedSpace.width = 64
                
        let navigationItem = UINavigationItem()
        
        navigationItem.leftBarButtonItems = [profileScreen.homeButton, fixedSpace, profileScreen.bathtubButton, fixedSpace, profileScreen.profileButton, fixedSpace, profileScreen.bookmarkButton]
            

        profileScreen.navigationBar.setItems([navigationItem], animated: false)
    }
    
    // Action methods for the bottom bar buttons
    @objc func homeButtonTapped() {
        // Open the "Home" screen
        let homeViewController = HomeViewController()
        homeViewController.user = self.user
        navigationController?.pushViewController(homeViewController, animated: true)
    }

    @objc func bathtubButtonTapped() {
        // Open the "Bathtub" screen
        let bathtubViewController = BathtubViewController()
        bathtubViewController.user = self.user
        navigationController?.pushViewController(bathtubViewController, animated: true)
    }

    @objc func bookmarkButtonTapped() {
        // Open the "Bookmark" screen
        let bookmarkViewController = SavedViewController()
        bookmarkViewController.user = self.user
        navigationController?.pushViewController(bookmarkViewController, animated: true)
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
    
    func getUserDetails() {
        if let url = URL(string: APIConfigs.baseURL + "user?token=" + self.user.token) {
                let headers: HTTPHeaders = [
                    "Content-Type": "application/json"
                ]
                
                AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers)
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
                                    .decode(UserDetails.self, from: data)
                                self.user.name = receivedData.name
                                self.user.email = receivedData.email
                                self.user.password = receivedData.password
                                
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
