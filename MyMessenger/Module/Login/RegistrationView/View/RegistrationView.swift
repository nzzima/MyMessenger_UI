//
//  RegistrationView.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 16.12.2024.
//

import UIKit

protocol RegistrationViewProtocol: AnyObject {
    
}

class RegistrationView: UIViewController, RegistrationViewProtocol {
    
    var presenter: RegistrationViewPresenterProtocol!
    
    let pageTitle: UILabel = {
        $0.text = "Registration"
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 32, weight: .black)
        return $0
    }(UILabel())
    
    private lazy var nameField:UITextField = TextField(fieldPlaceholder: "Name")
    private lazy var surnameField:UITextField = TextField(fieldPlaceholder: "Surname")
    private lazy var loginField:UITextField = TextField(fieldPlaceholder: "Login")
    private lazy var passwordField:UITextField = TextField(fieldPlaceholder: "Password", isPassword: true)
    private lazy var passwordConfirmField:UITextField = TextField(fieldPlaceholder: "Confirm your password", isPassword: true)
    private lazy var phoneField:UITextField = TextField(fieldPlaceholder: "Phone")
    
    private lazy var registrationButton:UIButton = Button(buttonText: "Register") {
        print("Registration")
    }
    private lazy var bottomButton: UIButton = Button(buttonText: "Authentication", buttonColor: .black, titleColor: .white) {
        print("Go to Authentication")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        view.addSubviews(nameField, surnameField, pageTitle, loginField, passwordField, passwordConfirmField, phoneField, registrationButton, bottomButton)
        
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            pageTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            pageTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nameField.heightAnchor.constraint(equalToConstant: 50),
            nameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            nameField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -140),
            
            surnameField.heightAnchor.constraint(equalToConstant: 50),
            surnameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            surnameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            surnameField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 15),
            
            loginField.heightAnchor.constraint(equalToConstant: 50),
            loginField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            loginField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            loginField.topAnchor.constraint(equalTo: surnameField.bottomAnchor, constant: 15),
            
            passwordField.heightAnchor.constraint(equalToConstant: 50),
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            passwordField.topAnchor.constraint(equalTo: loginField.bottomAnchor, constant: 15),
            
            passwordConfirmField.heightAnchor.constraint(equalToConstant: 50),
            passwordConfirmField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordConfirmField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            passwordConfirmField.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 15),
            
            phoneField.heightAnchor.constraint(equalToConstant: 50),
            phoneField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            phoneField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            phoneField.topAnchor.constraint(equalTo: passwordConfirmField.bottomAnchor, constant: 15),
            
            registrationButton.topAnchor.constraint(equalTo: phoneField.bottomAnchor, constant: 40),
            registrationButton.heightAnchor.constraint(equalToConstant: 50),
            registrationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            registrationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            bottomButton.heightAnchor.constraint(equalToConstant: 50),
            bottomButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            bottomButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            bottomButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
    }
}
