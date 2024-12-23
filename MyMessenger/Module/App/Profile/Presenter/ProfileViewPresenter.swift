//
//  ProfileViewPresenter.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 23.12.2024.
//

import UIKit

protocol ProfileViewPresenterProtocol: AnyObject {
    init (view: ProfileViewProtocol)
}

class ProfileViewPresenter: ProfileViewPresenterProtocol{
    
    weak var view: ProfileViewProtocol?
    
    required init(view: any ProfileViewProtocol) {
        self.view = view
    }
}
