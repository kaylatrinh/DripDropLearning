//
//  AddPostViewController.swift
//  DripDropLearning
//
//  Created by Ariel Park on 6/26/23.
//

import UIKit
import PhotosUI
import Alamofire

class AddPostViewController: UIViewController {
    
    let addPostScreen = AddPostView()
    var pickedImage: UIImage?
    var user: User!
    let notificationCenter = NotificationCenter.default
    
    override func loadView() {
        view = addPostScreen
        title = "Create New Post"
        
        navigationController?.navigationBar.barTintColor = UIColor(named: "Background")
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addPostScreen.buttonPost.addTarget(self, action: #selector(postButtonTapped), for: .touchUpInside)
        
        addPostScreen.buttonImage.menu = getMenuImagePicker()
    }
    
    @objc func postButtonTapped() {
        var name = ""
        if let nameText = addPostScreen.textFieldName.text {
            if nameText.isEmpty {
                // MARK: ALERT USER
                print("name text is empty")
            } else {
                name = Utils.changeSpaces(comment: nameText)
                print(name)
            }
        }
        if let url = URL(string: APIConfigs.baseURL + "post?post_name=" + name + "&image_data=" + "RANDOMFORNOW" + "&user_token=" + self.user.token) {
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
                                        .decode(Post.self, from: data)
                                    self.notificationCenter.post(
                                        name: Notification.Name("Post"),
                                        object: receivedData)
                                    self.navigationController?.popViewController(animated: true)
                                    //self.commentScreen.tableView.reloadData()
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

    func getMenuImagePicker() -> UIMenu {
        let menuItems = [
            UIAction(title: "Camera",handler: {(_) in
                self.pickUsingCamera()
            }),
            UIAction(title: "Gallery",handler: {(_) in
                self.pickPhotoFromGallery()
            })
        ]
           
        return UIMenu(title: "Select source", children: menuItems)
        
    }
    
    //MARK: take Photo using Camera...
    func pickUsingCamera() {
        let cameraController = UIImagePickerController()
        cameraController.sourceType = .camera
        cameraController.allowsEditing = true
        cameraController.delegate = self
        present(cameraController, animated: true)
    }
       
    //MARK: pick Photo using Gallery...
    func pickPhotoFromGallery() {
        var configuration = PHPickerConfiguration()
        configuration.filter = PHPickerFilter.any(of: [.images])
        configuration.selectionLimit = 1
                
        let photoPicker = PHPickerViewController(configuration: configuration)
        
        photoPicker.delegate = self
        present(photoPicker, animated: true, completion: nil)
    }
}

//MARK: adopting required protocols for PHPicker...
extension AddPostViewController: PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            dismiss(animated: true)
            
            print(results)
            
            let itemprovider = results.map(\.itemProvider)
            
            for item in itemprovider{
                if item.canLoadObject(ofClass: UIImage.self){
                    item.loadObject(ofClass: UIImage.self, completionHandler: { (image, error) in
                        DispatchQueue.main.async{
                            if let uwImage = image as? UIImage{
                                self.addPostScreen.buttonPost.setImage(
                                    uwImage.withRenderingMode(.alwaysOriginal),
                                    for: .normal
                                )
                                self.pickedImage = uwImage
                                //self.contact.image = uwImage
                            }
                        }
                    })
                }
            }
        }
}

//MARK: adopting required protocols for UIImagePicker...
extension AddPostViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let image = info[.editedImage] as? UIImage{
            self.addPostScreen.buttonImage.setImage(
                image.withRenderingMode(.alwaysOriginal),
                for: .normal
            )
            self.pickedImage = image
            //self.contact.image = image
        }
    }
}
