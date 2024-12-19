//
//  TabBarView.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 19.12.2024.
//

import UIKit

protocol TabBarViewProtocol: AnyObject {
    func setControllers(views: [UIViewController])
}

class TabBarView: UITabBarController, TabBarViewProtocol {
    
    var presenter: TabBarPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "startImage")!)
    }
    
    func setControllers(views: [UIViewController]) {
        setViewControllers(views, animated: true)
    }
}
