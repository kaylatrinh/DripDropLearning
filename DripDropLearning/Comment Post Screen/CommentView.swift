//
//  CommentView.swift
//  DripDropLearning
//
//  Created by Ariel Park on 6/26/23.
//

import UIKit

class CommentView: UIView {

    var labelName: UILabel!
    var imagePost: UIImageView!
    var tableView: UITableView!
    
    var textFieldComment: UITextField!
    var buttonPostComment: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "Background")
        
        // Table View
        tableView = UITableView()
        tableView.register(CommentTableViewCell.self, forCellReuseIdentifier: "comments")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
        
        setupLabelName()
        setupImagePost()
        setupTextFieldComment()
        setupButtonPostComment()
        
        initConstraints()
    }
    
    func setupLabelName() {
        labelName = UILabel()
        labelName.textColor = .black
        labelName.text = "PLACEHOLDER"
        labelName.textAlignment = .center
        labelName.font = .boldSystemFont(ofSize: 24)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelName)
    }
    
    func setupImagePost() {
        imagePost = UIImageView()
        imagePost.contentMode = .scaleAspectFit
        imagePost.translatesAutoresizingMaskIntoConstraints = false
        imagePost.image = UIImage(systemName: "photo") // Set the system symbol image
        addSubview(imagePost)
    }
    
    func setupTextFieldComment() {
        textFieldComment = UITextField()
        textFieldComment.placeholder = "Comment"
        textFieldComment.borderStyle = .roundedRect
        textFieldComment.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldComment)
    }
    
    func setupButtonPostComment() {
        buttonPostComment = UIButton(type: .system)
        buttonPostComment.titleLabel?.font = .systemFont(ofSize: 16)
        buttonPostComment.setTitle("Send", for: .normal)
        buttonPostComment.tintColor = .systemBlue
        buttonPostComment.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonPostComment)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            labelName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            labelName.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            imagePost.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 8),
            imagePost.centerXAnchor.constraint(equalTo: centerXAnchor),
            imagePost.heightAnchor.constraint(equalToConstant: 250),
            imagePost.widthAnchor.constraint(equalToConstant: 250),
            
            textFieldComment.topAnchor.constraint(equalTo: imagePost.bottomAnchor, constant: 16),
            textFieldComment.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
            textFieldComment.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -90),
            
            buttonPostComment.topAnchor.constraint(equalTo: imagePost.bottomAnchor, constant: 15),
            buttonPostComment.leadingAnchor.constraint(equalTo: textFieldComment.trailingAnchor, constant: 15),
            
            tableView.topAnchor.constraint(equalTo: textFieldComment.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
