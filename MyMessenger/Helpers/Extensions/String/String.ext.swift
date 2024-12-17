//
//  String.ext.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 17.12.2024.
//

import Foundation

extension String {
    static func locolize(_ text: String.LocalizationValue) -> String {
        String(localized: text)
    }
}

//MARK: -- UserInfo keys
extension String {
    static let state = "state"
}
