//
//  RegistrationView.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 16.12.2024.
//

import UIKit

protocol RegistrationViewProtocol: AnyObject {
    
}

class RegistrationView: UIViewController {
    var presenter: RegistrationViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    let pageTitle: UILabel = {
        $0.text = "Registration"
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 32, weight: .black)
        return $0
    }(UILabel())
    
    private lazy var loginField:UITextField = TextField(fieldPlaceholder: "Login")
    private lazy var passwordField:UITextField = TextField(fieldPlaceholder: "Password", isPassword: true)
    private lazy var passwordConfirmField:UITextField = TextField(fieldPlaceholder: "Password Confirm", isPassword: true)
    private lazy var phoneField:UITextField = TextField(fieldPlaceholder: "Phone")
    
    private lazy var authentecateButton:UIButton = Button(buttonText: "Enter") {
        print("Authenticate")
    }
}
