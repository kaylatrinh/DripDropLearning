import UIKit

class ViewController: UIViewController, UISearchBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bathtubScreenView = BathtubScreenView()  // Changed variable name
        view = bathtubScreenView
        
        let searchBar = UISearchBar()
        searchBar.delegate = self
        navigationItem.titleView = searchBar

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func plusButtonTapped(){
        
        let friendsBathtubView = FriendsBathtubViewController() // Replace with your desired view controller
        navigationController?.pushViewController(friendsBathtubView, animated: true)
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    
    }
}
