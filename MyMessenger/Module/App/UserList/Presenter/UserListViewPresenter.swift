//
//  UserListViewPresenter.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 19.12.2024.
//

import UIKit

protocol UserListViewPresenterProtocol: AnyObject {
    //init(view: UserListViewProtocol)
    var users: [ChatUser] { get set }
}

class UserListViewPresenter: UserListViewPresenterProtocol {
    
    weak var view: UserListViewProtocol?
    private let userListManager = UserListManager()
    
    var users: [ChatUser] = []
    
    required init(view: any UserListViewProtocol) {
        self.view = view
        //self.users = ChatUser.mockData()
        
        userListManager.getAllUsers { [weak self] users in
            guard let self = self else { return }
            self.users = users
            self.view?.reloadTable()
        }
    }
}
