//
//  SavedViewController.swift
//  DripDropLearning
//
//  Created by Kayla Nguyen on 6/19/23.
//

import UIKit
import Alamofire

class SavedViewController: UIViewController {

    let savedScreen = SavedView()
    var user: User!
    var activities = [Activity]()

    override func loadView() {
        view = savedScreen
        title = "Saved"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.hidesBackButton = true
    
            
        savedScreen.tableView.dataSource = self
        savedScreen.tableView.delegate = self
        savedScreen.tableView.reloadData()
        
        // Buttons
        savedScreen.homeButton = UIBarButtonItem(image:UIImage(systemName: "house"), style: .plain, target: nil, action: #selector(homeButtonTapped))
        savedScreen.bathtubButton = UIBarButtonItem(image:UIImage(systemName: "bathtub"), style: .plain, target: nil, action: #selector(bathtubButtonTapped))
        savedScreen.bookmarkButton = UIBarButtonItem(image:UIImage(systemName: "bookmark"), style: .plain, target: nil, action: nil)
        savedScreen.profileButton = UIBarButtonItem(image:UIImage(systemName: "person"), style: .plain, target: nil, action: #selector(profileButtonTapped))

        // Bottom Bar
        let fixedSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        fixedSpace.width = 64
                
        let navigationItem = UINavigationItem()
        
        navigationItem.leftBarButtonItems = [savedScreen.homeButton, fixedSpace, savedScreen.bathtubButton, fixedSpace, savedScreen.profileButton, fixedSpace, savedScreen.bookmarkButton]
            

        savedScreen.navigationBar.setItems([navigationItem], animated: false)
    }
    
    // Action methods for the bottom bar buttons
    @objc func homeButtonTapped() {
        // Open the "Bathtub" screen
        let homeViewController = HomeViewController()
        homeViewController.user = self.user
        navigationController?.pushViewController(homeViewController, animated: true)
    }

    @objc func bathtubButtonTapped() {
        // Open the "Bookmark" screen
        let bathtubViewController = BathtubViewController()
        bathtubViewController.user = self.user
        navigationController?.pushViewController(bathtubViewController, animated: true)
    }

    @objc func profileButtonTapped() {
        // get user details
        getUserDetails()
        print(self.user.token)
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
                                
                                let profileViewController = ProfileViewController()
                                profileViewController.user = self.user
                                self.navigationController?.pushViewController(profileViewController, animated: true)
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



extension SavedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 // Adjust the number of rows as needed
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "savedActivity", for: indexPath) as! TableViewActivityCell
        
        // Customize the hardcoded cell
        if indexPath.row == 0 {
            cell.labelName.text = "Activity #1"
            cell.labelDescription.text = "This activity is an activity"
            cell.labelTime.text = "Estimated time: 30mins"
            cell.imageReceipt.image = (UIImage(systemName: "person"))
            // Set the image for imageReceipt if needed
        }
        if indexPath.row == 1 {
            cell.labelName.text = "Activity #2"
            cell.labelDescription.text = "This activity is an activity"
            cell.labelTime.text = "Estimated time: 45mins"
            cell.imageReceipt.image = (UIImage(systemName: "person"))
            // Set the image for imageReceipt if needed
        }
        if indexPath.row == 2 {
            cell.labelName.text = "Activity #3"
            cell.labelDescription.text = "This activity is an activity"
            cell.labelTime.text = "Estimated time: 60mins"
            cell.imageReceipt.image = (UIImage(systemName: "person"))
            // Set the image for imageReceipt if needed
        }
        
        return cell
    }

}




