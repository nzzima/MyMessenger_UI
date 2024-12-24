//
//  SceneDelegate.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 16.12.2024.
//

import UIKit

enum WindowManager: String {
    case startWindow, authentificationWindow, registrationWindow, checkCodeWindow, appWindow
}

enum UserInfoKeys: String {
    case state
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(windowManager(notification:)), name: .windowManager, object: nil)
        
        guard let scene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(windowScene: scene)
        
        window?.rootViewController = FireBaseManager.shared.isLogin() ? Builder.getTabBarView() : Builder.getStartView()
        
        window?.makeKeyAndVisible()
    }
    
    @objc
    private func windowManager(notification: Notification) {
        
        guard let userInfo = notification.userInfo as? [String: Any] else { return }
        
        guard let state = userInfo[.state] as? WindowManager else {
            return
        }
        
        switch state {
        case .startWindow:
            window?.rootViewController = Builder.getStartView()
        case .authentificationWindow:
            window?.rootViewController = Builder.getAuthenticationView()
        case .checkCodeWindow:
            window?.rootViewController = Builder.getCheckCodeView()
        case .registrationWindow:
            window?.rootViewController = Builder.getRegistrationView()
        case .appWindow:
            window?.rootViewController = Builder.getTabBarView()
        }
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

