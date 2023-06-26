//
//  RegisterView.swift
//  DripDropLearning
//
//  Created by Kayla Nguyen on 6/19/23.
//

import UIKit

class RegisterView: UIView {
    var textfieldRegisterName: UITextField!
    var textfieldRegisterEmail: UITextField!
    var textfieldRegisterPass: UITextField!
    var buttonCreateAccount: UIButton!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = UIColor(named: "Background")
        
        setupTextFieldRegisterName()
        setupTextFieldRegisterEmail()
        setupTextFieldRegisterPass()
        setupButtonCreateAccount()
        
        initConstraints()
    }
    
    func setupTextFieldRegisterName(){
        textfieldRegisterName = UITextField()
        textfieldRegisterName.placeholder = "Name"
        textfieldRegisterName.borderStyle = .roundedRect
        textfieldRegisterName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textfieldRegisterName)
    }
    
    func setupTextFieldRegisterEmail(){
        textfieldRegisterEmail = UITextField()
        textfieldRegisterEmail.placeholder = "Email"
        textfieldRegisterEmail.borderStyle = .roundedRect
        textfieldRegisterEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textfieldRegisterEmail)
    }
    
    func setupTextFieldRegisterPass(){
        textfieldRegisterPass = UITextField()
        textfieldRegisterPass.placeholder = "Password"
        textfieldRegisterPass.borderStyle = .roundedRect
        textfieldRegisterPass.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textfieldRegisterPass)
    }
    
    func setupButtonCreateAccount(){
        buttonCreateAccount = UIButton(type: .system)
        buttonCreateAccount.titleLabel?.font = .boldSystemFont(ofSize: 16)
        buttonCreateAccount.setTitle("Create Account", for: .normal)
        buttonCreateAccount.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonCreateAccount)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            
            textfieldRegisterName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            textfieldRegisterName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textfieldRegisterName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            textfieldRegisterEmail.topAnchor.constraint(equalTo: textfieldRegisterName.bottomAnchor, constant: 16),
            textfieldRegisterEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textfieldRegisterEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            textfieldRegisterPass.topAnchor.constraint(equalTo: textfieldRegisterEmail.bottomAnchor, constant: 16),
            textfieldRegisterPass.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textfieldRegisterPass.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),

            buttonCreateAccount.topAnchor.constraint(equalTo: textfieldRegisterPass.bottomAnchor, constant: 16),
            buttonCreateAccount.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            buttonCreateAccount.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -100),
           
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
