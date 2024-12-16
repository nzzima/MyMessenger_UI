//
//  RegistrationViewPresenter.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 16.12.2024.
//

import Foundation

protocol RegistrationViewPresenterProtocol: AnyObject {
    init(view: RegistrationViewProtocol)
}

class RegistrationViewPresenter: RegistrationViewPresenterProtocol {
    weak var view: RegistrationViewProtocol?
    required init(view: any RegistrationViewProtocol) {
        self.view = view
    }
    
    
}
