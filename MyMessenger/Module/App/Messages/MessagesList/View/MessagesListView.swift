//
//  MessagesListView.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 19.12.2024.
//

import UIKit

protocol MessagesListViewProtocol: AnyObject {
    
}

class MessagesListView: UIViewController, MessagesListViewProtocol {
    
    var presenter: MessagesListViewPresenterProtocol!
    
    lazy var tableView: UITableView = {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        $0.dataSource = self
        $0.delegate = self
        return $0
    }(UITableView(frame: view.bounds, style: .insetGrouped))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(tableView)
    }
    
    override func viewWillAppear(_ animated: Bool) { // Hide tabBar when tap to messenger with user
        hidesBottomBarWhenPushed = true
    }
    
    override func viewDidDisappear(_ animated: Bool) { // Show tabBar when return to chats
        hidesBottomBarWhenPushed = false
    }
}

extension MessagesListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let chatItem = presenter.chatList[indexPath.row]
        var config =  cell.defaultContentConfiguration()
        config.text = presenter.chatList[indexPath.row].name
        config.image = UIImage(systemName: "person.fill")
        config.secondaryText = chatItem.lastMessage.truncate(to: 20)
        
        cell.contentConfiguration = config
        return cell
    }
}

extension MessagesListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatItem = presenter.chatList[indexPath.row]
        
        let messangerControler = Builder.getMessengerView(chatItem: chatItem)
    
        navigationController?.pushViewController(messangerControler, animated: true)
    }
}
