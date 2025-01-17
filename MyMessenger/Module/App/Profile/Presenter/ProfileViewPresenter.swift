//
//  ProfileViewPresenter.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 23.12.2024.
//

import UIKit

protocol ProfileViewPresenterProtocol: AnyObject {
    //init (view: ProfileViewProtocol)
    var profileUser: [ProfileUser] { get set }
}

class ProfileViewPresenter: ProfileViewPresenterProtocol{
    
    weak var view: ProfileViewProtocol?
    private let profileUserManager = ProfileUserManager()
    
    var profileUser: [ProfileUser] = []
    
    required init(view: any ProfileViewProtocol) {
        self.view = view
        self.profileUser = []
    }
    
    func getUserProfileInfo() {
        profileUserManager.getUserProfileInfo{ [weak self] profileUser  in
            guard let self = self else { return }
            self.profileUser = profileUser
            //self.view?.reloadTable()
        }
    }
}
