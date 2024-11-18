//
//  ScoreViewController.swift
//  Giggle_sb
//
//  Created by rjk on 18/11/24.
//

import UIKit

class ScoreViewController: UIViewController {

    @IBOutlet weak var fluencyScoreLabel: UILabel!
    @IBOutlet weak var literacyNumeracyScoreLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet weak var retestButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        retestButton.layer.borderWidth = 1
        retestButton.layer.borderColor = CGColor(red: 0.902, green: 0.224, blue: 0.275, alpha: 1)
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
