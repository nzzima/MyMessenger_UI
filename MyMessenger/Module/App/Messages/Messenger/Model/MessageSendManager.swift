//
//  MessageSendManager.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 13.01.2025.
//

import Foundation
import Firebase
import FirebaseFirestore

class MessageSendManager {
    
    //MARK: Check existing chat: yes - set message, if not - create new chat.
    func sendMessage(convoId: String?, message: String, otherUser: Sender, completion: @escaping (String?) -> Void) {
        guard let selfId = FireBaseManager.shared.getUser()?.uid else { return }
        
        if convoId == nil {
            self.createNewConvo(uid: selfId, message: message, otherUser: otherUser) {convoId in
                completion(convoId)
            }
        } else {
            setMessage(uid: selfId, convoId: convoId!, message: message, otherUser: otherUser)
        }
    }
    
    //MARK: Creat new chat (conversation)
    private func createNewConvo(uid: String, message: String, otherUser: Sender, completion: (String) -> ()) {
        let convoId = UUID().uuidString
        let convoData: [String: Any] = [
            "date": Date(),
            "senderId": uid,
            "otherId": otherUser.senderId,
            "users": [uid, otherUser.senderId]
        ]
        
        Firestore.firestore()
            .collection(.conversation)
            .document(convoId)
            .setData(convoData, merge: true)
        
        setMessage(uid: uid, convoId: convoId, message: message, otherUser: otherUser)
        completion(convoId)
    }
    
    //MARK: Send message to chat
    private func setMessage(uid: String, convoId: String, message: String, otherUser: Sender) {
        
        let messageData: [String: Any] = [
            "date": Date(),
            "senderId": uid,
            "message": message,
            "otherId": otherUser.senderId
        ]
        
        Firestore.firestore()
            .collection(.conversation)
            .document(convoId)
            .collection(.messages)
            .document(UUID().uuidString)
            .setData(messageData)
        
        // Self last message
        let selfLastMessage : [String: Any] = [
            "name": otherUser.displayName,
            "otherId": otherUser.senderId,
            "lastMessage": message,
            "date": Date()
        ]
        
        Firestore.firestore()
            .collection(.users)
            .document(uid)
            .collection(.conversation)
            .document(convoId)
            .setData(selfLastMessage)
        
        // Other last messagewww
        let otherUserLastMessage : [String: Any] = [
            "name": UserDefaults.standard.string(forKey: "selfName") ?? "",
            "otherId": otherUser.senderId,
            "lastMessage": message,
            "date": Date()
        ]
        Firestore.firestore()
            .collection(.users)
            .document(otherUser.senderId)
            .collection(.conversation)
            .document(convoId)
            .setData(otherUserLastMessage)
    }
    
    private func getDocumentReference(convoId: String?) -> DocumentReference {
        if convoId == nil {
            return Firestore.firestore().collection(.conversation).document(UUID().uuidString)
        } else {
            return Firestore.firestore().collection(.conversation).document(convoId!)
        }
        
        
    }
}
