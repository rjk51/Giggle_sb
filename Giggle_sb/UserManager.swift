import Foundation

class UserManager {
    
    private let userDefaults = UserDefaults.standard
    private let usersKey = "registeredUsers" // Key to store multiple users

    // Save the user data during registration
    func registerUser(email: String, password: String) -> Bool {
        // Retrieve all registered users
        var usersArray = getAllUsers()
        
        // Check if a user with the given email already exists
        if usersArray.contains(where: { $0.email == email }) {
            return false // User already exists
        }
        
        // Create a new user
        let newUser = UserReg(email: email, password: password)
        usersArray.append(newUser)
        
        // Save the updated users array back to UserDefaults
        saveAllUsers(usersArray)
        
        return true // Registration successful
    }
    
    // Retrieve all registered users
    private func getAllUsers() -> [UserReg] {
        // Get user dictionaries array from UserDefaults
        guard let usersData = userDefaults.array(forKey: usersKey) as? [[String: String]] else {
            return []
        }
        
        // Map dictionaries to UserReg objects
        return usersData.compactMap { dict in
            guard let email = dict["email"], let password = dict["password"] else {
                return nil
            }
            return UserReg(email: email, password: password)
        }
    }
    
    // Save all users to UserDefaults
    private func saveAllUsers(_ users: [UserReg]) {
        // Map UserReg objects to dictionaries
        let usersData = users.map { ["email": $0.email, "password": $0.password] }
        userDefaults.set(usersData, forKey: usersKey)
    }

    // Verify user login
    func loginUser(email: String, password: String) -> Bool {
        let usersArray = getAllUsers()
        
        // Check if the credentials match any registered user
        return usersArray.contains { $0.email == email && $0.password == password }
    }
    
    // Clear all user data (for logout or testing purposes)
    func logoutUser() {
        userDefaults.removeObject(forKey: usersKey)
    }
}
