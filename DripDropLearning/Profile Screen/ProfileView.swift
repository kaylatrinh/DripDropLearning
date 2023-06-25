//
//  ProfileView.swift
//  DripDropLearning
//
//  Created by Kayla Nguyen on 6/19/23.
//


import UIKit

class ProfileView: UIView {
    var labelName = UILabel()
    //var labelID = UILabel()
    var labelEmail = UILabel()
    var buttonLogOut = UIButton()
    var navigationBar: UINavigationBar!
    var homeButton: UIBarButtonItem!
    var bathtubButton: UIBarButtonItem!
    var bookmarkButton: UIBarButtonItem!
    var profileButton: UIBarButtonItem!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupLabelName()
        //setupLabelID()
        setupLabelEmail()
        setupButtonLogOut()
        
        
        // Navigation Bar
        navigationBar = UINavigationBar()
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        addSubview(navigationBar)
        
        // Buttons
        homeButton = UIBarButtonItem(image:UIImage(systemName: "house"), style: .plain, target: nil, action: #selector(homeButtonTapped))
        bathtubButton = UIBarButtonItem(image:UIImage(systemName: "bathtub"), style: .plain, target: nil, action: #selector(bathtubButtonTapped))
        bookmarkButton = UIBarButtonItem(image:UIImage(systemName: "bookmark"), style: .plain, target: nil, action: #selector(bookmarkButtonTapped))
        profileButton = UIBarButtonItem(image:UIImage(systemName: "person"), style: .plain, target: nil, action: #selector(profileButtonTapped))
        
        // Bottom Bar
        let fixedSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        fixedSpace.width = 64
                
        let navigationItem = UINavigationItem()
        
        navigationItem.leftBarButtonItems = [homeButton, fixedSpace, bathtubButton, fixedSpace, profileButton, fixedSpace, bookmarkButton]
            

        navigationBar.setItems([navigationItem], animated: false)
                
        initConstraints()
    }
    
    func setupLabelName(){
        labelName = UILabel()
        labelName.font = UIFont.boldSystemFont(ofSize: 24)
        labelName.text = "Name: "
        labelName.textColor = .black
        labelName.textAlignment = .center
        labelName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelName)
    }
    
//    func setupLabelID(){
//        labelID = UILabel()
//        labelID.font = UIFont.systemFont(ofSize: 18)
//        labelID.text = "ID: "
//        labelID.textColor = .black
//        labelID.textAlignment = .center
//        labelID.translatesAutoresizingMaskIntoConstraints = false
//        self.addSubview(labelID)
//    }
    
    func setupLabelEmail(){
        labelEmail = UILabel()
        labelEmail.font = UIFont.systemFont(ofSize: 18)
        labelEmail.text = "Email: "
        labelEmail.textColor = .black
        labelEmail.textAlignment = .center
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelEmail)
    }
    
    func setupButtonLogOut(){
        buttonLogOut = UIButton(type: .system)
        buttonLogOut.titleLabel?.font = .boldSystemFont(ofSize: 16)
        buttonLogOut.setTitle("Log Out", for: .normal)
        buttonLogOut.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonLogOut)
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
        // Open the "Profile" screen
        let profileViewController = ProfileViewController()
        let navigationController = UINavigationController(rootViewController: profileViewController)
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
    }
    
    
    func initConstraints(){
        NSLayoutConstraint.activate([
        
        labelName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
        labelName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),

        
//        labelID.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 32),
//        labelID.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        
        labelEmail.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 32),
        labelEmail.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        
        buttonLogOut.bottomAnchor.constraint(equalTo: self.labelEmail.bottomAnchor, constant: 64),
        buttonLogOut.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        
        navigationBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
        navigationBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
        navigationBar.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        navigationBar.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
