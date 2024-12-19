//
//  MessagesListView.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 19.12.2024.
//

import UIKit

protocol MessagesListViewProtocol: AnyObject {
    
}

class MessagesListView: UIViewController, MessagesListViewProtocol {
    
    var presenter: MessagesListViewPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
    }
    
}
