//
//  StartView.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 17.12.2024.
//

import UIKit

protocol StartViewProtocol: AnyObject {
    
}

class StartView: UIViewController, StartViewProtocol {
    
    var presenter: StartViewPresenterProtocol!
    
    let pageTitle: UILabel = {
        $0.text = "MyMessenger"
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont(name: "Copperplate", size: 36)
        return $0
    }(UILabel())
    
    private lazy var authenticationButton:UIButton = Button(buttonText: "Authentication", buttonColor: .lightGray) {
        NotificationCenter.default.post(name: .windowManager, object: nil, userInfo: [String.state: WindowManager.authentificationWindow])
        print("Go to Authentication")
    }
    private lazy var registrationButton: UIButton = Button(buttonText: "Registration", buttonColor: .lightGray) {
        NotificationCenter.default.post(name: .windowManager, object: nil, userInfo: [String.state: WindowManager.registrationWindow])
        print("Go to Registration")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "startImage")!)
        
        view.addSubviews(pageTitle, authenticationButton, registrationButton)
        
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
//            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
//            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            pageTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            pageTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            registrationButton.heightAnchor.constraint(equalToConstant: 50),
            registrationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            registrationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -220),
            registrationButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            
            authenticationButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            authenticationButton.heightAnchor.constraint(equalToConstant: 50),
            authenticationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 220),
            authenticationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
    
}
