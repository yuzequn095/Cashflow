//
//  CashFlowDevApp.swift
//  CashFlowDev
//
//  Created by ZEQUN YU on 4/21/24.
//

import SwiftUI

@main
struct CashFlowDevApp: App {
    @StateObject private var authService = AuthenticationService()
    
    var body: some Scene {
        WindowGroup {
            if authService.isUserLoggedIn {
                MainView()
                    .environmentObject(authService) // Pass authService to MainView
            }
            else {
                AuthenticationView()
                    .environmentObject(authService) // Pass authService to AuthenticationView
            }
        }
    }
}
