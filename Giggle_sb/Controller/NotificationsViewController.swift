//
//  NotificationsViewController.swift
//  Giggle_sb
//
//  Created by rjk on 12/11/24.
//

import UIKit
import Popovers

class NotificationsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NotificationCellDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var markAllAsRead: UIButton!
    
    var notifications: [Notifications] = sampleNotifications
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.rowHeight = 96

        // Do any additional setup after loading the view.
    }
    
    @IBAction func markAllAsReadTapped(_ sender: UIButton) {
        for index in notifications.indices {
            notifications[index].isRead = true
        }
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = UIColor(red: 0.1176, green: 0.1608, blue: 0.2314, alpha: 1)
        return footerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.notifications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell", for: indexPath) as? NotificationCell else {
            return UITableViewCell()
        }
        
        // Configure cell with Gig data
        let notification = notifications[indexPath.section]
        cell.configure(with: notification, indexPath: indexPath)
        cell.delegate = self
        return cell
    }

    // MARK: - NotificationCellDelegate
    func didTapMarkAsRead(at indexPath: IndexPath) {
        // Update data model
        notifications[indexPath.section].isRead = true

        // Reload affected cell
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
