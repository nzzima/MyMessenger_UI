//
//  ChatItem.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 23.12.2024.
//

import Foundation

struct ChatItem {
    var convoId: String? // convoid
    
    var name: String // chating name
    var otherUserId: String
    
    var date: Date
    var lastMessage: String?
    
    init(convoId: String, date: [String: Any]) {
        self.convoId = convoId
        self.name = date["name"] as? String ?? ""
        self.otherUserId = date["otherId"] as? String ?? ""
        self.date = {
            let timeStamp = data["date"] as? Timestamp
            return timeStamp?.dateValue() ?? Date()
            
        }()
        self.lastMessage = date["lastMessage"] as? String ?? ""
    }
}
