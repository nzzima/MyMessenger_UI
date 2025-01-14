//
//  GetMessageManager.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 14.01.2025.
//

import Foundation
import FirebaseFirestore

class GetMessageManager {
    
    var lastSnapshot: DocumentSnapshot?
    
    func getAllMessage(convoId: String, completion: @escaping ([Message]) -> Void) {
        Firestore.firestore()
            .collection(.conversation)
            .document(convoId)
            .collection(.messages)
            .limit(to: 50)
            .order(by: "date")
            .addSnapshotListener {snap, err in
                guard err == nil else {return}
                guard let messagesSnap = snap?.documents else {return}
                
                self.lastSnapshot = messagesSnap.last
                let messages = messagesSnap.compactMap {doc in
                    Message(messageId: doc.documentID, data: doc.data())
                }
                
                completion(messages)
            }
    }
    
    func loadOneMessage(convoId: String, completion: @escaping (Message) -> Void) {
        guard let lastSnapshot else {return}
        Firestore.firestore()
            .collection(.conversation)
            .document(convoId)
            .collection(.messages)
            .order(by: "date")
            //.start(afterDocument: lastSnapshot)
            .limit(to: 1)
            .order(by: "date")
            .addSnapshotListener {snap, err in
                guard err == nil else {return}
                
                if let hasPending = snap?.metadata.hasPendingWrites, !hasPending {
                    guard let messagesSnap = snap?.documents, let message = messagesSnap.first else {return}
                    let lastMessage = Message(messageId: message.documentID, data: message.data())
                    
                    
                    completion(lastMessage)
                }
            }
    }
}
