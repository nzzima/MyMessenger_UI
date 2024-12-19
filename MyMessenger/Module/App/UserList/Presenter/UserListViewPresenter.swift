//
//  UserListViewPresenter.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 19.12.2024.
//

import UIKit

protocol UserListViewPresenterProtocol: AnyObject {
    init(view: UserListViewProtocol)
}

class UserListViewPresenter: UserListViewPresenterProtocol {
    
    weak var view: UserListViewProtocol?
    
    required init(view: any UserListViewProtocol) {
        self.view = view
    }
}
