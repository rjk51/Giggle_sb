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
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    let userManager = UserManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.layer.cornerRadius = 10
        passwordTextField.layer.cornerRadius = 10
        confirmPasswordTextField.layer.cornerRadius = 10
        signUpButton.tintColor = UIColor(red: 0.89, green: 0.25, blue: 0.25, alpha: 1.0)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        guard let email = emailTextField.text, !email.isEmpty,
        let password = passwordTextField.text, !password.isEmpty,
        let confirmPassword = confirmPasswordTextField.text, !confirmPassword.isEmpty else {
            displayAlert(message: "Please fill in all fields.")
            return
        }
        
        // Email validation
        if !isValidEmail(email) {
            displayAlert(message: "Please enter a valid email address.")
            return
        }
        
        // Password validation
        if !isValidPassword(password) {
            displayAlert(message: "Password must be at least 8 characters, with at least one uppercase letter, one lowercase letter, and one number.")
            return
        }
        
        // Confirm password validation
        if password != confirmPassword {
            displayAlert(message: "Passwords do not match.")
            return
        }
        
        // Registration
        let registrationSuccess = userManager.registerUser(email: email, password: password)
        
        if registrationSuccess {
            displayAlert(message: "Registration successful!") {
                self.performSegue(withIdentifier: "goToUserDetailsScreen", sender: self)
            }
        } else {
            displayAlert(message: "User already exists. Please try logging in.")
        }
    }
    
    @IBAction func toggleConfirmPasswordVisibility(_ sender: UIButton) {
        confirmPasswordTextField.isSecureTextEntry.toggle()

        let buttonImage = confirmPasswordTextField.isSecureTextEntry ? "eye.slash.fill" : "eye.fill"
        sender.setImage(UIImage(systemName: buttonImage), for: .normal)

    }
    @IBAction func togglePasswordVisibility(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry.toggle()

        let buttonImage = passwordTextField.isSecureTextEntry ? "eye.slash.fill" : "eye.fill"
        sender.setImage(UIImage(systemName: buttonImage), for: .normal)

    }
    // Email validation function
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    
    // Password validation function
    private func isValidPassword(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
    }
    
    // Display alert function
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
