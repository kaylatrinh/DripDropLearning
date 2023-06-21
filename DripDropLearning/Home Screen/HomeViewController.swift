//
//  HomeViewController.swift
//  DripDropLearning
//
//  Created by Kayla Nguyen on 6/19/23.
//

import UIKit

class HomeViewController: UIViewController {

    let homeScreen = HomeView()

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



