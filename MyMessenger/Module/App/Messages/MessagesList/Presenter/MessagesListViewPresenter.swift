//
//  MessagesListViewPresenter.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 19.12.2024.
//

import UIKit

protocol MessagesListViewPresenterProtocol: AnyObject {
    init(view: MessagesListViewProtocol)
}

class MessagesListViewPresenter: MessagesListViewPresenterProtocol {
    
    weak var view: MessagesListViewProtocol?
    
    required init(view: any MessagesListViewProtocol) {
        self.view = view
    }
}
