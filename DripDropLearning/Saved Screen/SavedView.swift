//
//  SavedView.swift
//  DripDropLearning
//
//  Created by Kayla Nguyen on 6/19/23.
//



import UIKit

class SavedView: UIView {

    var tableView: UITableView!
    var navigationBar: UINavigationBar!
    var homeButton: UIBarButtonItem!
    var bathtubButton: UIBarButtonItem!
    var bookmarkButton: UIBarButtonItem!
    var profileButton: UIBarButtonItem!

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "Background")
        
    
        
        // Table View
        tableView = UITableView()
        tableView.register(TableViewActivityCell.self, forCellReuseIdentifier: "savedActivity")
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
       
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
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

