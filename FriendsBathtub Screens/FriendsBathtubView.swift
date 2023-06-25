import UIKit

class FriendsBathtubView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        let firstBathtubImageView = createImageView(imageName: "bathtub")
        let secondBathtubImageView = createImageView(imageName: "bathtub")
        
        let firstTitleLabel = createTitleLabel(text: "Title")
        let secondTitleLabel = createTitleLabel(text: "Title")
        
        let navigationBar = UINavigationBar()
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        addSubview(navigationBar)
        
        let homeButton = UIBarButtonItem(image: UIImage(systemName: "house"), style: .plain, target: nil, action: #selector(homeButtonTapped))
        let bathtubButton = UIBarButtonItem(image: UIImage(systemName: "bathtub"), style: .plain, target: nil, action: #selector(bathtubButtonTapped))
        let bookmarkButton = UIBarButtonItem(image: UIImage(systemName: "bookmark"), style: .plain, target: nil, action: #selector(bookmarkButtonTapped))
        let profileButton = UIBarButtonItem(image: UIImage(systemName: "person"), style: .plain, target: nil, action: #selector(profileButtonTapped))
        
        let fixedSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        fixedSpace.width = 64
        
        let navigationItem = UINavigationItem()
        navigationItem.leftBarButtonItems = [homeButton, fixedSpace, bathtubButton, fixedSpace, profileButton, fixedSpace, bookmarkButton]
        navigationBar.setItems([navigationItem], animated: false)
        
        addSubview(firstBathtubImageView)
        addSubview(secondBathtubImageView)
        addSubview(firstTitleLabel)
        addSubview(secondTitleLabel)
        addSubview(navigationBar)
        
        NSLayoutConstraint.activate([
            firstBathtubImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            firstBathtubImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            firstBathtubImageView.widthAnchor.constraint(equalToConstant: 200),
            firstBathtubImageView.heightAnchor.constraint(equalToConstant: 200),
            
            firstTitleLabel.centerXAnchor.constraint(equalTo: firstBathtubImageView.centerXAnchor),
            firstTitleLabel.bottomAnchor.constraint(equalTo: firstBathtubImageView.topAnchor, constant: -10),
            
            secondBathtubImageView.topAnchor.constraint(equalTo: firstBathtubImageView.bottomAnchor, constant: 50),
            secondBathtubImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            secondBathtubImageView.widthAnchor.constraint(equalToConstant: 200),
            secondBathtubImageView.heightAnchor.constraint(equalToConstant: 200),
            
            secondTitleLabel.centerXAnchor.constraint(equalTo: secondBathtubImageView.centerXAnchor),
            secondTitleLabel.bottomAnchor.constraint(equalTo: secondBathtubImageView.topAnchor, constant: -10),
            
            navigationBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            navigationBar.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            navigationBar.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func createImageView(imageName: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    private func createTitleLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    @objc private func homeButtonTapped() {
        // Handle home button tap
    }
    
    @objc private func bathtubButtonTapped() {
        // Handle bathtub button tap
    }
    
    @objc private func bookmarkButtonTapped() {
        // Handle bookmark button tap
    }
    
    @objc private func profileButtonTapped() {
        // Handle profile button tap
    }
}
