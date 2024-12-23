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
    
    static func mockData() -> [ChatUser] {
        [ChatUser(id: UUID().uuidString, name: "User1"),
         ChatUser(id: UUID().uuidString, name: "User2"),
         ChatUser(id: UUID().uuidString, name: "User3"),
         ChatUser(id: UUID().uuidString, name: "User4"),
         ChatUser(id: UUID().uuidString, name: "User5"),
         ChatUser(id: UUID().uuidString, name: "User6"),]
    }
}
