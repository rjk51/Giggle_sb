import UIKit

class BasicDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    private let datePicker = UIDatePicker()
    private let genders = ["Male", "Female", "Other"]
    private var dropdownTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupDatePicker()
        setupGenderDropdown()
        
        // Add a tap gesture to dismiss the dropdown when tapping outside
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissDropdown))
        view.addGestureRecognizer(tapGesture)
    }
    
    private func setupDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        dateTextField.inputView = datePicker
        datePicker.preferredDatePickerStyle = .wheels
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: false)
        
        dateTextField.inputAccessoryView = toolbar
    }
    
    private func setupGenderDropdown() {
        // Create and configure the dropdown table view
        dropdownTableView = UITableView()
        dropdownTableView.delegate = self
        dropdownTableView.dataSource = self
        dropdownTableView.isHidden = true
        dropdownTableView.layer.borderWidth = 1
        dropdownTableView.layer.borderColor = UIColor.lightGray.cgColor
        dropdownTableView.layer.cornerRadius = 5
        
        // Register a basic cell type
        dropdownTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // Add the table view to the main view
        view.addSubview(dropdownTableView)
        
        // Set constraints for the dropdown table to appear below the genderTextField
        dropdownTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dropdownTableView.topAnchor.constraint(equalTo: genderTextField.bottomAnchor, constant: 5),
            dropdownTableView.leadingAnchor.constraint(equalTo: genderTextField.leadingAnchor),
            dropdownTableView.trailingAnchor.constraint(equalTo: genderTextField.trailingAnchor),
            dropdownTableView.heightAnchor.constraint(equalToConstant: CGFloat(genders.count * 44))  // 44 is the standard cell height
        ])
        
        // Add tap gesture recognizer to the genderTextField
        let genderTapGesture = UITapGestureRecognizer(target: self, action: #selector(toggleDropdown))
        genderTextField.addGestureRecognizer(genderTapGesture)
    }
    
    @objc private func dateChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateTextField.text = dateFormatter.string(from: sender.date)
    }

    @objc private func donePressed() {
        dateTextField.resignFirstResponder()
    }
    
    @objc private func toggleDropdown() {
        // Show or hide the dropdown
        dropdownTableView.isHidden.toggle()
    }

    @objc private func dismissDropdown() {
        // Dismiss the dropdown when tapping outside
        dropdownTableView.isHidden = true
    }

    // MARK: - UITableView Data Source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genders.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = genders[indexPath.row]
        return cell
    }

    // MARK: - UITableView Delegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Set the selected gender in the genderTextField and hide the dropdown
        genderTextField.text = genders[indexPath.row]
        dropdownTableView.isHidden = true
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToLocationDetailsScreen", sender: self)
    }
}
