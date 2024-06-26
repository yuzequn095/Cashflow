//
//  CashflowApp.swift
//  Cashflow
//
//  Created by ZEQUN YU on 4/24/23.
//

import SwiftUI
import FirebaseCore

// Firebase Initialization
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    // Use Firebase library to configure APIs
    FirebaseApp.configure()

    return true
  }
}

@main
struct CashflowApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    @State private var isUserLoggedIn = false; // set default login value as false
    
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        // People can open more than one window from the group simultaneously
        // Every window in the group maintains independent state
        WindowGroup {
//           ContentView()
//                .environmentObject(transactionListVM)
            if isUserLoggedIn {
                // Redirect logged in user to MainView
                MainView()
            } else {
                // LoginView
            }
        }
    }
}
