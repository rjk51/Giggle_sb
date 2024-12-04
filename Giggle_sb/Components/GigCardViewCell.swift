//
//  GigCardViewCell.swift
//  Giggle_sb
//
//  Created by rjk on 15/11/24.
//

import UIKit

class GigCardViewCell: UITableViewCell {
    
    @IBOutlet weak var gigAvatar: UIImageView!
    @IBOutlet weak var companyTileLabel: UILabel!
    @IBOutlet weak var gigTitleLabel: UILabel!
    @IBOutlet weak var gigLocationLabel: UILabel!
    @IBOutlet weak var gigExperienceLabel: UILabel!
    @IBOutlet weak var gigTypeLabel: UILabel!
    @IBOutlet weak var gigSalaryLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Apply styling to the container view
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = CGColor(red: 0.647, green: 0.647, blue: 0.647, alpha: 1.0)
        containerView.layer.cornerRadius = 20
        containerView.layer.masksToBounds = false

        // Add shadow
        containerView.layer.shadowColor = CGColor(red: 0.373, green: 0.373, blue: 0.373, alpha: 0.6)
        containerView.layer.shadowOpacity = 0.8
        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        containerView.layer.shadowRadius = 4
        let selectedView = UIView()
        selectedView.backgroundColor = UIColor(red: 0.125, green: 0.122, blue: 0.122, alpha: 1.0)
        self.selectedBackgroundView = selectedView
    }
    
    func configure(with gig: Gig) {
        // Set data for each UI component from the Gig model
        companyTileLabel.text = gig.companyName
        gigTitleLabel.text = gig.title
        gigLocationLabel.text = gig.location
        gigExperienceLabel.text = gig.experience
        gigTypeLabel.text = gig.approximity
        gigSalaryLabel.text = "₹\(gig.salary)"
        gigAvatar.image = UIImage(named: gig.gigAvatar)
        gigAvatar.layer.cornerRadius = gigAvatar.frame.width / 2
        gigAvatar.clipsToBounds = true
        // Configure gigAvatar and other UI elements if needed
//        gigCardView.layer.borderWidth = 1
//        gigCardView.layer.borderColor = CGColor(red: 0.647, green: 0.647, blue: 0.647, alpha: 1.0)
//        gigCardView.layer.shadowOffset = CGSize(width: 0, height: 2)
//        gigCardView.layer.shadowColor = CGColor(red: 0.373, green: 0.373, blue: 0.373, alpha: 0.6)
//        gigCardView.layer.shadowOpacity = 7.2
//        gigCardView.layer.shadowRadius = 2
//        gigCardView.layer.masksToBounds = false
//        gigCardView.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
