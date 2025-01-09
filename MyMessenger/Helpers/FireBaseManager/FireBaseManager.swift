//
//  FireBaseManager.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 16.12.2024.
//

import UIKit
import Foundation
import FirebaseAuth

class FireBaseManager {
    
    static let shared = FireBaseManager()
    let auth = Auth.auth()
    
    private init() {}
    
    func isLogin() -> Bool {
        return auth.currentUser?.uid == nil ? false : true
    }
    
    func getUser() -> User?{
        guard let user = auth.currentUser else { return nil }
        return user
    }
    
    func signOut() {
        do {
            try auth.signOut()
            NotificationCenter.default.post(name: .windowManager, object: nil, userInfo: [String.state: WindowManager.authentificationWindow])
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
