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
    
    var chatList: [ChatItem]
    
    required init(view: any MessagesListViewProtocol) {
        self.view = view
        self.chatList = ChatItem.mockData()
    }
}
