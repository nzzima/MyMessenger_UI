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
}

class MessengerViewPresenter: MessengerViewPresenterProtocol {
    var messages: [Message]
    
    weak var view: MessengerViewProtocol?
    
    private var convoId: String
    var title: String
    private var otherId: String
    
    lazy var selfSender = Sender(senderId: "1", displayName: "Nikita")
    private lazy var otherSender = Sender(senderId: otherId, displayName: "Nikita")
    
    required init(view: MessengerViewProtocol?, convoId: String, otherId: String, name: String) {
        self.view = view
        self.convoId = convoId
        self.title = name
        self.otherId = otherId
        self.messages = Message.mockData()
    }
}
