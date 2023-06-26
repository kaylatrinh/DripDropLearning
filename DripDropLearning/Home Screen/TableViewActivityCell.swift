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
    var buttonSave: UIButton!
        
    //Overriding function
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .blue
        let selectedBackgroundView = UIView()
        selectedBackgroundView.backgroundColor = UIColor(red: 0, green: 0.5216, blue: 0.949, alpha: 1)
        self.selectedBackgroundView = selectedBackgroundView
//        self.sendSubviewToBack(contentView)
//        self.contentView.isUserInteractionEnabled = false
//        self.isUserInteractionEnabled = false
        
        
        //Calling setUp functions
        setupWrapperCellView()
//        self.bringSubviewToFront(wrapperCellView)
        setupLabelName()
        setupLabelDescription()
        setupLabelTime()
        setupImageReceipt()
        //setupButtonSave()
        initConstraints()
        
    }
    
    //MARK: SetUp Functions
    func setupWrapperCellView(){
        wrapperCellView = UITableViewCell()
            
        //working with the shadows and colors...
        wrapperCellView.backgroundColor = UIColor(named: "Background")
        wrapperCellView.layer.cornerRadius = 4.0
        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
        wrapperCellView.layer.shadowOffset = .zero
        wrapperCellView.layer.shadowRadius = 6.0
        wrapperCellView.layer.shadowOpacity = 0.7
        wrapperCellView.isUserInteractionEnabled = true
        
        
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
        
    func setupLabelName(){
        labelName = UILabel()
        labelName.font = .boldSystemFont(ofSize: 16)
        labelName.textColor = .white
        labelName.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelName)
    }
    func setupLabelDescription(){
        labelDescription = UILabel()
        labelDescription.font = .systemFont(ofSize: 16)
        labelDescription.textColor = .white
        labelDescription.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelDescription)
    }
    func setupLabelTime(){
        labelTime = UILabel()
        labelTime.font = .systemFont(ofSize: 16)
        labelTime.textColor = .white
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
//
//    func setupButtonSave() {
//        buttonSave = UIButton(type: .system)
//        buttonSave.setTitle("", for: .normal)
//        buttonSave.setImage(UIImage(systemName: "banner"), for: .normal)
//        buttonSave.contentHorizontalAlignment = .fill
//        buttonSave.contentVerticalAlignment = .fill
//        buttonSave.imageView?.contentMode = .scaleAspectFit
//        buttonSave.showsMenuAsPrimaryAction = true
//        buttonSave.translatesAutoresizingMaskIntoConstraints = false
//        wrapperCellView.addSubview(buttonSave)
//    }
    
    func setupButtonSave() {
        buttonSave = UIButton(type: .system)
        buttonSave.setTitle("Save", for: .normal)
        buttonSave.addTarget(self, action: #selector(buttonSaveTapped), for: .touchUpInside)
        buttonSave.backgroundColor = .white
        buttonSave.layer.cornerRadius = 5
        buttonSave.layer.borderWidth = 1
        buttonSave.layer.borderColor = UIColor.white.cgColor
        buttonSave.translatesAutoresizingMaskIntoConstraints = false
        buttonSave.isUserInteractionEnabled = true
        wrapperCellView.addSubview(buttonSave)
    }
    
    @objc func buttonSaveTapped() {
        print("HERREEEEEEEEEEEEE")
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor,constant: 4),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
            
            imageReceipt.centerXAnchor.constraint(equalTo: wrapperCellView.centerXAnchor),
            imageReceipt.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 8),
            imageReceipt.heightAnchor.constraint(equalToConstant: 300),
            imageReceipt.widthAnchor.constraint(equalToConstant: 300),
                        
            labelName.topAnchor.constraint(equalTo: imageReceipt.bottomAnchor, constant: 8),
            labelName.centerXAnchor.constraint(equalTo: wrapperCellView.centerXAnchor),
            
            labelDescription.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 4),
            labelDescription.centerXAnchor.constraint(equalTo: wrapperCellView.centerXAnchor),
            labelDescription.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 10),
            labelDescription.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -10),
            
            labelTime.topAnchor.constraint(equalTo: labelDescription.bottomAnchor, constant: 4),
            labelTime.centerXAnchor.constraint(equalTo: labelName.centerXAnchor),
            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 750)
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

