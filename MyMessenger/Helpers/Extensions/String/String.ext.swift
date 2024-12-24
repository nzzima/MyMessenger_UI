//
//  String.ext.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 17.12.2024.
//

import SwiftUI

extension String {
    func locolize(_ text: String.LocalizationValue) -> String {
        String(localized: text)
    }
}

//MARK: -- UserInfo keys
extension String {
    static let state = "state"
}

//MARK: -- Firebase Keys
extension String {
    static let users = "users"
    static let conversation = "conversation"
}

extension String {
    func truncate(to limit: Int, ellipsis: Bool = true) -> String {
        if count > limit {
            let truncated = String(prefix(limit)).trimmingCharacters(in: .whitespacesAndNewlines)
            
            return ellipsis ? truncated + "\u{2026}" : truncated
        } else {
            return self
        }
    }
}
