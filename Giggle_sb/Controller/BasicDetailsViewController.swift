import UIKit

class BasicDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    
    private let datePicker = UIDatePicker()
    private let genders = ["Male", "Female", "Other"]
    private var dropdownTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDatePicker()
        // Hide dropdown initially
        setupDropdownTableView()
        setupAvatarImageView()
        progressView.setProgress(25/100, animated: true)
        
        genderTextField.delegate = self
        
        // Set placeholder image
        avatar.image = UIImage(named: "Profile Avatar")
        
        // Make the avatar image view tappable
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(avatarTapped))
        avatar.isUserInteractionEnabled = true
        avatar.addGestureRecognizer(tapGesture)
        
        // Disable the next button initially
        nextButton.isEnabled = false
        // Add target to text fields to monitor changes
        nameTextField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        dateTextField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        genderTextField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        phoneNumberTextField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
    }
    @objc func textFieldsDidChange() {
        nextButton.isEnabled = !nameTextField.text!.isEmpty &&
                               !dateTextField.text!.isEmpty &&
                               !genderTextField.text!.isEmpty &&
                               !phoneNumberTextField.text!.isEmpty
    }
    func setupAvatarImageView() {
        avatar.layer.cornerRadius = avatar.frame.width / 2 // Make circular
        avatar.clipsToBounds = true                        // Ensure the image doesn't exceed the bounds
        avatar.layer.borderWidth = 2                       // Optional: Add a border
        avatar.layer.borderColor = UIColor.lightGray.cgColor // Border color
    }
    
    @objc func avatarTapped() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    // MARK: - UIImagePickerControllerDelegate Methods
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            avatar.image = selectedImage // Set selected image to avatar
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    private func setupDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        dateTextField.inputView = datePicker

        // Toolbar with Done button for the date picker
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: false)
        dateTextField.inputAccessoryView = toolbar
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
            dropdownTableView.topAnchor.constraint(equalTo: genderTextField.bottomAnchor, constant: 5),
            dropdownTableView.leadingAnchor.constraint(equalTo: genderTextField.leadingAnchor),
            dropdownTableView.trailingAnchor.constraint(equalTo: genderTextField.trailingAnchor),
            dropdownTableView.heightAnchor.constraint(equalToConstant: 100) // Set a fixed height
        ])
    }
    
    @objc private func dateChanged() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateTextField.text = dateFormatter.string(from: datePicker.date)
    }

    @objc private func donePressed() {
        dateTextField.resignFirstResponder()
    }
    // MARK: - UITextFieldDelegate Methods
    @objc func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == genderTextField {
            dropdownTableView.isHidden = false
        }
    }
    
    @objc func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == genderTextField {
            dropdownTableView.isHidden = true
        }
    }
    
    // MARK: - UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DropdownCell", for: indexPath)
        cell.textLabel?.text = genders[indexPath.row]
        return cell
    }
    
    // MARK: - UITableViewDelegate Methods
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        genderTextField.text = genders[indexPath.row]
        dropdownTableView.isHidden = true
        genderTextField.resignFirstResponder() // Dismiss keyboard if it’s showing
    }

    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToLocationDetailsScreen", sender: self)
    }
}
