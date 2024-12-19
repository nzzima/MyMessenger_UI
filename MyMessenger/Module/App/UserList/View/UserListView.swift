//
//  UserListView.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 19.12.2024.
//

import UIKit

protocol UserListViewProtocol: AnyObject {
    
}

class UserListView: UIViewController, UserListViewProtocol {
    
    var presenter: UserListViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .brown
    }
}
