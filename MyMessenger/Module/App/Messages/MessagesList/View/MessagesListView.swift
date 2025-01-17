//
//  MessagesListView.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 19.12.2024.
//

import UIKit

protocol MessagesListViewProtocol: AnyObject {
    func reloadTable()
}

class MessagesListView: UIViewController, MessagesListViewProtocol {
    
    var presenter: MessagesListViewPresenterProtocol!
    
    lazy var tableView: UITableView = {
        $0.register(UINib(nibName: "ChatCellTableViewCell", bundle: nil), forCellReuseIdentifier: ChatCellTableViewCell.reuseIdentifier)
        $0.dataSource = self
        $0.delegate = self
        $0.separatorStyle = .none
        return $0
    }(UITableView(frame: view.bounds))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        navigationItem.title = "Chats"
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
        let cell = tableView.dequeueReusableCell(withIdentifier: ChatCellTableViewCell.reuseIdentifier, for: indexPath) as! ChatCellTableViewCell
        
        cell.selectionStyle = .none
        
        let chatItem = presenter.chatList[indexPath.row]
        cell.configCell(presenter.chatList[indexPath.row].name, chatItem.lastMessage?.truncate(to: 20) ?? "")
//        var config =  cell.defaultContentConfiguration()
//        config.text = presenter.chatList[indexPath.row].name
//        config.image = UIImage(systemName: "person.fill")
//        config.secondaryText = chatItem.lastMessage?.truncate(to: 20)
//        
//        cell.contentConfiguration = config
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func reloadTable() {
        tableView.reloadData()
    }
}

extension MessagesListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatItem = presenter.chatList[indexPath.row]
        
        let messangerControler = Builder.getMessengerView(chatItem: chatItem)
    
        navigationController?.pushViewController(messangerControler, animated: true)
    }
}
