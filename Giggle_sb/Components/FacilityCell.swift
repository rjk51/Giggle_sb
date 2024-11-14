//
//  FacilityCell.swift
//  Giggle_sb
//
//  Created by rjk on 15/11/24.
//

import UIKit

class FacilityCell: UITableViewCell {

    @IBOutlet weak var bulletView: UIView!
    @IBOutlet weak var facilityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Style the bullet view to be a circle
        bulletView.layer.cornerRadius = bulletView.frame.width / 2
    }

}
