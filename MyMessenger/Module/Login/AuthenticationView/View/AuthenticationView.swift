//
//  AuthenticationView.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 16.12.2024.
//

import UIKit

protocol AuthenticationViewProtocol: AnyObject {
    
}

class AuthenticationView: UIViewController, AuthenticationViewProtocol {
    
    var presenter: AuthenticationViewPresenterProtocol!
    
    let pageTitle: UILabel = {
        $0.text = "Authentication"
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 32, weight: .black)
        return $0
    }(UILabel())
    
    private lazy var loginField:UITextField = TextField(fieldPlaceholder: "Login")
    private lazy var passwordField:UITextField = TextField(fieldPlaceholder: "Password", isPassword: true)
    private lazy var phoneField:UITextField = TextField(fieldPlaceholder: "Phone")
    
    private lazy var authentecateButton:UIButton = Button(buttonText: "Enter") {
        print("Authenticate")
    }
    private lazy var bottomButton: UIButton = Button(buttonText: "Registration", buttonColor: .black, titleColor: .white) {
        NotificationCenter.default.post(name: .windowManager, object: nil, userInfo: [String.state: WindowManager.registrationWindow])
        print("Go to Registration")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        view.addSubviews(pageTitle, loginField, passwordField, phoneField, authentecateButton, bottomButton)
        
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            pageTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            pageTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            loginField.heightAnchor.constraint(equalToConstant: 50),
            loginField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            loginField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            loginField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
            
            passwordField.heightAnchor.constraint(equalToConstant: 50),
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            passwordField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30),
            
            passwordField.heightAnchor.constraint(equalToConstant: 50),
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            passwordField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30),
            
            
            phoneField.heightAnchor.constraint(equalToConstant: 50),
            phoneField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            phoneField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            phoneField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 90),
            
            authentecateButton.topAnchor.constraint(equalTo: phoneField.bottomAnchor, constant: 40),
            authentecateButton.heightAnchor.constraint(equalToConstant: 50),
            authentecateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            authentecateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            bottomButton.heightAnchor.constraint(equalToConstant: 50),
            bottomButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            bottomButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            bottomButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
    }
}
