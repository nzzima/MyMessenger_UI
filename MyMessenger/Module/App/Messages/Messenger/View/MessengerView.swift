//
//  MessengerView.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 23.12.2024.
//

import UIKit
import MessageKit

protocol MessengerViewProtocol: AnyObject {
    
}

class MessengerView: MessagesViewController, MessengerViewProtocol {
    
    var presenter: MessengerViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
