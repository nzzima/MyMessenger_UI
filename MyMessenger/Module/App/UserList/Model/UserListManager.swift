//
//  UserListManager.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 13.01.2025.
//

import Foundation
import Firebase
import FirebaseFirestore

class UserListManager {
    
    private let ref = Firestore.firestore()
    private var lastDoc: DocumentSnapshot?
    
    func getAllUsers(completion: @escaping ([ChatUser]) -> Void) {
        ref
            .collection(.users)
        
        //MARK: default: .getDocuments (or .addSnapshotListener - to imedietly update database changed info about users (add, delete, change userInfo) by Firebase changing)
            .addSnapshotListener { snap, err in
                guard err == nil else { return }
                guard let docs = snap?.documents else { return }
                
                var users: [ChatUser] = []
                docs.forEach { user in
                    let userData = user.data()
                    if FireBaseManager.shared.getUser()?.uid != user.documentID {
                        let user = ChatUser(id: user.documentID, userInfo: userData)
                        users.append(user)
                    }
                }
                completion(users)
            }
    }
    
    func checkUserInConvo(users: [ChatUser]) async -> [ChatUser] {
        guard let uid = FireBaseManager.shared.getUser()?.uid else { return [] }
        
        var filteredUsers: [ChatUser] = []
        
        for user in users {
            let usersSnap = try? await Firestore.firestore()
                .collection(.conversation)
                .whereFilter(Filter.andFilter([
                    Filter.whereField("users", arrayContains: uid),
                    Filter.whereField("users", arrayContains: user.id)
                ]))
                .getDocuments()
            
            if let docs = usersSnap?.documents, docs.isEmpty {
                filteredUsers.append(user)
            }
        }
        return filteredUsers
    }
    
    func getAllConversations(completion: @escaping ([ConvoItem]) -> Void) {
        Firestore.firestore()
            .collection(.conversation)
            .addSnapshotListener {snap, err in
                guard err == nil else { return }
                guard let docs = snap?.documents else { return }
                
                var convos: [ConvoItem] = []
                docs.forEach { convo in
                    let convoData = convo.data()
                    let convo = ConvoItem(data: convoData)
                    convos.append(convo)
                }
                completion(convos)
            }
    }
    
    func getChatList(completion: @escaping ([ChatItem]) -> Void) {
        guard let uid = FireBaseManager.shared.getUser()?.uid else { return }
        
        Firestore.firestore()
            .collection(.users)
            .document(uid)
            .collection(.conversation)
            .order(by: "date", descending: true)
            .addSnapshotListener { snap, err in
                guard err == nil else { return }
                
                guard let doc = snap?.documents else { return }
                var chatItems: [ChatItem] = []
                
                doc.forEach {
                    let chatItem = ChatItem(convoId: $0.documentID, data: $0.data())
                    chatItems.append(chatItem)
                }
                
                completion(chatItems)
            }
    }
}
