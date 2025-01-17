//
//  ProfileUserManager.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 17.01.2025.
//

import Foundation
import Firebase
import FirebaseFirestore

class ProfileUserManager {
    func getUserProfileInfo(completion: @escaping ([ProfileUser]) -> Void) {
        guard let uid = FireBaseManager.shared.getUser()?.uid else {return}
        
        Firestore.firestore()
            .collection("users")
            .document(uid)
            .getDocument { snap, err in
                guard err == nil else { return }
                guard let doc = snap else {return}
                
                guard let data = doc.data() else {return}
                var profileInfo: [ProfileUser] = []
                
                let profileUser = ProfileUser(data: data)
                profileInfo.append(profileUser)
                
                completion(profileInfo)
            }
    }
}
