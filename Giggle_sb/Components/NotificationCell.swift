//
//  notificationCell.swift
//  Giggle_sb
//
//  Created by rjk on 16/11/24.
//

import UIKit
import Popovers

protocol NotificationCellDelegate: AnyObject {
    func didTapMarkAsRead(at indexPath: IndexPath)
}

class NotificationCell: UITableViewCell {

    @IBOutlet weak var readDot: UIView!
    @IBOutlet weak var companyAvatar: UIImageView!
    @IBOutlet weak var notificationLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var postedAtLabel: UILabel!
    
    var indexPath: IndexPath?
    weak var delegate: NotificationCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    lazy var menu = Templates.UIKitMenu(sourceView: moreButton, configuration: {
        $0.width = 200
    }) {
        Templates.MenuButton(title: "Mark As Read", systemImage: "checkmark.circle.fill") { [weak self] in
            guard let self = self, let indexPath = self.indexPath else { return }
            self.delegate?.didTapMarkAsRead(at: indexPath) // Notify the delegate
        }
    } fadeLabel: { [weak self] fade in
        self?.moreButton.alpha = fade ? 0.5 : 1
    }

    func configure(with notification: Notifications, indexPath: IndexPath) {
        self.indexPath = indexPath
        // Set data for each UI component from the Gig model
        companyAvatar.image = UIImage(named: notification.gigAvatar)
        notificationLabel.text = notification.notificationContent
        // Hide or show red dot based on isRead
        readDot.isHidden = notification.isRead
        postedAtLabel.text = notification.postedAt
        readDot.layer.cornerRadius = readDot.frame.height / 2
        companyAvatar.layer.cornerRadius = companyAvatar.frame.height / 2
    }
    
    @IBAction func moreButtonTapped(_ sender: UIButton) {
        if menu.isPresented {
            menu.dismiss()
        } else {
            menu.present()
        }
    }

}
