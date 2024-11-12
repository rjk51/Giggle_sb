//
//  HomeScreenViewController.swift
//  Giggle_sb
//
//  Created by rjk on 06/11/24.
//

import UIKit

class HomeScreenViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var userProfile: UIImageView!
    @IBOutlet weak var flnTestButton: UIButton!
    @IBOutlet weak var gigsTableView: UITableView!
    
    var gigs: [Gig] = sampleGigs
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        gigsTableView.dataSource = self
        gigsTableView.delegate = self
        gigsTableView.rowHeight = UITableView.automaticDimension
//        gigsTableView.estimatedRowHeight = 150
        gigsTableView.rowHeight = 250
        flnTestButton.tintColor = UIColor(red: 0.89, green: 0.25, blue: 0.25, alpha: 1.0)
        self.navigationItem.backButtonTitle = "Back"
        gigsTableView.allowsSelection = true
        print("Navigation Controller:", navigationController ?? "No navigation controller")

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = UIColor.clear
        return footerView
    }
    
    @objc func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.gigs.count
    }

    @objc(tableView:cellForRowAtIndexPath:) func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GigCardCell", for: indexPath) as? GigCardCell else {
            return UITableViewCell()
        }
        
        // Configure cell with Gig data
        let gig = gigs[indexPath.section]
        cell.configure(with: gig)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell selected at section \(indexPath.section)")
            
        let gig = gigs[indexPath.section]
        
        // Instantiate GigDetailsViewController
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let gigDetailsVC = storyboard.instantiateViewController(withIdentifier: "GigDescriptionViewController") as? GigDescriptionViewController {
            gigDetailsVC.gig = gig
            navigationController?.pushViewController(gigDetailsVC, animated: true)
        } else {
            print("Could not instantiate GigDescriptionViewController")
        }
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
