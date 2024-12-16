//
//  AuthenticationViewPresenter.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 16.12.2024.
//

import UIKit

protocol AuthenticationViewPresenterProtocol: AnyObject {
    init(view: AuthenticationViewProtocol)
}

class AuthenticationViewPresenter: AuthenticationViewPresenterProtocol {
    weak var view: AuthenticationViewProtocol?
    
    required init(view: any AuthenticationViewProtocol) {
        self.view = view
    }
    
    
}
