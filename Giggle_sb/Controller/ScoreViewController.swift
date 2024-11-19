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
    @IBOutlet weak var finishButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var literacyNumeracyScore: Double
        var overallScore: Double

        // Do any additional setup after loading the view.
        retestButton.layer.borderWidth = 1
        retestButton.layer.borderColor = CGColor(red: 0.902, green: 0.224, blue: 0.275, alpha: 1)
        fluencyScoreLabel.text = "75.0%"
        literacyNumeracyScore = (UserDefaults.standard.double(forKey: "litercyScore") + UserDefaults.standard.double(forKey: "numeracyScore")) / 2
        print(literacyNumeracyScore)
        literacyNumeracyScoreLabel.text = "\(literacyNumeracyScore)%"
        overallScore = (literacyNumeracyScore + 75) / 2
        if overallScore >= 90 {
            gradeLabel.text = "A"
        } else if overallScore >= 80 {
            gradeLabel.text = "B"
        } else if overallScore >= 70 {
            gradeLabel.text = "C"
        } else if overallScore >= 60 {
            gradeLabel.text = "D"
        } else {
            gradeLabel.text = "F"
        }
        UserDefaults.standard.set(gradeLabel.text, forKey: "grade")
        
    }
    
    @IBAction func retestButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "goBackToFluency", sender: self)
    }
    
    @IBAction func finishButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "goHome", sender: self)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
        let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeScreenNewViewController") as! HomeScreenNewViewController
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
