//
//  EducationDetailsViewController.swift
//  Giggle_sb
//
//  Created by rjk on 30/10/24.
//

import UIKit

class EducationDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var currentlyPursuingTextField: UITextField!
    
    @IBOutlet weak var degreeTextField: UITextField!
    @IBOutlet weak var specializationTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var universityNameTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var currentlyPursuingLabel: UILabel!
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var specializationLabel: UILabel!
    @IBOutlet weak var completionYearLabel: UILabel!
    @IBOutlet weak var universityNameLabel: UILabel!
    
    var isCurrentlyPursuing = false
    var hasEnteredPursuingDetails = false
    var isYesButtonTapped = false
    var isNoButtonTapped = false
    
    var dropdownOptions = ["Undergraduate", "Postgraduate", "Diploma", "Certification"]
    var dropdownTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        currentlyPursuingLabel.isHidden = true
        currentlyPursuingTextField.isHidden = true
        degreeLabel.isHidden = true
        degreeTextField.isHidden = true
        specializationLabel.isHidden = true
        specializationTextField.isHidden = true
        completionYearLabel.isHidden = true
        yearTextField.isHidden = true
        universityNameLabel.isHidden = true
        universityNameTextField.isHidden = true
        
        currentlyPursuingTextField.delegate = self
        
        setupDropdownTableView()
    }
    
    @IBAction func yesButtonTapped(_ sender: UIButton) {
        isYesButtonTapped = true
        isNoButtonTapped = false
        isCurrentlyPursuing = true
        currentlyPursuingLabel.isHidden = false
        currentlyPursuingTextField.isHidden = false
        if(isYesButtonTapped == true){
            yesButton.layer.backgroundColor = CGColor(red: 230, green: 57, blue: 70, alpha: 1)
        }
    }
    @IBAction func noButtonTapped(_ sender: UIButton) {
        isYesButtonTapped = false
        isNoButtonTapped = true
        if(isNoButtonTapped == true){
            noButton.layer.backgroundColor = CGColor(red: 230, green: 57, blue: 70, alpha: 1)
        }
        isCurrentlyPursuing = false
        currentlyPursuingLabel.isHidden = true
        currentlyPursuingTextField.isHidden = true
        degreeLabel.isHidden = true
        degreeTextField.isHidden = true
        specializationLabel.isHidden = true
        specializationTextField.isHidden = true
        completionYearLabel.isHidden = true
        yearTextField.isHidden = true
        universityNameLabel.isHidden = true
        universityNameTextField.isHidden = true
        noButton.layer.backgroundColor = CGColor(red: 230, green: 57, blue: 70, alpha: 1)
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "goToSkillsScreen", sender: self)
    }
    func setupDropdownTableView() {
        dropdownTableView = UITableView()
        dropdownTableView.delegate = self
        dropdownTableView.dataSource = self
        dropdownTableView.isHidden = true
        dropdownTableView.layer.borderWidth = 1
        dropdownTableView.layer.borderColor = UIColor.lightGray.cgColor
        dropdownTableView.layer.cornerRadius = 5
        self.view.addSubview(dropdownTableView)
        
        // Register a basic cell for the table view
        dropdownTableView.register(UITableViewCell.self, forCellReuseIdentifier: "DropdownCell")
        
        // Set up the frame of the dropdown table view
        dropdownTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dropdownTableView.topAnchor.constraint(equalTo: currentlyPursuingTextField.bottomAnchor, constant: 5),
            dropdownTableView.leadingAnchor.constraint(equalTo: currentlyPursuingTextField.leadingAnchor),
            dropdownTableView.trailingAnchor.constraint(equalTo: currentlyPursuingTextField.trailingAnchor),
            dropdownTableView.heightAnchor.constraint(equalToConstant: 150) // Set a fixed height
        ])
    }
    @objc func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == currentlyPursuingTextField {
            dropdownTableView.isHidden = false
        }
    }
    
    @objc func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == currentlyPursuingTextField {
            hasEnteredPursuingDetails = true
            showRemainingFields()
            dropdownTableView.isHidden = true // Hide dropdown after selection
        }
    }
    func showRemainingFields() {
        if !isCurrentlyPursuing || hasEnteredPursuingDetails {
            degreeLabel.isHidden = false
            degreeTextField.isHidden = false
            specializationLabel.isHidden = false
            specializationTextField.isHidden = false
            completionYearLabel.isHidden = false
            yearTextField.isHidden = false
            universityNameLabel.isHidden = false
            universityNameTextField.isHidden = false
        }
    }
    
    // MARK: - UITableViewDataSource Methods
    @objc func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dropdownOptions.count
    }
    
    @objc(tableView:cellForRowAtIndexPath:) func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DropdownCell", for: indexPath)
        cell.textLabel?.text = dropdownOptions[indexPath.row]
        return cell
    }
    
    // MARK: - UITableViewDelegate Methods
    @objc(tableView:didSelectRowAtIndexPath:) func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentlyPursuingTextField.text = dropdownOptions[indexPath.row]
        dropdownTableView.isHidden = true // Hide dropdown after selection
        currentlyPursuingTextField.resignFirstResponder() // Dismiss keyboard if it's showing
        hasEnteredPursuingDetails = true
        showRemainingFields()
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
