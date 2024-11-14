import Foundation

class UserManager {
    
    private let userDefaults = UserDefaults.standard
    private let usersKey = "registeredUsers"

    func registerUser(email: String, password: String) -> Bool {
        var usersArray = getAllUsers()
        
        if usersArray.contains(where: { $0.email == email }) {
            return false
        }
        
        let newUser = UserReg(email: email, password: password)
        usersArray.append(newUser)
        
        saveAllUsers(usersArray)
        
        return true
    }
    
    private func getAllUsers() -> [UserReg] {
        guard let usersData = userDefaults.array(forKey: usersKey) as? [[String: String]] else {
            return []
        }
        
        return usersData.compactMap { dict in
            guard let email = dict["email"], let password = dict["password"] else {
                return nil
            }
            return UserReg(email: email, password: password)
        }
    }
    
    private func saveAllUsers(_ users: [UserReg]) {
        let usersData = users.map { ["email": $0.email, "password": $0.password] }
        userDefaults.set(usersData, forKey: usersKey)
    }

    func loginUser(email: String, password: String) -> Bool {
        let usersArray = getAllUsers()
        
        return usersArray.contains { $0.email == email && $0.password == password }
    }
    
    func logoutUser() {
        userDefaults.removeObject(forKey: usersKey)
    }
}
