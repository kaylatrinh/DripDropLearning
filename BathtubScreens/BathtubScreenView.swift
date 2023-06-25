import UIKit

class BathtubScreenView: UIView {

    var navigationBar: UINavigationBar!
    var homeButton: UIBarButtonItem!
    var bathtubButton: UIBarButtonItem!
    var bookmarkButton: UIBarButtonItem!
    var profileButton: UIBarButtonItem!

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
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
        
        layoutSubviews()
    }
    
    // Action methods for the bottom bar buttons
    @objc func homeButtonTapped() {
        // Open the "Home" screen
        // let homeViewController = HomeViewController()
        //let navigationController = UINavigationController(rootViewController: homeViewController)
//        if let window = UIApplication.shared.windows.first {
//            window.rootViewController = navigationController
//            window.makeKeyAndVisible()
//        }
    }

    @objc func bathtubButtonTapped() {
        // Open the "Bathtub" screen
       // let bathtubViewController = BathtubViewController()
       // let navigationController = UINavigationController(rootViewController: bathtubViewController)
//        if let window = UIApplication.shared.windows.first {
//            window.rootViewController = navigationController
//            window.makeKeyAndVisible()
//        }
    }

    @objc func bookmarkButtonTapped() {
        // Open the "Bookmark" screen
//        let bookmarkViewController = SavedViewController()
//        let navigationController = UINavigationController(rootViewController: bookmarkViewController)
//        if let window = UIApplication.shared.windows.first {
//            window.rootViewController = navigationController
//            window.makeKeyAndVisible()
//        }
    }

    @objc func profileButtonTapped() {
        // Open the "Profile" screen
//        let profileViewController = ProfileViewController()
//        let navigationController = UINavigationController(rootViewController: profileViewController)
//        if let window = UIApplication.shared.windows.first {
//            window.rootViewController = navigationController
//            window.makeKeyAndVisible()
//        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Remove any existing subviews
        subviews.forEach { $0.removeFromSuperview() }
        
        // Create UIImageView instances
        let largeImageView = createImageView()
        let smallImageView1 = createImageView()
        let smallImageView2 = createImageView()
        let smallImageView3 = createImageView()
        let smallImageView4 = createImageView()
        let smallImageView5 = createImageView()
        let smallImageView6 = createImageView()
        
        // Set image for each image view
        let imageName = "bathtub" // Replace with the desired image name
        largeImageView.image = UIImage(named: imageName)
        smallImageView1.image = UIImage(named: imageName)
        smallImageView2.image = UIImage(named: imageName)
        smallImageView3.image = UIImage(named: imageName)
        smallImageView4.image = UIImage(named: imageName)
        smallImageView5.image = UIImage(named: imageName)
        smallImageView6.image = UIImage(named: imageName)
        
        // Add image views to the view hierarchy
        addSubview(largeImageView)
        addSubview(smallImageView1)
        addSubview(smallImageView2)
        addSubview(smallImageView3)
        addSubview(smallImageView4)
        addSubview(smallImageView5)
        addSubview(smallImageView6)
        addSubview(navigationBar)
        
        // Add constraints to position and size the image views
        let spacing: CGFloat = 20 // Adjust the spacing between image views as desired
        
        NSLayoutConstraint.activate([
            largeImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 75), // Adjust the top spacing as desired
            largeImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            largeImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8), // Adjust the width as desired
            largeImageView.heightAnchor.constraint(equalTo: largeImageView.widthAnchor), // Maintain aspect ratio
            
            smallImageView1.topAnchor.constraint(equalTo: largeImageView.bottomAnchor, constant: spacing),
            smallImageView1.centerXAnchor.constraint(equalTo: centerXAnchor),
            smallImageView1.widthAnchor.constraint(equalTo: largeImageView.widthAnchor, multiplier: 0.3), // Adjust the width as desired
            smallImageView1.heightAnchor.constraint(equalTo: smallImageView1.widthAnchor), // Maintain aspect ratio
            
            smallImageView2.topAnchor.constraint(equalTo: smallImageView1.topAnchor),
            smallImageView2.trailingAnchor.constraint(equalTo: smallImageView1.leadingAnchor, constant: -spacing),
            smallImageView2.widthAnchor.constraint(equalTo: smallImageView1.widthAnchor),
            smallImageView2.heightAnchor.constraint(equalTo: smallImageView2.widthAnchor),
            
            smallImageView3.topAnchor.constraint(equalTo: smallImageView1.topAnchor),
            smallImageView3.leadingAnchor.constraint(equalTo: smallImageView1.trailingAnchor, constant: spacing),
            smallImageView3.widthAnchor.constraint(equalTo: smallImageView1.widthAnchor),
            smallImageView3.heightAnchor.constraint(equalTo: smallImageView3.widthAnchor),
            
            smallImageView4.topAnchor.constraint(equalTo: smallImageView1.bottomAnchor, constant: spacing),
            smallImageView4.centerXAnchor.constraint(equalTo: centerXAnchor),
            smallImageView4.widthAnchor.constraint(equalTo: smallImageView1.widthAnchor),
            smallImageView4.heightAnchor.constraint(equalTo: smallImageView4.widthAnchor),
            
            smallImageView5.topAnchor.constraint(equalTo: smallImageView4.topAnchor),
            smallImageView5.trailingAnchor.constraint(equalTo: smallImageView4.leadingAnchor, constant: -spacing),
            smallImageView5.widthAnchor.constraint(equalTo: smallImageView4.widthAnchor),
            smallImageView5.heightAnchor.constraint(equalTo: smallImageView5.widthAnchor),
            
            smallImageView6.topAnchor.constraint(equalTo: smallImageView4.topAnchor),
            smallImageView6.leadingAnchor.constraint(equalTo: smallImageView4.trailingAnchor, constant: spacing),
            smallImageView6.widthAnchor.constraint(equalTo: smallImageView4.widthAnchor),
            smallImageView6.heightAnchor.constraint(equalTo: smallImageView6.widthAnchor),
            
            navigationBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            navigationBar.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            navigationBar.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func createImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
