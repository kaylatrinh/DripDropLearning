//
//  BathtubView.swift
//  DripDropLearning
//
//  Created by Ariel Park on 6/25/23.
//

import UIKit

class BathtubView: UIView {
    var tableView: UITableView!
    
    var navigationBar: UINavigationBar!
    var homeButton: UIBarButtonItem!
    var bathtubButton: UIBarButtonItem!
    var bookmarkButton: UIBarButtonItem!
    var profileButton: UIBarButtonItem!
    var postButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "Background")
        
        // Table View
        tableView = UITableView()
        tableView.register(BathtubTableViewCell.self, forCellReuseIdentifier: "bathtubs")
        tableView.backgroundView = nil
        tableView.backgroundColor = UIColor(named: "Background")
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
        
        postButton = UIButton(type: .system)
        postButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        postButton.setTitle("New Bathtub Post", for: .normal)
        postButton.tintColor = UIColor(named: "Yellow Accent")
        postButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(postButton)
        
        // Navigation Bar
        navigationBar = UINavigationBar()
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        addSubview(navigationBar)
                
        initConstraints()
    }
    
    
    // Setting the constraints
    func initConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: navigationBar.topAnchor, constant: -8),
            
            postButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 4),
            postButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
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
