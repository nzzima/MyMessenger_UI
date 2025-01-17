//
//  ProfileUser.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 17.01.2025.
//

import Foundation
import FirebaseCore

struct ProfileUser {
    var email: String
    var name: String
    var surname: String
    var phone: String
    
    init(data: [String: Any]) {
        self.name = data["name"] as? String ?? ""
        self.surname = data["surname"] as? String ?? ""
        self.email = data["email"] as? String ?? ""
        self.phone = data["phone"] as? String ?? ""
    }
}
