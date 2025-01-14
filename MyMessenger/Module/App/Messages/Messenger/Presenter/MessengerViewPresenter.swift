//
//  MessengerViewPresenter.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 23.12.2024.
//

import UIKit

protocol MessengerViewPresenterProtocol: AnyObject {
    var title: String { get set }
    var selfSender: Sender { get set }
    var messages: [Message] { get set }
    func sendMessage(message: Message)
}

class MessengerViewPresenter: MessengerViewPresenterProtocol {
    var messages: [Message]
    
    weak var view: MessengerViewProtocol?
    
    private var convoId: String?
    var title: String
    private var otherId: String
    private let messageSendManager = MessageSendManager()
    private let getMessageManager = GetMessageManager()
    var selfSender: Sender
    
    private lazy var otherSender = Sender(senderId: otherId, displayName: title)
    
    required init(view: MessengerViewProtocol?, convoId: String?, otherId: String, name: String) {
        self.view = view
        self.convoId = convoId
        self.title = name
        self.otherId = otherId
        self.messages = []
        
        self.selfSender = Sender(senderId: (FireBaseManager.shared.getUser()?.uid)!, displayName: UserDefaults.standard.string(forKey: "selfName") ?? "")
        
        if convoId != nil {
            getMessages(convoId: convoId!)
            loadLastMessage(convoId: convoId!)
        }
    }
    
    func sendMessage(message: Message) {
        switch message.kind {
        case .text (let text):
            messageSendManager.sendMessage(convoId: convoId, message: text, otherUser: otherSender) { [weak self] convoId in
                guard let self = self else { return }
                guard let convoId else { return }
                
                self.convoId = convoId
            }
            
        default : break
        }
    }
    
    func getMessages(convoId: String) {
        getMessageManager.getAllMessage(convoId: convoId) { [weak self] message in
            guard let self = self else { return }
            
            self.messages = message
            self.view?.reloadCollection()
        }
    }
    
    private func loadLastMessage(convoId: String) {
        getMessageManager.loadOneMessage(convoId: convoId) { [weak self] message in
            guard let self = self else { return }
            
            if message.sender.senderId != selfSender.senderId {
                self.messages.append(message)
                view?.reloadCollection()
            }
        
        }
    }
}
