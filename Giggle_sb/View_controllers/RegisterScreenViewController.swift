//
//  RegisterScreenViewController.swift
//  Giggle_sb
//
//  Created by rjk on 28/10/24.
//

import UIKit

class RegisterScreenViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var forgotPassButton: UIButton!
    @IBOutlet weak var navigateToLoginButton: UIButton!
    
    let userManager = UserManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        // Retrieve user input from text fields
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            displayAlert(message: "Please enter both email and password.")
            return
        }
        
        // Attempt to register the user
        let registrationSuccess = userManager.registerUser(email: email, password: password)
        
        if registrationSuccess {
            displayAlert(message: "Registration successful!") {
                self.performSegue(withIdentifier: "goToUserDetailsScreen", sender: self)
            }
        } else {
            displayAlert(message: "User already exists. Please try logging in.")
        }
    }
    
    @IBAction func togglePasswordVisibility(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry.toggle() // Toggle the secure text entry
            
        // Change the button's image based on the visibility state
        let buttonImage = passwordTextField.isSecureTextEntry ? "eye.slash.fill" : "eye.fill"
        sender.setImage(UIImage(systemName: buttonImage), for: .normal)

    }
    private func displayAlert(message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        })
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func navigateToLoginPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "GoToLoginScreen", sender: self)
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
