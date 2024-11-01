//
//  BasicDetailsViewController.swift
//  Giggle_sb
//
//  Created by rjk on 01/11/24.
//

import UIKit

class BasicDetailsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    private let datePicker = UIDatePicker()
    private let genderPicker = UIPickerView() // Picker for gender
    private let genders = ["Male", "Female", "Other"] // Gender options
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupDatePicker()
        setupGenderPicker()
    }
    
    private func setupDatePicker() {
        // Set the date picker mode to date
        datePicker.datePickerMode = .date
        
        // Add target for date selection
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        
        // Set the date picker as the input view for the dateTextField
        dateTextField.inputView = datePicker
        
        datePicker.preferredDatePickerStyle = .wheels
        
        // Optional: Add a toolbar with a done button
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: false)
        
        // Set the toolbar as the input accessory view
        dateTextField.inputAccessoryView = toolbar
    }
    
    private func setupGenderPicker() {
        genderPicker.delegate = self
        genderPicker.dataSource = self
        genderTextField.inputView = genderPicker
        
        // Add toolbar for gender picker
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressedGender))
        toolbar.setItems([doneButton], animated: false)
        genderTextField.inputAccessoryView = toolbar
    }

    @objc private func dateChanged(_ sender: UIDatePicker) {
        // Format the date to a string and set it to the dateTextField
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium // You can customize the date style
        dateTextField.text = dateFormatter.string(from: sender.date)
    }

    @objc private func donePressed() {
        // Dismiss the date picker
        dateTextField.resignFirstResponder()
    }
    
    @objc private func donePressedGender() {
        genderTextField.resignFirstResponder()
    }
    
    // MARK: - UIPickerView Data Source

    @objc(numberOfComponentsInPickerView:) func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // One column for gender selection
    }

    @objc func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genders.count // Number of options
    }

    // MARK: - UIPickerView Delegate

    @objc func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genders[row] // Provide the option title
    }

    @objc func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genderTextField.text = genders[row] // Update the text field with the selected gender
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToLocationDetailsScreen", sender: self)
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
