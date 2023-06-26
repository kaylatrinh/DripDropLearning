//
//  BathtubViewController.swift
//  DripDropLearning
//
//  Created by Ariel Park on 6/25/23.
//

import UIKit
import Alamofire

class BathtubViewController: UIViewController {
    
    let bathtubScreen = BathtubView()
    var user: User!
    var posts = [Post]()
    let notificationCenter = NotificationCenter.default
    
    override func loadView() {
        view = bathtubScreen
        title = "Bathtubs"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationItem.hidesBackButton = true

        // Do any additional setup after loading the view.
        bathtubScreen.tableView.dataSource = self
        bathtubScreen.tableView.delegate = self
        bathtubScreen.tableView.reloadData()
        
        
        // Add navigation bar items
        let rightItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(plusButtonTapped))
        navigationItem.rightBarButtonItem = rightItem
        
        notificationCenter.addObserver(
            self,
            selector: #selector(notificationReceivedPost(notification:)),
            name: Notification.Name("Post"),
            object: nil)
        
        getAllPosts()
    }
    
    @objc func notificationReceivedPost(notification: Notification) {
        bathtubScreen.tableView.reloadData()
        self.posts.append((notification.object as? Post)!)
    }
    
    @objc func plusButtonTapped() {
        let addPostScreen = AddPostViewController()
        addPostScreen.user = self.user
        navigationController?.pushViewController(addPostScreen, animated: true)
    }
    
    func getAllPosts() {
        if let url = URL(string: APIConfigs.baseURL + "posts") {
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
                                    .decode([Post].self, from: data)
                                self.posts = receivedData
                                self.bathtubScreen.tableView.reloadData()
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


extension BathtubViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(posts.count)
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("NUMBER TWO")
        let cell = tableView.dequeueReusableCell(withIdentifier: "bathtubs", for: indexPath) as! BathtubTableViewCell
        cell.labelName.text = posts[indexPath.row].name
        cell.labelDescription.text = posts[indexPath.row].post_name
        if let image = Utils.imageFromBase64(posts[indexPath.row].image_data) {
            cell.imageReceipt.image = image
        }
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    // MARK: when tapping on a table cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let commentScreen = CommentViewController()
        commentScreen.post = self.posts[indexPath.row]
        commentScreen.user = self.user
        navigationController?.pushViewController(commentScreen, animated: true)
    }
}
