//
//  RegistrationViewPresenter.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 16.12.2024.
//

import Foundation

protocol RegistrationViewPresenterProtocol: AnyObject {
    //init(view: RegistrationViewProtocol)
    func sendToRegistration(userInfo: UserInfo)
}

class RegistrationViewPresenter: RegistrationViewPresenterProtocol {
    
    private let registrationManager = RegistrationManager()
    private let validator = FieldValidator()
    weak var view: RegistrationViewProtocol?
    
    required init(view: any RegistrationViewProtocol) {
        self.view = view
    }
    
    func sendToRegistration(userInfo: UserInfo) {
        if validator.isValid(.email, userInfo.email),
           validator.isValid(.password, userInfo.password) {
            
            registrationManager.createUser(userInfo: userInfo) { result in
                switch result {
                case .success(let success):
                    if success {
                        NotificationCenter.default.post(name: .windowManager, object: nil, userInfo: [String.state: WindowManager.appWindow])
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        } else {
            print("alert")
        }
    }
    
}
