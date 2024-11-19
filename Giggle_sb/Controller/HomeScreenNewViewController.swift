//
//  HomeScreenViewController.swift
//  Giggle_sb
//
//  Created by rjk on 06/11/24.
//

import UIKit

class HomeScreenNewViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var userProfile: UIImageView!
    @IBOutlet weak var scoreButton: UIButton!
    @IBOutlet weak var gigsTableView: UITableView!
    @IBOutlet weak var seeAllButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var flnView: UIView!
    
    var gigs: [Gig] = sampleGigs
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        flnView.layer.borderWidth = 1
        flnView.layer.borderColor = CGColor(red: 0.647, green: 0.647, blue: 0.647, alpha: 1)
        flnView.layer.cornerRadius = 20
        flnView.layer.masksToBounds = true
        flnView.layer.shadowColor = UIColor.white.cgColor
        flnView.layer.shadowOpacity = 0.2
        flnView.layer.shadowRadius = 10
        
        gigsTableView.dataSource = self
        gigsTableView.delegate = self
        gigsTableView.rowHeight = UITableView.automaticDimension
        gigsTableView.rowHeight = 250
        scoreButton.tintColor = UIColor(red: 0.89, green: 0.25, blue: 0.25, alpha: 1.0)
        scoreButton.titleLabel?.font = UIFont.systemFont(ofSize: 11, weight: .bold)
        self.navigationItem.backButtonTitle = "Back"
        gigsTableView.allowsSelection = true
        print("Navigation Controller:", navigationController ?? "No navigation controller")
        scoreLabel.text = UserDefaults.standard.string(forKey: "grade")

        if let userName = UserDefaults.standard.string(forKey: "userName") {
            nameLabel.text = userName
        }
        
        if let imageData = UserDefaults.standard.data(forKey: "avatarImage") {
            userProfile.image = UIImage(data: imageData)
        }
        userProfile.layer.cornerRadius = userProfile.frame.width / 2
        userProfile.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func scoreButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil) // Replace "Main" if your storyboard name is different
        if let scoreVC = storyboard.instantiateViewController(withIdentifier: "ScoreViewController") as? ScoreViewController {
            navigationController?.pushViewController(scoreVC, animated: true)
        } else {
            print("Could not instantiate ScoreViewController")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = UIColor.clear
        return footerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.gigs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
