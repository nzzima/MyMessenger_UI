//
//  UserListView.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 19.12.2024.
//

import UIKit
import FirebaseFirestore

protocol UserListViewProtocol: AnyObject {
    func reloadTable()
}

class UserListView: UIViewController, UserListViewProtocol {
    
    var presenter: UserListViewPresenterProtocol!
    
    lazy var signOutButton: UIBarButtonItem = UIBarButtonItem(image: .actions, style: .done, target: self, action: #selector(signOut))
    
    lazy var tableView: UITableView = {
        $0.register(UINib(nibName: "UserCellTableViewCell", bundle: nil), forCellReuseIdentifier: UserCellTableViewCell.reuseIdentifier)
        $0.dataSource = self
        $0.delegate = self
        $0.separatorStyle = .none
        return $0
    }(UITableView(frame: view.bounds))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Users"
        view.addSubview(tableView)
        navigationItem.rightBarButtonItem = signOutButton
    
    }
    
    func reloadTable() {
        tableView.reloadData()
    }
    
    @objc func signOut() {
        FireBaseManager.shared.signOut()
    }
}

extension UserListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserCellTableViewCell.reuseIdentifier, for: indexPath) as! UserCellTableViewCell
        
        cell.selectionStyle = .none
        
        let cellItem = presenter.users[indexPath.row]
        cell.configCell(cellItem.name)
//
//        var config = cell.defaultContentConfiguration()
//        config.text = cellItem.name
//        config.image = UIImage(systemName: "person.circle.fill")
//        
//        cell.contentConfiguration = config
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

extension UserListView: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let uid = FireBaseManager.shared.getUser()?.uid else { return }
//        print("tapped user = ", presenter.users[indexPath.row].id) //Tapped user id in userlist
//        print("own user = ", uid)
//        

        for convo in presenter.convos {
            if convo.users.contains(presenter.users[indexPath.row].id) && convo.users.contains(uid){
                let chatItem = presenter.chatList[indexPath.row] // Existed chat
                let messenger = Builder.getMessengerView(chatItem: chatItem)
                navigationController?.pushViewController(messenger, animated: true)
                return
            }
        }
        
        let chatItem = ChatItem(convoId: nil, name: presenter.users[indexPath.row].name, otherUserId: presenter.users[indexPath.row].id, date: Date(), lastMessage: nil) // New chat
        let messenger = Builder.getMessengerView(chatItem: chatItem)
        navigationController?.pushViewController(messenger, animated: true)
        
    }
}
