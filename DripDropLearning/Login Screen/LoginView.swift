//
//  LoginView.swift
//  DripDropLearning
//
//  Created by Kayla Nguyen on 6/19/23.
//

import UIKit

class LoginView: UIView {
    var labelTitle: UILabel!
    var textfieldEmail: UITextField!
    var textfieldPass: UITextField!
    var buttonSignIn: UIButton!
    var buttonRegister: UIButton!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = UIColor(named: "Background")
        
        
        setupLabelTitle()
        setupTextFieldEmail()
        setupTextFieldPass()
        setupButtonSignIn()
        setupButtonRegister()
        
        initConstraints()
    }
    
    func setupLabelTitle(){
        labelTitle = UILabel()
        labelTitle.text = "Drip Drop \nLearning"
        labelTitle.numberOfLines = 0
        labelTitle.textColor = .white
        labelTitle.textAlignment = .center
        labelTitle.font = .boldSystemFont(ofSize: 45)
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelTitle)
    }
    
    func setupTextFieldEmail(){
        textfieldEmail = UITextField()
        textfieldEmail.placeholder = "Email"
        textfieldEmail.borderStyle = .roundedRect
        textfieldEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textfieldEmail)
    }
    
    func setupTextFieldPass(){
        textfieldPass = UITextField()
        textfieldPass.placeholder = "Password"
        textfieldPass.borderStyle = .roundedRect
        textfieldPass.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textfieldPass)
    }
    
    func setupButtonSignIn(){
        buttonSignIn = UIButton(type: .system)
        buttonSignIn.titleLabel?.font = .boldSystemFont(ofSize: 16)
        buttonSignIn.setTitle("Log In", for: .normal)
        buttonSignIn.titleLabel?.textColor = UIColor(named: "Yellow Accent")
        buttonSignIn.backgroundColor = .white
        buttonSignIn.layer.cornerRadius = 5
        buttonSignIn.layer.borderWidth = 1
        buttonSignIn.layer.borderColor = UIColor.white.cgColor
        buttonSignIn.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSignIn)
    }
    
    func setupButtonRegister(){
        buttonRegister = UIButton(type: .system)
        buttonRegister.titleLabel?.font = .systemFont(ofSize: 14)
        buttonRegister.setTitle("Register an Account", for: .normal)
        buttonRegister.tintColor = UIColor(named: "Yellow Accent")
        buttonRegister.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonRegister)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            
            labelTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100),
            labelTitle.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            textfieldEmail.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 30),
            textfieldEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textfieldEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            textfieldPass.topAnchor.constraint(equalTo: textfieldEmail.bottomAnchor, constant: 16),
            textfieldPass.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textfieldPass.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),

            buttonRegister.topAnchor.constraint(equalTo: textfieldPass.bottomAnchor),
            buttonRegister.trailingAnchor.constraint(equalTo: textfieldPass.trailingAnchor),
            
            buttonSignIn.topAnchor.constraint(equalTo: buttonRegister.bottomAnchor, constant: 20),
            buttonSignIn.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            buttonSignIn.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -100),
           
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

