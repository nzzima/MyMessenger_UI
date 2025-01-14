//
//  MessagesListViewPresenter.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 19.12.2024.
//

import UIKit

protocol MessagesListViewPresenterProtocol: AnyObject {
    //init(view: MessagesListViewProtocol)
    var chatList: [ChatItem] { get set }
}

class MessagesListViewPresenter: MessagesListViewPresenterProtocol {
    
    weak var view: MessagesListViewProtocol?
    
    private let messageListManager = MessagesListManager()
    var chatList: [ChatItem]
    
    required init(view: any MessagesListViewProtocol) {
        self.view = view
        self.chatList = []
        getChatList()
    }
    
    func getChatList() {
        messageListManager.getChatList { [weak self] chatList in
            guard let self = self else { return }
            
            self.chatList = chatList
            self.view?.reloadTable()
        }
    }
}
