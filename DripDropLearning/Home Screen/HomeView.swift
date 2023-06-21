//
//  HomeView.swift
//  DripDropLearning
//
//  Created by Kayla Nguyen on 6/19/23.
//

import UIKit

class HomeView: UIView {

    var imageView: UIImageView!
    var tableView: UITableView!
    var navigationBar: UINavigationBar!
    var homeButton: UIBarButtonItem!
    var bathtubButton: UIBarButtonItem!
    var bookmarkButton: UIBarButtonItem!
    var profileButton: UIBarButtonItem!

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
    
        
        // Image View
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "star") // Set the system symbol image
        addSubview(imageView)

        
        // Table View
        tableView = UITableView()
        tableView.register(TableViewActivityCell.self, forCellReuseIdentifier: "activity")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
        
        
        
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
    
    
    
    // Setting the constraints
    func initConstraints() {
        NSLayoutConstraint.activate([
       
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 150),
            imageView.widthAnchor.constraint(equalToConstant: 150),
            
            tableView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: navigationBar.topAnchor),
            
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

