//
//  GigDescriptionViewController.swift
//  Giggle_sb
//
//  Created by rjk on 12/11/24.
//

import UIKit
import MapKit

class GigDescriptionViewController: UIViewController {

    // Outlets for UI components to display gig details
    @IBOutlet weak var gigTitleLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var experienceLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var salaryLabel: UILabel!
    @IBOutlet weak var gigAvatarImageView: UIImageView!
    @IBOutlet weak var postedAtLabel: UILabel!
    @IBOutlet weak var gigDescriptionLabel: UILabel!
    @IBOutlet weak var requirementsTabelView: UITableView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var addressMap: MKMapView!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var qualificationLabel: UILabel!
    @IBOutlet weak var experienceInfoLabel: UILabel!
    @IBOutlet weak var jobTypeLabel: UILabel!
    @IBOutlet weak var specLabel: UILabel!
    @IBOutlet weak var salaryInfoLabel: UILabel!
    @IBOutlet weak var facilityTableView: UITableView!
    
    // Property to hold the gig data passed from HomeScreenViewController
    var gig: Gig?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Update the UI with the gig data
        if let gig = gig {
            gigTitleLabel.text = gig.title
            companyNameLabel.text = gig.companyName
            locationLabel.text = gig.location
            experienceLabel.text = gig.experience
            typeLabel.text = gig.duration
            salaryLabel.text = "$\(gig.salary)"
//            gigAvatarImageView.image = gig.gigAvatar // Assumes gigAvatar is of type UIImage
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
