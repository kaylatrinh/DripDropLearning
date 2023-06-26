//
//  AddPostView.swift
//  DripDropLearning
//
//  Created by Ariel Park on 6/26/23.
//

import UIKit

class AddPostView: UIView {

    var textFieldName: UITextField!
    var buttonImage: UIButton!
    var buttonPost: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "Background")
        
        setupTextFieldName()
        setupButtonImage()
        setupButtonPost()
        
        initConstraints()
    }
    
    func setupTextFieldName() {
        textFieldName = UITextField()
        textFieldName.placeholder = "Name your post!"
        textFieldName.borderStyle = .roundedRect
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldName)
    }
    
    func setupButtonImage() {
        buttonImage = UIButton(type: .system)
        buttonImage.setTitle("", for: .normal)
        buttonImage.setImage(UIImage(systemName: "camera.fill"), for: .normal)
        buttonImage.contentHorizontalAlignment = .fill
        buttonImage.contentVerticalAlignment = .fill
        buttonImage.imageView?.contentMode = .scaleAspectFit
        buttonImage.showsMenuAsPrimaryAction = true
        buttonImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonImage)
    }
    
    func setupButtonPost(){
        buttonPost = UIButton(type: .system)
        buttonPost.titleLabel?.font = .boldSystemFont(ofSize: 16)
        buttonPost.setTitle("Post", for: .normal)
        buttonPost.backgroundColor = .gray
        buttonPost.layer.cornerRadius = 5
        buttonPost.layer.borderWidth = 1
        buttonPost.layer.borderColor = UIColor.white.cgColor
        buttonPost.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonPost)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            textFieldName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            textFieldName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            buttonImage.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 16),
            buttonImage.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            //MARK: setting buttonTakePhoto's height and width...
            buttonImage.widthAnchor.constraint(equalToConstant: 100),
            buttonImage.heightAnchor.constraint(equalToConstant: 100),
            
            buttonPost.topAnchor.constraint(equalTo: buttonImage.bottomAnchor, constant: 20),
            buttonPost.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            buttonPost.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -100),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
