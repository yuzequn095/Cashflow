//
//  AuthenticationService.swift
//  CashFlowDev
//
//  Created by ZEQUN YU on 6/23/24.
//

import Foundation

class AuthenticationService: ObservableObject {
    @Published var isUserLoggedIn: Bool = false

    init() {
        // Here you might check some persistent storage to see if the user's credentials are stored
        // For example, checking UserDefaults or a secure token in Keychain (for simplicity, this is just hardcoded)
        self.isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
    }

    func logIn() {
        // Implement login functionality
        UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
        self.isUserLoggedIn = true
    }

    func logOut() {
        // Implement logout functionality
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
        self.isUserLoggedIn = false
    }
}
