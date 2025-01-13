//
//  MessagesListManager.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 13.01.2025.
//

import Foundation
import Firebase
import FirebaseFirestore

class MessagesListManager {
    func getChatList(completion: @escaping ([ChatItem]) -> Void) {
        guard let uid = FireBaseManager.shared.getUser()?.uid else { return }
        
        Firestore.firestore()
            .collection(.users)
            .document(uid)
            .collection(.conversation)
            .order(by: "date")
            .addSnapshotListener { snap, err in
                guard err == nil else { return }
                
                guard let doc = snap?.documents else { return }
                var chatItems: [ChatItem] = []
                
                doc.forEach {
                    let chatItem = ChatItem(convoId: $0.documentID, date: $0.data())
                    chatItems.append(chatItem)
                }
                
                completion(chatItems)
            }
    }
}
