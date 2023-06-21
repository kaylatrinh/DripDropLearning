//
//  SavedViewController.swift
//  DripDropLearning
//
//  Created by Kayla Nguyen on 6/19/23.
//

import UIKit

class SavedViewController: UIViewController {

    let savedScreen = SavedView()

    override func loadView() {
        view = savedScreen
        title = "Saved"
    }

    override func viewDidLoad() {
            super.viewDidLoad()

            
            let rightItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: #selector(filterButtonTapped))
            navigationItem.rightBarButtonItem = rightItem
            
        savedScreen.tableView.dataSource = self
        savedScreen.tableView.delegate = self
        savedScreen.tableView.reloadData()

        }

    
    @objc func filterButtonTapped() {
            
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




