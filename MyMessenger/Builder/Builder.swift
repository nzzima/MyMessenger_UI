//
//  Builder.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 16.12.2024.
//

import UIKit

class Builder {
    static func getAuthenticationView() -> UIViewController {
        let view = AuthenticationView()
        let presenter = AuthenticationViewPresenter(view: view)
        
        view.presenter = presenter
        
        return view
    }
}
