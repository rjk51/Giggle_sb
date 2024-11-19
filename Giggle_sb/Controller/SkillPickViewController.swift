//
//  SkillPickViewController.swift
//  Giggle_sb
//
//  Created by user@91 on 15/11/24.
//

import UIKit

class SkillPickViewController: UIViewController {

    @IBOutlet weak var skill1: UIButton!
    @IBOutlet weak var skill2: UIButton!
    @IBOutlet weak var skill3: UIButton!
    @IBOutlet weak var customSkillTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        customSkillTextField.attributedPlaceholder = NSAttributedString(string: "Any Other Skills", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        customSkillTextField.layer.cornerRadius = 19
        customSkillTextField.clipsToBounds = true
        skill1.tintColor = UIColor(red: 0.255, green: 0.255, blue: 0.255, alpha: 1)
        skill2.tintColor = UIColor(red: 0.255, green: 0.255, blue: 0.255, alpha: 1)
        skill3.tintColor = UIColor(red: 0.255, green: 0.255, blue: 0.255, alpha: 1)
        nextButton.tintColor = UIColor(red: 0.902, green: 0.224, blue: 0.275, alpha: 1)
        // Do any additional setup after loading the view.
    }
    @IBAction func skillButtonTapped(_ sender: UIButton) {
        // Toggle button background color
        if sender.tintColor == UIColor(red: 0.902, green: 0.224, blue: 0.275, alpha: 1){
            sender.tintColor = UIColor(red: 0.255, green: 0.255, blue: 0.255, alpha: 1)
        } else {
            sender.tintColor = UIColor(red: 0.902, green: 0.224, blue: 0.275, alpha: 1)
        }
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "goToFluency", sender: self)
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
