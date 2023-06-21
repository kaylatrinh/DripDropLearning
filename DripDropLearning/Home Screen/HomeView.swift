//
//  HomeView.swift
//  DripDropLearning
//
//  Created by Kayla Nguyen on 6/19/23.
//

import UIKit

class HomeView: UIView {

    var titleLabel: UILabel!
    var imageView: UIImageView!
    var tableView: UITableView!
    var navigationBar: UINavigationBar!
    var button1: UIBarButtonItem!
    var button2: UIBarButtonItem!
    var button3: UIBarButtonItem!
    var button4: UIBarButtonItem!

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        // Title Label
        titleLabel = UILabel()
        titleLabel.text = "Home"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        
        // Image View
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "star") // Set the system symbol image
        addSubview(imageView)

        
        // Table View
        tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
        
        // Navigation Bar
        navigationBar = UINavigationBar()
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        addSubview(navigationBar)
        
        // Buttons
        button1 = UIBarButtonItem(title: "Button 1", style: .plain, target: nil, action: nil)
        button2 = UIBarButtonItem(title: "Button 2", style: .plain, target: nil, action: nil)
        button3 = UIBarButtonItem(title: "Button 3", style: .plain, target: nil, action: nil)
        button4 = UIBarButtonItem(title: "Button 4", style: .plain, target: nil, action: nil)
        let navigationItem = UINavigationItem()
        navigationItem.leftBarButtonItems = [button1, button2]
        navigationItem.rightBarButtonItems = [button3, button4]
        navigationBar.setItems([navigationItem], animated: false)
        
        initConstraints()
    }
    
    // Setting the constraints
    func initConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            
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

