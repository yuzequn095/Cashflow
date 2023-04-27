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
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
