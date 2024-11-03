//
//  SkillsViewController.swift
//  Giggle_sb
//
//  Created by rjk on 02/11/24.
//

import UIKit

class SkillsViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate,  UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var skillsTextField: UITextField!
    @IBOutlet weak var chipsContainerView: UIView!
    @IBOutlet weak var suggestCollectionView: UICollectionView!
    var chipsStackView: UIStackView!
    var suggestedSkills = ["Swift", "Objective-C", "Python", "Java", "SQL", "JavaScript", "Flutter", "React", "Dart"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the text field delegate
        skillsTextField.delegate = self
        skillsTextField.placeholder = "Enter a skill and press Enter"
        
        // Initialize the stack view for chips
        setupChipsStackView()
        
        // Set up collection view
        suggestCollectionView.delegate = self
        suggestCollectionView.dataSource = self
        suggestCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "SkillCell")
    }
    
    func setupChipsStackView() {
        // Initialize the stack view and add it to the container
        chipsStackView = UIStackView()
        chipsStackView.axis = .horizontal
        chipsStackView.spacing = 8
        chipsStackView.alignment = .center
        chipsStackView.distribution = .fillProportionally
        chipsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add stack view to container view
        chipsContainerView.addSubview(chipsStackView)
        
        // Set constraints for stack view
        NSLayoutConstraint.activate([
            chipsStackView.leadingAnchor.constraint(equalTo: chipsContainerView.leadingAnchor, constant: 8),
            chipsStackView.trailingAnchor.constraint(equalTo: chipsContainerView.trailingAnchor, constant: -8),
            chipsStackView.topAnchor.constraint(equalTo: chipsContainerView.topAnchor, constant: 8),
            chipsStackView.bottomAnchor.constraint(equalTo: chipsContainerView.bottomAnchor, constant: -8)
        ])
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text, !text.isEmpty {
            addChip(text: text)
            textField.text = "" // Clear the text field
        }
        return true
    }

    func addChip(text: String) {
        // Create a chip label
        let chipLabel = UILabel()
        chipLabel.text = text
        chipLabel.backgroundColor = .systemYellow
        chipLabel.textColor = .black
        chipLabel.layer.cornerRadius = 15
        chipLabel.clipsToBounds = true
        chipLabel.textAlignment = .center
        
        // Set padding inside the chip
        chipLabel.translatesAutoresizingMaskIntoConstraints = false
        chipLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        // Width constraint to avoid compression
        chipLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
        chipLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

        // Adding the chip to the stack view
        chipsStackView.addArrangedSubview(chipLabel)
        
        // Tap gesture for removing chip
        chipLabel.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(removeChip(_:)))
        chipLabel.addGestureRecognizer(tapGesture)
    }
    
    @objc func removeChip(_ sender: UITapGestureRecognizer) {
        if let chipLabel = sender.view as? UILabel {
            chipsStackView.removeArrangedSubview(chipLabel)
            chipLabel.removeFromSuperview()
        }
    }
    
    // MARK: - UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return suggestedSkills.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SkillCell", for: indexPath)
        
        // Customize cell for skill button
        let skillButton = UIButton(type: .system)
        skillButton.setTitle(suggestedSkills[indexPath.item], for: .normal)
        skillButton.setTitleColor(.white, for: .normal)
        skillButton.backgroundColor = .systemBlue
        skillButton.layer.cornerRadius = 6
        skillButton.clipsToBounds = true
        skillButton.addTarget(self, action: #selector(skillButtonTapped(_:)), for: .touchUpInside)
        
        // Add padding inside the button
        skillButton.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        
        // Add button to cell
        cell.contentView.addSubview(skillButton)
        skillButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            skillButton.centerXAnchor.constraint(equalTo: cell.contentView.centerXAnchor),
            skillButton.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor),
            skillButton.widthAnchor.constraint(equalToConstant: 120), // Fixed width
            skillButton.heightAnchor.constraint(equalToConstant: 40) // Fixed height
        ])
        
        return cell
    }
    
    // Handle button tap
    @objc func skillButtonTapped(_ sender: UIButton) {
        if let skill = sender.titleLabel?.text {
            addChip(text: skill)
        }
    }

    // MARK: - UICollectionViewDelegateFlowLayout
    let numberOfCellsPerRow: CGFloat = 3

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Calculate the total width of the collection view
        let collectionViewWidth = collectionView.bounds.width
        
        // Define the spacing between cells
        let spacing: CGFloat = 8.0
        let totalSpacing = (numberOfCellsPerRow - 1) * spacing
        
        // Calculate the width of each cell
        let cellWidth = (collectionViewWidth - totalSpacing) / numberOfCellsPerRow
        let cellHeight: CGFloat = 50.0 // Set a fixed height for the cells
        
        return CGSize(width: cellWidth, height: cellHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8 // Space between rows
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8 // Space between cells in the same row
    }
}
