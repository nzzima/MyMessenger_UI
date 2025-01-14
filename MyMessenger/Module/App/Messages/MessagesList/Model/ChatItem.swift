//
//  ChatItem.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 23.12.2024.
//

import Foundation
import FirebaseCore

struct ChatItem {
    var convoId: String? // convoid
    
    var name: String // chating name
    var otherUserId: String
    
    var date: Date
    var lastMessage: String?
    
    init(convoId: String?, name: String, otherUserId: String, date: Date, lastMessage: String?) {
        self.convoId = convoId
        self.name = name
        self.otherUserId = otherUserId
        self.date = date
        self.lastMessage = lastMessage
    }
    
    init(convoId: String, data: [String: Any]) {
        self.convoId = convoId
        self.name = data["name"] as? String ?? ""
        self.otherUserId = data["otherId"] as? String ?? ""
        self.date = {
            let timeStamp = data["date"] as? Timestamp
            return timeStamp?.dateValue() ?? Date()
            
        }()
        self.lastMessage = data["lastMessage"] as? String ?? ""
    }
}
