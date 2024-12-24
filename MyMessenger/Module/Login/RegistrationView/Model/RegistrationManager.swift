//
//  RegistrationManager.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 24.12.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegistrationManager {
    //create user
    //add data
    
    func createUser(userInfo: UserInfo, completion: @escaping (Result<Bool, Error>) -> Void) {
        Auth.auth().createUser(withEmail: userInfo.email, password: userInfo.password) { [weak self] result, error in
            
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            
            guard let self = self else {return}
            guard let result else {return}
            
            result.user.sendEmailVerification()
            
            setUserInfo(uid: result.user.uid, userInfo: userInfo) {
                completion(.success(true))
            }
        }
    }
    
    private func setUserInfo(uid: String, userInfo: UserInfo, completion: @escaping () -> Void) {
        
        let userData: [String: Any] = [
            "phone": userInfo.phone,
            "email": userInfo.email,
            "name": userInfo.name,
            "surname": userInfo.surname,
            "regDate": Date()
        ]
        
        Firestore.firestore()
            .collection(.users)
            .document(uid)
            .setData(userData) {_ in
                completion()
            }
    }
}
