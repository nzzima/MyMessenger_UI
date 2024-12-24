//
//  MessengerView.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 23.12.2024.
//

import UIKit
import MessageKit
import InputBarAccessoryView

protocol MessengerViewProtocol: AnyObject {
    
}

class MessengerView: MessagesViewController, MessengerViewProtocol {
    
    var presenter: MessengerViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = presenter.title
        showMessageTimestampOnSwipeLeft = true
        messagerSetup()
        messagesCollectionView.reloadData()
    }
    
    private func messagerSetup() {
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messageInputBar.delegate = self
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
    
    private func insertMessage(_ message: Message) {
        presenter.messages.append(message)
        
        // Reload last sestion to update header/footer labels and insert a new one
        messagesCollectionView.performBatchUpdates({
            messagesCollectionView.insertSections([presenter.messages.count - 1])
            if presenter.messages.count >= 2 {
                messagesCollectionView.reloadSections([presenter.messages.count - 2])
            }
        }, completion: {[weak self] _ in
            self?.messagesCollectionView.scrollToLastItem(animated: true)
        })
    }
}

extension MessengerView: MessagesDisplayDelegate, MessagesLayoutDelegate {
   
    //MARK: Height from top of message box to name
    func messageTopLabelHeight(for message: any MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        20
    }
    
    //MARK: Height from bottom of message box to date time
    func messageBottomLabelHeight(for message: any MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        20
    }

    
    //MARK: Color of message box
    func backgroundColor(for message: any MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        message.sender.senderId == presenter.selfSender.senderId ? .black : .gray
    }
    
    //MARK: Name at the top of message box
    func messageTopLabelAttributedText(for message: any MessageType, at indexPath: IndexPath) -> NSAttributedString? {
        let name = message.sender.displayName
        return NSAttributedString(string: name, attributes:
                                    [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.black])
    }
    
    //MARK: Date time at the bottom of message box
    func messageBottomLabelAttributedText(for message: any MessageType, at indexPath: IndexPath) -> NSAttributedString? {
        let name = message.sentDate.formatted()
        return NSAttributedString(string: name, attributes:
                                    [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10), NSAttributedString.Key.foregroundColor: UIColor.black])
    }
    
    //MARK: Color of sender avatar
    func configureAvatarView(_ avatarView: AvatarView, for message: any MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) {
        avatarView.initials = message.sender.displayName.first?.uppercased()
        avatarView.backgroundColor = .orange
    }
}

extension MessengerView: InputBarAccessoryViewDelegate {
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        let message = Message(sender: presenter.selfSender, messageId: UUID().uuidString, sentDate: Date(), kind: .text(text))
        
        self.insertMessage(message)
        inputBar.inputTextView.text = ""
    }
}
