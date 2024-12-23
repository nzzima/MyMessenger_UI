//
//  MessengerView.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 23.12.2024.
//

import UIKit
import MessageKit

protocol MessengerViewProtocol: AnyObject {
    
}

class MessengerView: MessagesViewController, MessengerViewProtocol {
    
    var presenter: MessengerViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = presenter.title
        showMessageTimestampOnSwipeLeft = true
        messagerSetup()
    }
    
    private func messagerSetup() {
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        
        messagesCollectionView.reloadData()
    }
}

extension MessengerView: MessagesDataSource {
    
    var currentSender: any MessageKit.SenderType {
        presenter.selfSender
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessageKit.MessagesCollectionView) -> MessageType {
        presenter.messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessageKit.MessagesCollectionView) -> Int {
        presenter.messages.count
    }
}

extension MessengerView: MessagesDisplayDelegate, MessagesLayoutDelegate {
    
}
