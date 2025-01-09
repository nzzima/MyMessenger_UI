//
//  AuthenticationViewPresenter.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 16.12.2024.
//

import UIKit

protocol AuthenticationViewPresenterProtocol: AnyObject {
    //init(view: AuthenticationViewProtocol)
    func signIn(userInfo: UserInfo)
}

class AuthenticationViewPresenter: AuthenticationViewPresenterProtocol {
    weak var view: AuthenticationViewProtocol?
    
    private let authenticationManager = AuthenticationManager()
    private let validator = FieldValidator()
    
    required init(view: any AuthenticationViewProtocol) {
        self.view = view
    }
    
    func signIn(userInfo: UserInfo) {
        if validator.isValid(.email, userInfo.email),
           validator.isValid(.password, userInfo.password) {
            authenticationManager.auth(userInfo: userInfo) { result in
                switch result {
                case .success(let success):
                    if success {
                        NotificationCenter.default.post(name: .windowManager, object: nil, userInfo: [String.state: WindowManager.appWindow])
                    }
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        }
    }
}
