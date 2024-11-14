//
//  UserDetailViewController.swift
//  Giggle_sb
//
//  Created by user@91 on 29/10/24.
//

import UIKit

class UserDetailViewController: UIViewController {

    @IBOutlet weak var fillManually: UIButton!
    @IBOutlet weak var fillAutomatically: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        fillManually.tintColor = UIColor(red: 0.89, green: 0.25, blue: 0.25, alpha: 1.0)
        fillAutomatically.tintColor = UIColor(red: 0.89, green: 0.25, blue: 0.25, alpha: 1.0)

        // Do any additional setup after loading the view.
    }
    

    @IBAction func fillManuallyPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToBasicDetailsScreen", sender: self)
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
