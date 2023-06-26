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
        backgroundColor = UIColor(named: "Background")
        
        // Image View
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIColor(named: "Yellow Accent")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "drop.fill") // Set the system symbol image
        addSubview(imageView)

        
        // Table View
        tableView = UITableView()
        tableView.backgroundView = nil
        tableView.backgroundColor = UIColor(named: "Background")
        tableView.separatorStyle = .none
        tableView.register(TableViewActivityCell.self, forCellReuseIdentifier: "activity")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
        
        
        
        // Navigation Bar
        navigationBar = UINavigationBar()
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        addSubview(navigationBar)
                
        initConstraints()
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

