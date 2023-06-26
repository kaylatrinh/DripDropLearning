//
//  TableViewActivityCell.swift
//  DripDropLearning
//
//  Created by samy fallah on 6/20/23.
//

 
import UIKit

class TableViewActivityCell: UITableViewCell {
    
    //Declaring variables
    var wrapperCellView: UIView!
    var labelName: UILabel!
    var labelDescription: UILabel!
    var labelTime: UILabel!
    var imageReceipt: UIImageView!
        
    //Overriding function
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //Calling setUp functions
        setupWrapperCellView()
        setupLabelName()
        setupLabelEmail()
        setupLabelPhone()
        setupImageReceipt()
        initConstraints()
        
    }
    
    //MARK: SetUp Functions
    func setupWrapperCellView(){
        wrapperCellView = UITableViewCell()
            
            //working with the shadows and colors...
            wrapperCellView.backgroundColor = UIColor(named: "Background")
            wrapperCellView.layer.cornerRadius = 10.0
            wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
            wrapperCellView.layer.shadowOffset = .zero
            wrapperCellView.layer.shadowRadius = 6.0
            wrapperCellView.layer.shadowOpacity = 0.7
            
            
            wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(wrapperCellView)
    }
        
    func setupLabelName(){
        labelName = UILabel()
        labelName.font = .boldSystemFont(ofSize: 16)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelName)
    }
    func setupLabelEmail(){
        labelDescription = UILabel()
        labelDescription.font = .systemFont(ofSize: 16)
        labelDescription.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelDescription)
    }
    func setupLabelPhone(){
        labelTime = UILabel()
        labelDescription.font = .systemFont(ofSize: 16)
        labelTime.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelTime)
    }
    func setupImageReceipt(){
        imageReceipt = UIImageView()
        imageReceipt.image = UIImage(systemName: "photo")
        imageReceipt.contentMode = .scaleToFill
        imageReceipt.clipsToBounds = true
        imageReceipt.layer.cornerRadius = 10
        imageReceipt.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(imageReceipt)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
                        
            labelName.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 2),
            labelName.leadingAnchor.constraint(equalTo: imageReceipt.trailingAnchor, constant: 8),
            labelName.heightAnchor.constraint(equalToConstant: 32),
            labelName.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
                        
            labelDescription.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 2),
            labelDescription.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
            labelDescription.heightAnchor.constraint(equalToConstant: 32),
            labelDescription.widthAnchor.constraint(lessThanOrEqualTo: labelName.widthAnchor),
                
            labelTime.topAnchor.constraint(equalTo: labelDescription.bottomAnchor, constant: 2),
            labelTime.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
            labelTime.heightAnchor.constraint(equalToConstant: 32),
            labelTime.widthAnchor.constraint(lessThanOrEqualTo: labelName.widthAnchor),
                    
            imageReceipt.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 8),
            imageReceipt.centerYAnchor.constraint(equalTo: wrapperCellView.centerYAnchor),
            imageReceipt.heightAnchor.constraint(equalTo: wrapperCellView.heightAnchor, constant: -20),
            imageReceipt.widthAnchor.constraint(equalTo: wrapperCellView.heightAnchor, constant: -20),
                
            wrapperCellView.heightAnchor.constraint(equalToConstant: 104)
        ])
    }
    
    
    //MARK: UNUSED CODE
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

