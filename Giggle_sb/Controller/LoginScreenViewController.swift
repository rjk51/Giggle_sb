//
//  LoginScreenViewController.swift
//  Giggle_sb
//
//  Created by rjk on 29/10/24.
//

import UIKit

class LoginScreenViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgotPassButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    let userManager = UserManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.tintColor = UIColor(red: 0.89, green: 0.25, blue: 0.25, alpha: 1.0)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        // Retrieve user input from text fields
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            displayAlert(message: "Please enter both email and password.")
            return
        }
        
        let loginSuccess = userManager.loginUser(email: email, password: password)
        
        if loginSuccess {
            performSegue(withIdentifier: "HomeScreenSegue", sender: self)
        } else {
            displayAlert(message: "Invalid email or password.")
        }
    }
    
    @IBAction func togglePasswordVisibility(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry.toggle()
        let buttonImage = passwordTextField.isSecureTextEntry ? "eye.slash.fill" : "eye.fill"
        sender.setImage(UIImage(systemName: buttonImage), for: .normal)

    }
    private func displayAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func navigateToRegisterPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToRegisterScreen", sender: self)
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
