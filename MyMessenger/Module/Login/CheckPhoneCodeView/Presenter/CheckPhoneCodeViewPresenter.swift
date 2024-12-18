//
//  CheckPhoneCodeViewPresenter.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 18.12.2024.
//

import Foundation

protocol CheckPhoneCodeViewPresenterProtocol: AnyObject {
    init(view: CheckPhoneCodeViewProtocol)
}

class CheckPhoneCodeViewPresenter: CheckPhoneCodeViewPresenterProtocol {
    weak var view: CheckPhoneCodeViewProtocol?
    
    required init(view: any CheckPhoneCodeViewProtocol) {
        self.view = view
    }
}
