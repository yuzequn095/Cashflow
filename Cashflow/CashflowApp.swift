//
//  CashflowApp.swift
//  Cashflow
//
//  Created by ZEQUN YU on 4/24/23.
//

import SwiftUI

@main
struct CashflowApp: App {
    // @StateObject - follow the life cycle of the app
    @StateObject var transactionListVM = TransactionListViewModel()
    
    var body: some Scene {
        // People can open more than one window from the group simultaneously
        // Every window in the group maintains independent state
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
