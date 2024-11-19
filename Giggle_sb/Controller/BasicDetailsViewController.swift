import UIKit
import Popovers

class BasicDetailsViewController: UIViewController,  UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var genderButton: UIButton!
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
        setupAvatarImageView()
        progressView.setProgress(25/100, animated: true)
        
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
        phoneNumberTextField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
    }
    lazy var menu = Templates.UIKitMenu(sourceView: genderButton) {
        Templates.MenuButton(title: "Male") {
            self.genderButton.setTitle("Male", for: .normal)
        }
        Templates.MenuButton(title: "Female") {
            self.genderButton.setTitle("Female", for: .normal)
        }
        Templates.MenuButton(title: "Other") {
            self.genderButton.setTitle("Other", for: .normal)
        }
    } fadeLabel: { [weak self] fade in
        self?.genderButton.alpha = fade ? 0.5 : 1
    }
    
    @IBAction func genderButtonTapped(_ sender: UIButton) {
        if menu.isPresented {
            menu.dismiss()
        } else {
            menu.present()
        }
    }
    
    @objc func textFieldsDidChange() {
        nextButton.isEnabled = !nameTextField.text!.isEmpty &&
                               !dateTextField.text!.isEmpty &&
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
        datePicker.preferredDatePickerStyle = .compact
        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        dateTextField.inputView = datePicker

        // Toolbar with Done button for the date picker
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: false)
        dateTextField.inputAccessoryView = toolbar
    }

    @objc private func dateChanged() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateTextField.text = dateFormatter.string(from: datePicker.date)
    }

    @objc private func donePressed() {
        dateTextField.resignFirstResponder()
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        UserDefaults.standard.set(nameTextField.text, forKey: "userName")
            
        if let image = avatar.image {
            let imageData = image.pngData()
            UserDefaults.standard.set(imageData, forKey: "avatarImage")
        }
        performSegue(withIdentifier: "goToLocationDetailsScreen", sender: self)
    }
}
