//
//  Message.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 23.12.2024.
//
import Foundation
import MessageKit

struct Message: MessageType {
    var sender: any MessageKit.SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKit.MessageKind
}
