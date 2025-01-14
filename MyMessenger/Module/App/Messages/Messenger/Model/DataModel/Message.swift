//
//  Message.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 23.12.2024.
//
import Foundation
import MessageKit
import Firebase

struct Message: MessageType {
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
    
    static func mockData() -> [Message] {
        [
            Message(sender: Sender(senderId: "1", displayName: "Nikita"), messageId: UUID().uuidString, sentDate: Date().addingTimeInterval(-1), kind: .text("Lorem ipsum dolor sit amet, consectetur adipiscing do eiusmod tempor incididunt")),
            Message(sender: Sender(senderId: "2", displayName: "User"), messageId: UUID().uuidString, sentDate: Date().addingTimeInterval(-1), kind: .text("Lorem ipsum dolor sit amet")),
            Message(sender: Sender(senderId: "1", displayName: "Nikita"), messageId: UUID().uuidString, sentDate: Date().addingTimeInterval(-1), kind: .text("consectetur adipiscing do eiusmod tempor incididunt")),
            Message(sender: Sender(senderId: "2", displayName: "User"), messageId: UUID().uuidString, sentDate: Date().addingTimeInterval(-1), kind: .text("sit amet, consectetur adipiscing do eiusmod")),
            Message(sender: Sender(senderId: "1", displayName: "Nikita"), messageId: UUID().uuidString, sentDate: Date().addingTimeInterval(-1), kind: .text("tempor incididunt"))
        ]
    }
    
    init(sender: SenderType, messageId: String, sentDate: Date, kind: MessageKind) {
        self.sender = sender
        self.messageId = messageId
        self.sentDate = sentDate
        self.kind = kind
    }
    
    init(messageId: String, data: [String: Any]) {
        self.messageId = messageId
        self.sender = Sender(senderId: data["senderId"] as? String ?? "", displayName: "")
        
        self.kind = .text(data["message"] as? String ?? "")
        self.sentDate = {
            let timeStamp = data["date"] as? Timestamp
            return timeStamp?.dateValue() ?? Date()
        }()
    }
}
