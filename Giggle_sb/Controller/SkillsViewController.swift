//
//  SkillsViewController.swift
//  Giggle_sb
//
//  Created by rjk on 02/11/24.
//

import UIKit

class SkillsViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var skillsTextField: UITextField!
    @IBOutlet weak var chipsContainerView: UIView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var suggestedSkillsContainerView: UIView!
    @IBOutlet weak var finishButton: UIButton!
    var chipsStackView: UIStackView!
    var suggestedSkills = ["UI/UX", "Designing", "Writing", "Programming", "Accounting", "Finance", "Management", "Fluent", "Scripting"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        finishButton.tintColor = UIColor(red: 0.89, green: 0.25, blue: 0.25, alpha: 1.0)
        progressView.setProgress(1.0, animated: true)
        
        // Set up the text field delegate
        skillsTextField.delegate = self
        skillsTextField.placeholder = "Enter a skill and press Enter"
        
        // Initialize the stack view for chips
        setupChipsStackView()
        
        // Set up the suggested skills buttons
        setupSuggestedSkillsButtons()
    }
    
    func setupChipsStackView() {
        chipsStackView = UIStackView()
        chipsStackView.axis = .horizontal
        chipsStackView.spacing = 8
        chipsStackView.alignment = .center
        chipsStackView.distribution = .fillProportionally
        chipsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        chipsContainerView.addSubview(chipsStackView)
        
        NSLayoutConstraint.activate([
            chipsStackView.leadingAnchor.constraint(equalTo: chipsContainerView.leadingAnchor, constant: 8),
            chipsStackView.trailingAnchor.constraint(equalTo: chipsContainerView.trailingAnchor, constant: -8),
            chipsStackView.topAnchor.constraint(equalTo: chipsContainerView.topAnchor, constant: 8),
            chipsStackView.bottomAnchor.constraint(equalTo: chipsContainerView.bottomAnchor, constant: -8)
        ])
    }
    
    func setupSuggestedSkillsButtons() {
        // Create a vertical stack view to hold rows
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 8
        verticalStackView.alignment = .fill
        verticalStackView.distribution = .fillEqually
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        suggestedSkillsContainerView.addSubview(verticalStackView)
        
        // Add rows of buttons
        let buttonsPerRow = 3
        for i in 0..<suggestedSkills.count {
            if i % buttonsPerRow == 0 {
                // Create a new horizontal row stack view every 3 items
                let horizontalStackView = UIStackView()
                horizontalStackView.axis = .horizontal
                horizontalStackView.spacing = 8
                horizontalStackView.alignment = .fill
                horizontalStackView.distribution = .fillEqually
                
                // Add the row to the vertical stack view
                verticalStackView.addArrangedSubview(horizontalStackView)
            }
            
            // Add button to the current row stack view
            let button = createSkillButton(title: suggestedSkills[i])
            if let rowStackView = verticalStackView.arrangedSubviews.last as? UIStackView {
                rowStackView.addArrangedSubview(button)
            }
        }
        
        // Set up constraints for vertical stack view
        NSLayoutConstraint.activate([
            verticalStackView.leadingAnchor.constraint(equalTo: suggestedSkillsContainerView.leadingAnchor, constant: 8),
            verticalStackView.trailingAnchor.constraint(equalTo: suggestedSkillsContainerView.trailingAnchor, constant: -8),
            verticalStackView.topAnchor.constraint(equalTo: suggestedSkillsContainerView.topAnchor, constant: 8),
            verticalStackView.bottomAnchor.constraint(equalTo: suggestedSkillsContainerView.bottomAnchor, constant: -8)
        ])
    }

    func createSkillButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(red: 0.976, green: 0.78, blue: 0.31, alpha: 1.0)
        button.layer.cornerRadius = 6
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(skillButtonTapped(_:)), for: .touchUpInside)
        return button
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text, !text.isEmpty {
            addChip(text: text)
            textField.text = "" // Clear the text field
        }
        return true
    }

    func addChip(text: String) {
        let chipLabel = UILabel()
        chipLabel.text = text
        chipLabel.backgroundColor = .systemYellow
        chipLabel.textColor = .black
        chipLabel.layer.cornerRadius = 15
        chipLabel.clipsToBounds = true
        chipLabel.textAlignment = .center
        
        chipLabel.translatesAutoresizingMaskIntoConstraints = false
        chipLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        chipLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
        chipLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

        chipsStackView.addArrangedSubview(chipLabel)
        
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

    @objc func skillButtonTapped(_ sender: UIButton) {
        if let skill = sender.titleLabel?.text {
            addChip(text: skill)
        }
    }
    @IBAction func finishButtonTapped(_ sender: UIButton) {
//        performSegue(withIdentifier: "goToHomeScreen", sender: self)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
        let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
        let searchVC = storyboard.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        let notificationsVC = storyboard.instantiateViewController(withIdentifier: "NotificationsViewController") as! NotificationsViewController

        // Embed each view controller in a navigation controller
        let homeNavController = UINavigationController(rootViewController: homeVC)
        homeNavController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)

        let searchNavController = UINavigationController(rootViewController: searchVC)
        searchNavController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)

        let notificationsNavController = UINavigationController(rootViewController: notificationsVC)
        notificationsNavController.tabBarItem = UITabBarItem(title: "Notifications", image: UIImage(systemName: "bell.badge.fill"), tag: 2)

        // Create tab bar controller and add navigation controllers
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [homeNavController, searchNavController, notificationsNavController]
        tabBarController.tabBar.backgroundColor = .black
        tabBarController.tabBar.tintColor = .red
        tabBarController.tabBar.unselectedItemTintColor = .white

        // Transition to the tab bar controller
        if let windowScene = view.window?.windowScene {
            for window in windowScene.windows {
                if window.isKeyWindow {
                    window.rootViewController = tabBarController
                    window.makeKeyAndVisible()
                }
            }
        }
    }
}
