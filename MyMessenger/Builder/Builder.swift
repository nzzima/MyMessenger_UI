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
    
    static func getRegistrationView() -> UIViewController {
        let view = RegistrationView()
        let presenter = RegistrationViewPresenter(view: view)
        
        view.presenter = presenter
        
        return view
    }
    
    static func getStartView() -> UIViewController {
        let view = StartView()
        let presenter = StartViewPresenter(view: view)
        
        view.presenter = presenter
        
        return view
    }
    
    static func getCheckCodeView() -> UIViewController {
        let view = CheckPhoneCodeView()
        let presenter = CheckPhoneCodeViewPresenter(view: view)
        
        view.presenter = presenter
        
        return view
    }
    
    static func getTabBarView() -> UIViewController {
        let view = TabBarView()
        let presenter = TabBarPresenter(view: view)
        
        view.presenter = presenter
        
        return view
    }
    
    static func getUserListView() -> UIViewController {
        let view = UserListView()
        let presenter = UserListViewPresenter(view: view)
        
        view.presenter = presenter
        
        return UINavigationController(rootViewController: view)
    }
    
    static func getMessageListView() -> UIViewController {
        let view = MessagesListView()
        let presenter = MessagesListViewPresenter(view: view)
        
        view.presenter = presenter
        
        return UINavigationController(rootViewController: view)
    }
    
    static func getProfileView() -> UIViewController {
        let view = ProfileView()
        let presenter = ProfileViewPresenter(view: view)
        
        view.presenter = presenter
        
        return UINavigationController(rootViewController: view)
    }
}
