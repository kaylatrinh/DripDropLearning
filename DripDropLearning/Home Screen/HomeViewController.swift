//
//  HomeViewController.swift
//  DripDropLearning
//
//  Created by Kayla Nguyen on 6/19/23.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController {

    let homeScreen = HomeView()
    
    var user: User!

    override func loadView() {
        view = homeScreen
        title = "Home"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Add navigation bar items
        let leftItem = UIBarButtonItem(image: UIImage(systemName: "camera"), style: .plain, target: self, action: #selector(cameraButtonTapped))
        navigationItem.leftBarButtonItem = leftItem
            
        let rightItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: #selector(filterButtonTapped))
        navigationItem.rightBarButtonItem = rightItem
            
        homeScreen.tableView.dataSource = self
        homeScreen.tableView.delegate = self
        homeScreen.tableView.reloadData()
        
        // Buttons
        homeScreen.homeButton = UIBarButtonItem(image:UIImage(systemName: "house"), style: .plain, target: nil, action: #selector(homeButtonTapped))
        homeScreen.bathtubButton = UIBarButtonItem(image:UIImage(systemName: "bathtub"), style: .plain, target: nil, action: #selector(bathtubButtonTapped))
        homeScreen.bookmarkButton = UIBarButtonItem(image:UIImage(systemName: "bookmark"), style: .plain, target: nil, action: #selector(bookmarkButtonTapped))
        homeScreen.profileButton = UIBarButtonItem(image:UIImage(systemName: "person"), style: .plain, target: nil, action: #selector(profileButtonTapped))

        // Bottom Bar
        let fixedSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        fixedSpace.width = 64
                
        let navigationItem = UINavigationItem()
        
        navigationItem.leftBarButtonItems = [homeScreen.homeButton, fixedSpace, homeScreen.bathtubButton, fixedSpace, homeScreen.profileButton, fixedSpace, homeScreen.bookmarkButton]
            

        homeScreen.navigationBar.setItems([navigationItem], animated: false)
    }
    
    // Action methods for the bottom bar buttons
    @objc func homeButtonTapped() {
        // Open the "Home" screen
        let homeViewController = HomeViewController()
        let navigationController = UINavigationController(rootViewController: homeViewController)
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
    }

    @objc func bathtubButtonTapped() {
        // Open the "Bathtub" screen
        let bathtubViewController = BathtubViewController()
        let navigationController = UINavigationController(rootViewController: bathtubViewController)
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
    }

    @objc func bookmarkButtonTapped() {
        // Open the "Bookmark" screen
        let bookmarkViewController = SavedViewController()
        let navigationController = UINavigationController(rootViewController: bookmarkViewController)
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
    }

    @objc func profileButtonTapped() {
//        // Open the "Profile" screen
//        let profileViewController = ProfileViewController()
//        let navigationController = UINavigationController(rootViewController: profileViewController)
//        if let window = UIApplication.shared.windows.first {
//            window.rootViewController = navigationController
//            window.makeKeyAndVisible()
//        }
        
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
//                                let navigationController = UINavigationController(rootViewController: profileViewController)
//                                if let window = UIApplication.shared.windows.first {
//                                    window.rootViewController = navigationController
//                                    window.makeKeyAndVisible()
//                                }
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
    
    @objc func cameraButtonTapped(){
        presentPhotoActionSheet()
    }
    
    @objc func filterButtonTapped() {
            
        }
    
}



extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 // Adjust the number of rows as needed
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "activity", for: indexPath) as! TableViewActivityCell
        
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

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func presentPhotoActionSheet() {
        let actionSheet = UIAlertController(title: "Profile Picture",
                                            message: "How would you like to select a picture?",
                                            preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel",
                                            style: .cancel,
                                            handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Take Photo",
                                            style: .default,
                                            handler: { [weak self] _ in
            
            self?.presentCamera()
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Choose Photo",
                                            style: .default,
                                            handler: { [weak self] _ in
            
            self?.presentPhotoPicker()
            
        }))
        
        present(actionSheet, animated: true)
    }
    
    func presentCamera() {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func presentPhotoPicker() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        homeScreen.imageView.image = selectedImage
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}



