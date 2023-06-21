//
//  HomeViewController.swift
//  DripDropLearning
//
//  Created by Kayla Nguyen on 6/19/23.
//

import UIKit

class HomeViewController: UIViewController {

    let homeScreen = HomeView()

    override func loadView() {
        view = homeScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        homeScreen.tableView.dataSource = self
        homeScreen.tableView.delegate = self
        homeScreen.tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15 // Adjust the number of rows as needed
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Activity \(indexPath.row + 1)" // Customize the text for each cell if needed
        return cell
    }
}

