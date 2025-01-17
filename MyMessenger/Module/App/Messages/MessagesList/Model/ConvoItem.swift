//
//  ConvoItem.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 17.01.2025.
//

import Foundation
import FirebaseCore

struct ConvoItem {
    var date: Date
    var otherId: String
    var senderId: String
    var users: [String]
    
    init(data: [String: Any]) {
        self.date = {
            let timeStamp = data["date"] as? Timestamp
            return timeStamp?.dateValue() ?? Date()
        }()
        self.otherId = data["otherId"] as? String ?? ""
        self.senderId = data["senderId"] as? String ?? ""
        self.users = data["users"] as? [String] ?? []
    }
}
