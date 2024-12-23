//
//  ChatItem.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 23.12.2024.
//

import Foundation

struct ChatItem {
    var id: String // convoid
    
    var name: String // chating name
    var otherUserId: String
    
    var date: Date
    var lastMessage: String
    
    static func mockData() -> [ChatItem] {
        [
            ChatItem(id: UUID().uuidString, name: "User1", otherUserId: UUID().uuidString, date: Date(), lastMessage: "Lorem ipsum t dolore magna aliqua."),
            ChatItem(id: UUID().uuidString, name: "User2", otherUserId: UUID().uuidString, date: Date(), lastMessage: "L sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
            ChatItem(id: UUID().uuidString, name: "User3", otherUserId: UUID().uuidString, date: Date(), lastMessage: "Lorem ipsum dadipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
            ChatItem(id: UUID().uuidString, name: "User4", otherUserId: UUID().uuidString, date: Date(), lastMessage: "Lorem ipsum dolor sit amet, consectetur adipiscing do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
            ChatItem(id: UUID().uuidString, name: "User5", otherUserId: UUID().uuidString, date: Date(), lastMessage: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod  labore et dolore magna aliqua."),
            ChatItem(id: UUID().uuidString, name: "User6", otherUserId: UUID().uuidString, date: Date(), lastMessage: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.")]
    }
}
