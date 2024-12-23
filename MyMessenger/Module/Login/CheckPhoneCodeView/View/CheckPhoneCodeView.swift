//
//  CheckPhoneCodeView.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 18.12.2024.
//

import UIKit

protocol CheckPhoneCodeViewProtocol: AnyObject {
    
}

class CheckPhoneCodeView: UIViewController, CheckPhoneCodeViewProtocol {
    
    var presenter: CheckPhoneCodeViewPresenterProtocol!
    
    let pageTitle: UILabel = {
        $0.text = "Confirm your phone"
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont(name: "Copperplate", size: 20)
        return $0
    }(UILabel())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "startImage")!)
        
        view.addSubviews(pageTitle, codeField, sendButton)
        
        setConstrainsts()
        setupConfig()
    }
    
    private lazy var codeField:UITextField = TextField(fieldPlaceholder: "")
    
    public lazy var sendButton:UIButton = Button(buttonText: "Check code") {
        NotificationCenter.default.post(name: .windowManager, object: nil, userInfo: [String.state: WindowManager.appWindow])
        print("Sending code to phone number...")
    }
    
    private func setupConfig() {
        sendButton.alpha = 0.5
        sendButton.isEnabled = false
        codeField.delegate = self
    }
    
    private func setConstrainsts() {
        NSLayoutConstraint.activate([
            pageTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            pageTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            codeField.heightAnchor.constraint(equalToConstant: 50),
            codeField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            codeField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            codeField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
            sendButton.topAnchor.constraint(equalTo: codeField.bottomAnchor, constant: 40),
            sendButton.heightAnchor.constraint(equalToConstant: 50),
            sendButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 140),
            sendButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -140),
        ])
    }
}
