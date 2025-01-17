//
//  User.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 23.12.2024.
//

import Foundation

struct ChatUser {
    var id: String
    var name: String
    
    init(id: String, userInfo: [String: Any]) {
        self.id = id
        self.name = userInfo["name"] as? String ?? ""
    }
}
