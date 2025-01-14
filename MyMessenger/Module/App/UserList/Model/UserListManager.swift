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
            .getDocuments { snap, err in
                guard err == nil else { return }
                guard let docs = snap?.documents else { return }
                
                var users: [ChatUser] = []
                docs.forEach { user in
                    let userData = user.data()
                    if FireBaseManager.shared.getUser()?.uid != user.documentID {
                        let user = ChatUser(uid: user.documentID, userInfo: userData)
                        users.append(user)
                    }
                }
                completion(users)
            }
//// ============= FIRST GETTING FIREBASE DATABASE USERS =============
//        var query: Query?
//
//        if lastDoc == nil {
//            query = ref
//                .collection(.users)
//                .limit(to: 10)
//        } else {
//            query = ref
//                .collection(.users)
//                .limit(to: 10)
//                .start(afterDocument: lastDoc!)
//        }
//
//        query!
//            .addSnapshotListener { snap, err in
//                guard err == nil else { return }
//                guard let docs = snap?.documents else { return }
//                self.lastDoc = docs.last
//
//                //Task {
//                    var users: [ChatUser] = []
//                    docs.forEach { user in
//                        let userData = user.data()
//                        if FireBaseManager.shared.getUser()?.uid != user.documentID {
//                            let user = ChatUser(uid: user.documentID, userInfo: userData)
//                            users.append(user)
//                        }
//                    }
//                    completion(users)
//            }
    }
    
    private func checkUserInConvo(users: [ChatUser]) async -> [ChatUser] {
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
}
