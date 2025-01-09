//
//  AuthenticationManager.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 09.01.2025.
//

import Foundation
import FirebaseAuth

class AuthenticationManager {
     
    func auth(userInfo: UserInfo, completion: @escaping (Result<Bool, Error>) -> Void) {
        Auth.auth().signIn(withEmail: userInfo.email, password: userInfo.password) { result, err in
            guard err == nil else {
                completion(.failure(err!))
                return
            }
            
            guard let result else { return }
            
            completion(.success(true))
        }
    }
}
