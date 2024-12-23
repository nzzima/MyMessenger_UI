//
//  MessengerViewPresenter.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 23.12.2024.
//

import UIKit

protocol MessengerViewPresenterProtocol: AnyObject {
    var title: String { get set }
}

class MessengerViewPresenter: MessengerViewPresenterProtocol {
    weak var view: MessengerViewProtocol?
    
    private var convoId: String
    var title: String
    
    required init(view: MessengerViewProtocol?, convoId: String, otherId: String, name: String) {
        self.view = view
        self.convoId = convoId
        self.title = name
    }
}
