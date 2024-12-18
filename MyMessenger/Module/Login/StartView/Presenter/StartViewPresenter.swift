//
//  StartViewPresenter.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 17.12.2024.
//

import Foundation

import UIKit

protocol StartViewPresenterProtocol: AnyObject {
    init(view: StartViewProtocol)
}

class StartViewPresenter: StartViewPresenterProtocol {
    weak var view: StartViewProtocol?
    
    required init(view: any StartViewProtocol) {
        self.view = view
    }
}
