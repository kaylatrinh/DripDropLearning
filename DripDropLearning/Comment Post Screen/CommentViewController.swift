//
//  CommentViewController.swift
//  DripDropLearning
//
//  Created by Ariel Park on 6/26/23.
//

import UIKit
import Alamofire

class CommentViewController: UIViewController {
    
    let commentScreen = CommentView()
    var post: Post!
    var allComments = [Comment]()
    var comments = [Comment]()
    var user: User!
    
    override func loadView() {
        view = commentScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        commentScreen.tableView.delegate = self
        commentScreen.tableView.dataSource = self
        
        commentScreen.buttonPostComment.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        
        getAllComments()
        fillIn()
    }
    
    @objc func sendButtonTapped() {
        var comment = ""
        if let commentText = commentScreen.textFieldComment.text {
            if commentText.isEmpty {
                // MARK: ALERT USER
                print("comment text is empty")
            } else {
                comment = Utils.changeSpaces(comment: commentText)
                print(comment)
            }
        }
        if let url = URL(string: APIConfigs.baseURL + "comment?token=" + self.user.token + "&comment=" + comment + "&photo_token=" + self.post.photo_token) {
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
                                        .decode(Comment.self, from: data)
                                    let newComment = Comment(comment: Utils.addSpaces(comment: receivedData.comment), name: receivedData.name, photo_token: receivedData.photo_token, token: receivedData.token)
                                    self.comments.append(newComment)
                                    self.commentScreen.tableView.reloadData()
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
    
    func getAllComments() {
        if let url = URL(string: APIConfigs.baseURL + "comments") {
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
                                        .decode([Comment].self, from: data)
                                    self.allComments = receivedData
                                    self.getTheseComments()
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
    
    // gets the comments specifically for this post
    func getTheseComments() {
        for comment in allComments {
            if comment.photo_token == post.photo_token {
                self.comments.append(comment)
            }
        }
        commentScreen.tableView.reloadData()
    }
    
    func fillIn() {
        commentScreen.labelName.text = post.name + " - " + post.post_name
        // MARK: ADD BACK WHEN IMAGES WORK
        //commentScreen.imagePost.image = Utils.imageFromBase64(post.image_data)
    }
    
}

extension CommentViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("NUMBER TWO")
        let cell = tableView.dequeueReusableCell(withIdentifier: "comments", for: indexPath) as! CommentTableViewCell
        cell.labelName.text = comments[indexPath.row].name
        cell.labelComment.text = comments[indexPath.row].comment
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    // MARK: when tapping on a table cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        let commentScreen = CommentViewController()
        //        commentScreen.post = self.posts[indexPath.row]
        //        navigationController?.pushViewController(commentScreen, animated: true)
    }
}
