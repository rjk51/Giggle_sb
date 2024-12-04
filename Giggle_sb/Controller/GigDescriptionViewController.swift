//
//  GigDescriptionViewController.swift
//  Giggle_sb
//
//  Created by rjk on 12/11/24.
//

import UIKit
import MapKit

class GigDescriptionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

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
    @IBOutlet weak var facilityConstraint: NSLayoutConstraint!
    @IBOutlet weak var point1: UIView!
    @IBOutlet weak var point2: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var requirementsConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerConstraint: NSLayoutConstraint!
    
    // Property to hold the gig data passed from HomeScreenViewController
    var gig: Gig?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requirementsTabelView.dataSource = self
        facilityTableView.dataSource = self
        point1.layer.cornerRadius = point1.frame.width / 2
        point2.layer.cornerRadius = point2.frame.width / 2
        
        // Update the UI with the gig data
        if let gig = gig {
            let address = gig.location.split(separator: ",").first.map(String.init) ?? ""
            gigTitleLabel.text = gig.title
            companyNameLabel.text = gig.companyName
            locationLabel.text = address
            experienceLabel.text = gig.experience
            typeLabel.text = gig.duration
            salaryLabel.text = "$\(gig.salary)"
            gigAvatarImageView.image = UIImage(named: gig.gigAvatar)
            gigAvatarImageView.layer.cornerRadius = gigAvatarImageView.frame.width / 2
            gigDescriptionLabel.text = gig.description
            qualificationLabel.text = gig.qualification
            jobTypeLabel.text = gig.approximity
            specLabel.text = gig.specialization
            salaryInfoLabel.text = gig.salary.isZero ? "Not Available" : "$\(gig.salary)"
            experienceInfoLabel.text = gig.experience
            positionLabel.text = gig.title
            addressLabel.text = gig.location
            postedAtLabel.text = relativeDateString(from: gig.postedAt)
            requirementsTabelView.layoutIfNeeded()
            requirementsConstraint.constant = requirementsTabelView.contentSize.height
            facilityTableView.layoutIfNeeded()
            facilityConstraint.constant = facilityTableView.contentSize.height
        }
    }
    // Function to calculate relative date string
    func relativeDateString(from date: Date) -> String {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let postedDate = calendar.startOfDay(for: date)
        
        let components = calendar.dateComponents([.day], from: postedDate, to: today)
        let dayDifference = components.day ?? 0
        
        switch dayDifference {
        case 0:
            return "Today"
        case 1:
            return "1 day ago"
        default:
            return "\(dayDifference) days ago"
        }
    }
    
    // MARK: - Table View Data Source Methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == requirementsTabelView {
            return gig?.requirements.count ?? 0
        } else if tableView == facilityTableView {
            return gig?.facilites.count ?? 0
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == requirementsTabelView {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "RequirementCell", for: indexPath) as? RequirementCell else {
                return UITableViewCell()
            }
            cell.requirementLabel.text = gig?.requirements[indexPath.row]
            return cell
        } else if tableView == facilityTableView {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FacilityCell", for: indexPath) as? FacilityCell else {
                return UITableViewCell()
            }
            cell.facilityLabel.text = gig?.facilites[indexPath.row]
            return cell
        }
        return UITableViewCell()
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
