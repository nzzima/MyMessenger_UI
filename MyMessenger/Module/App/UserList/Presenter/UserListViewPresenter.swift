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
    var convos: [ConvoItem] { get set }
    var chatList: [ChatItem] { get set }
}

class UserListViewPresenter: UserListViewPresenterProtocol {
  
    weak var view: UserListViewProtocol?
    private let userListManager = UserListManager()
    
    var users: [ChatUser] = []
    var convos: [ConvoItem]
    var chatList: [ChatItem] = []
    
    required init(view: any UserListViewProtocol) {
        self.view = view
        self.convos = []
        self.chatList = []
        getAllUsers()
        getAllConversations()
        getAllChats()
    }
    
    func getAllUsers() {
        userListManager.getAllUsers { [weak self] users in
            guard let self = self else { return }
            self.users = users
            self.view?.reloadTable()
        }
    }
    
    func getAllConversations() {
        userListManager.getAllConversations { [weak self] convos in
            guard let self else { return }
            self.convos = convos
            self.view?.reloadTable()
        }
    }
    
    func getAllChats() {
        userListManager.getChatList { [weak self] chatList in
            guard let self = self else { return }
            
            self.chatList = chatList
            self.view?.reloadTable()
        }
    }
    
}
