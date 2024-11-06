//
//  HomeScreenViewController.swift
//  Giggle_sb
//
//  Created by rjk on 06/11/24.
//

import UIKit

class HomeScreenViewController: UIViewController {

    @IBOutlet weak var userProfile: UIImageView!
    @IBOutlet weak var flnTestButton: UIButton!
    @IBOutlet weak var gigCardView: UIView!
    @IBOutlet weak var gigAvatar: UIImageView!
    @IBOutlet weak var companyTileLabel: UILabel!
    @IBOutlet weak var saveGigButton: UIButton!
    @IBOutlet weak var gigTitleLabel: UILabel!
    @IBOutlet weak var gigLocationLabel: UILabel!
    @IBOutlet weak var gigExperienceLabel: UILabel!
    @IBOutlet weak var gigTypeLabel: UILabel!
    @IBOutlet weak var gigSalaryLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gigCardView.layer.borderWidth = 1
        gigCardView.layer.borderColor = CGColor(red: 0.647, green: 0.647, blue: 0.647, alpha: 1.0)
        gigCardView.layer.shadowOffset = CGSize(width: 0, height: 2)
        gigCardView.layer.shadowColor = CGColor(red: 0.373, green: 0.373, blue: 0.373, alpha: 0.6)
        gigCardView.layer.shadowOpacity = 7.2
        gigCardView.layer.shadowRadius = 2
        gigCardView.layer.masksToBounds = false
        gigCardView.layer.cornerRadius = 20
        
        configureGigCard(with: sampleGigs[0])
        

        // Do any additional setup after loading the view.
    }
    func configureGigCard(with gig: Gig) {
        gigTitleLabel.text = gig.title
        companyTileLabel.text = "\(gig.employerId)"
        gigLocationLabel.text = "\(gig.location)"
        gigExperienceLabel.text = "\(gig.experience)"
        gigTypeLabel.text = "\(gig.duration)"
        gigSalaryLabel.text = String(format: "$%.2f", gig.salary)

        // Example avatar image
        gigAvatar.image = UIImage(named: "placeholderAvatar") // Use an actual image asset here
        
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
