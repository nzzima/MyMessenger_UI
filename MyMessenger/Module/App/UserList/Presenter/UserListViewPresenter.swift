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
    
    var users: [ChatUser]
    
    required init(view: any UserListViewProtocol) {
        self.view = view
        self.users = ChatUser.mockData()
    }
}
