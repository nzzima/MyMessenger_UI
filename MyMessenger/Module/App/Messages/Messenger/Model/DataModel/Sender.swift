//
//  Sender.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 23.12.2024.
//

import MessageKit

struct Sender: SenderType, Equatable {
    var senderId: String
    var displayName: String
}
