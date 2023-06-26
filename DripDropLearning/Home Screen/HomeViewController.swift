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
    var activities = [Activity]()

    override func loadView() {
        view = homeScreen
        title = "Drip Drop Learning"
        self.navigationItem.hidesBackButton = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeScreen.tableView.backgroundColor = UIColor(named: "Background")

            
            
        homeScreen.tableView.dataSource = self
        homeScreen.tableView.delegate = self
        homeScreen.tableView.reloadData()
        
        // Buttons
        homeScreen.homeButton = UIBarButtonItem(image:UIImage(systemName: "house"), style: .plain, target: nil, action: nil)
        homeScreen.bathtubButton = UIBarButtonItem(image:UIImage(systemName: "bathtub"), style: .plain, target: nil, action: #selector(bathtubButtonTapped))
        homeScreen.bookmarkButton = UIBarButtonItem(image:UIImage(systemName: "bookmark"), style: .plain, target: nil, action: #selector(bookmarkButtonTapped))
        homeScreen.profileButton = UIBarButtonItem(image:UIImage(systemName: "person"), style: .plain, target: nil, action: #selector(profileButtonTapped))

        // Bottom Bar
        let fixedSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        fixedSpace.width = 64
                
        let navigationItem = UINavigationItem()
        
        navigationItem.leftBarButtonItems = [homeScreen.homeButton, fixedSpace, homeScreen.bathtubButton, fixedSpace, homeScreen.profileButton, fixedSpace, homeScreen.bookmarkButton]
            

        homeScreen.navigationBar.setItems([navigationItem], animated: false)
        
        //homeScreen.buttonSave.addTarget(self, action: #selector(buttonSaveTapped), for: .touchUpInside)
    }
    
    // Action methods for the bottom bar buttons
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

    @objc func profileButtonTapped() {
        // get user details
        let profileViewController = ProfileViewController()
        profileViewController.user = self.user
        navigationController?.pushViewController(profileViewController, animated: true)
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

    func onCellTapped(activity: Activity) {
        let message = "Are you sure you want to save this activity?"
        let alert = UIAlertController(title: "Save", message: message, preferredStyle: .alert)
        let confirm = UIAlertAction(title: "Confirm", style: .default, handler: { (action: UIAlertAction!) in
            self.saveActivity(activity: activity)
        })
        let cancel = UIAlertAction(title: "Cancel", style: .default)
        alert.addAction(confirm)
        alert.addAction(cancel)
        self.present(alert, animated: true)
    }
    
    // does work?
    func saveActivity(activity: Activity) {
        let savedScreen = SavedViewController()
        savedScreen.activities.append(activity)
        let message = "Saved!"
        let alert = UIAlertController(title: "Confirmation", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        alert.addAction(ok)
        self.present(alert, animated: true)
    }
    
}



extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3 // Adjust the number of rows as needed
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "activity", for: indexPath) as! TableViewActivityCell
        cell.labelDescription.numberOfLines = 0
        
        // Customize the hardcoded cell
        if indexPath.row == 0 {
            cell.labelName.text = "PopUp Rainbow Cards"
            cell.labelDescription.text = "Materials: \n- Colorful Construction Paper \n- White Paper \n- Glue \n- Markers \n\nStep by Step: \n1. Cut out long rectangular paper \n2. Have students decorate with rainbow colors - horizontal stripes \n3. Accordion fold the paper, may need to combine multiple - do so by gluing two ends of the accordion together \n4. Fold construction paper in half \n5. Glue ends of the paper onto construction paper \n6. Students can decorate the construction paper\n"
            cell.labelTime.text = "Estimated time: 30mins"
            cell.imageReceipt.image = (UIImage(named: "Rainbow Image"))
            // MARK: THIS CHANGES THE BACKGROUND COLOR TO CLEAR
            cell.backgroundColor = UIColor.clear
            //cell.sendSubviewToBack(cell.contentView)
            let activity = Activity(name: "PopUp Rainbow Cards", description: "Materials: \n- Colorful Construction Paper \n- White Paper \n- Glue \n- Markers \n\nStep by Step: \n1. Cut out long rectangular paper \n2. Have students decorate with rainbow colors - horizontal stripes \n3. Accordion fold the paper, may need to combine multiple - do so by gluing two ends of the accordion together \n4. Fold construction paper in half \n5. Glue ends of the paper onto construction paper \n6. Students can decorate the construction paper\n", time: "Estimated time: 30mins", image: (UIImage(named: "Rainbow Image")!))
            activities.append(activity)
            // Set the image for imageReceipt if needed
        }
        if indexPath.row == 1 {
            cell.labelName.text = "Edible Dirt"
            cell.labelDescription.text = "Materials: \n- Chocolate Pudding \n- Regular Graham Crackers \n- Gummy Worms \n- M&M's \n- Clear Cups \n\nStep by Step: \n1. Put most of the pudding in the bottom of the cup, leaving a bit for the end \n2. Crush the graham crackers and fill the next layer of the cup \n3. Using the last of the pudding, put a small layer \n4.Decorate with the M&Ms and gummy worms\n"
            cell.labelTime.text = "Estimated time: 20mins"
            cell.imageReceipt.image = (UIImage(named: "Edible Dirt Image"))
            // MARK: THIS CHANGES THE BACKGROUND COLOR TO CLEAR
            cell.backgroundColor = UIColor.clear
            let activity = Activity(name: "Edible Dirt", description: "Materials: \n- Chocolate Pudding \n- Regular Graham Crackers \n- Gummy Worms \n- M&M's \n- Clear Cups \n\nStep by Step: \n1. Put most of the pudding in the bottom of the cup, leaving a bit for the end \n2. Crush the graham crackers and fill the next layer of the cup \n3. Using the last of the pudding, put a small layer \n4.Decorate with the M&Ms and gummy worms\n", time: "Estimated time: 20mins", image: (UIImage(named: "Edible Dirt Image"))!)
            // Set the image for imageReceipt if needed
        }
        if indexPath.row == 2 {
            cell.labelName.text = "Index Card Tower"
            cell.labelDescription.text = "Materials: \n- Index Cards \n- Construction Paper \n- Tape \n\nStep by Step: \n1. Roll index cards, tape \n2. Put down construction paper, attach ends of index cards to construction paper \n3. Stack - two or three levels \n4. Test to see how strong it is - can use books or something lighter\n"
            cell.labelTime.text = "Estimated time: 15mins"
            cell.imageReceipt.image = (UIImage(named: "Index Card Image"))
            // MARK: THIS CHANGES THE BACKGROUND COLOR TO CLEAR
            cell.backgroundColor = UIColor.clear
            let activity = Activity(name: "Index Card Tower", description: "Materials: \n- Index Cards \n- Construction Paper \n- Tape \n\nStep by Step: \n1. Roll index cards, tape \n2. Put down construction paper, attach ends of index cards to construction paper \n3. Stack - two or three levels \n4. Test to see how strong it is - can use books or something lighter\n", time: "Estimated time: 15mins", image: (UIImage(named: "Index Card Image"))!)
            // Set the image for imageReceipt if needed
        }
        
        return cell
    }

    //MARK: deal with user interaction with a cell...
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onCellTapped(activity: activities[indexPath.row])
//        let detailScreen = DetailsViewController()
//        detailScreen.contact = self.contacts[indexPath.row]
//        detailScreen.contact.setIndex(num: indexPath.row)
//        detailScreen.addInformation()
//        detailScreen.viewController = self
//        navigationController?.pushViewController(detailScreen, animated: true)
    }
}
