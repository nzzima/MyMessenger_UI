//
//  RegistrationView.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 16.12.2024.
//

import UIKit
import FirebaseAuth

protocol RegistrationViewProtocol: AnyObject {
    
}

class RegistrationView: UIViewController, RegistrationViewProtocol {

    var onSave: ((_ verifyID: String) -> ())?
    var presenter: RegistrationViewPresenterProtocol!
    
    private let maxNumberCount = 11
    private let regex = try! NSRegularExpression(pattern: "[\\+\\s-\\(\\)]", options: .caseInsensitive)
    
    let pageTitle: UILabel = {
        $0.text = "Registration"
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont(name: "Copperplate", size: 26)
        return $0
    }(UILabel())
    
    private lazy var nameField:UITextField = TextField(fieldPlaceholder: "Name")
    private lazy var surnameField:UITextField = TextField(fieldPlaceholder: "Surname")
    private lazy var emailField:UITextField = TextField(fieldPlaceholder: "Email")
    private lazy var passwordField:UITextField = TextField(fieldPlaceholder: "Password", isPassword: true)
    private lazy var passwordConfirmField:UITextField = TextField(fieldPlaceholder: "Confirm your password", isPassword: true)
    private lazy var phoneField:UITextField = TextField(fieldPlaceholder: "Phone")
    
    private lazy var registrationButton:UIButton = Button(buttonText: "Register") { [weak self] in
        guard let self = self else { return }
        
        let userInfo = UserInfo(name: nameField.text ?? "", surname: surnameField.text ?? "", email: emailField.text ?? "", password: passwordField.text ?? "", phone: phoneField.text ?? "")
        
        presenter.sendToRegistration(userInfo: userInfo)

    }
    private lazy var bottomButton: UIButton = Button(buttonText: "Authentication", buttonColor: .black, titleColor: .white) {
        NotificationCenter.default.post(name: .windowManager, object: nil, userInfo: [String.state: WindowManager.authentificationWindow])
        print("Go to Authentication")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "startImage")!)
        
        view.addSubviews(nameField, surnameField, pageTitle, emailField, passwordField, passwordConfirmField, phoneField, registrationButton, bottomButton)
        
        phoneField.delegate = self
        phoneField.keyboardType = .decimalPad
        
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
            
            emailField.heightAnchor.constraint(equalToConstant: 50),
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            emailField.topAnchor.constraint(equalTo: surnameField.bottomAnchor, constant: 15),
            
            passwordField.heightAnchor.constraint(equalToConstant: 50),
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 15),
            
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
            registrationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 140),
            registrationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -140),
            
            bottomButton.heightAnchor.constraint(equalToConstant: 50),
            bottomButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            bottomButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            bottomButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
    }
    
    public func format(phoneNumber: String, shouldRemoveLastDigit: Bool) -> String {
        guard !(shouldRemoveLastDigit && phoneNumber.count <= 2) else { return "+"}
        
        let range = NSString(string: phoneNumber).range(of: phoneNumber)
        var number = regex.stringByReplacingMatches(in: phoneNumber, options: [], range: range, withTemplate: "")
        
        if number.count > maxNumberCount {
            let maxIndex = number.index(number.startIndex, offsetBy: maxNumberCount)
            number = String(number[number.startIndex..<maxIndex])
        }
        
        if shouldRemoveLastDigit {
            let maxIndex = number.index(number.startIndex, offsetBy: number.count - 1)
            number = String(number[number.startIndex..<maxIndex])
        }
        
        let maxIndex = number.index(number.startIndex, offsetBy: number.count)
        let regRange = number.startIndex..<maxIndex
        
        if number.count < 7 {
            let pattern = "(\\d)(\\d{3})(\\d+)"
            number = number.replacingOccurrences(of: pattern, with: "$1 ($2) $3", options: .regularExpression, range: regRange)
        } else {
            let pattern = "(\\d)(\\d{3})(\\d{3})(\\d{2})(\\d+)"
            number = number.replacingOccurrences(of: pattern, with: "$1 ($2) $3-$4-$5", options: .regularExpression, range: regRange)
        }
        return "+" + number
    }
}
