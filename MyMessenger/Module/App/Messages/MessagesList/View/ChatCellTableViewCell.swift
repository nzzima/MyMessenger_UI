//
//  ChatCellTableViewCell.swift
//  MyMessenger
//
//  Created by Nikita Krylov on 17.01.2025.
//

import UIKit

class ChatCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    static let reuseIdentifier = "ChatCellTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        settingCell()
    }
    
    func configCell(_ name: String, _ message: String) {
        userName.text = name
        messageLabel.text = message
    }
    
    func settingCell() {
        parentView.layer.cornerRadius = 10
        userImage.layer.cornerRadius = userImage.frame.width / 2
        userImage.image = UIImage(named: "basicUserImage")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
