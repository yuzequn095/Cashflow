//
//  AuthenticationView.swift
//  CashFlowDev
//
//  Created by ZEQUN YU on 6/23/24.
//

import SwiftUI

struct AuthenticationView: View {
    @EnvironmentObject var authService: AuthenticationService

    var body: some View {
        VStack {
            Text("Welcome to Expense Tracker!")
            Button("Log In") {
                authService.logIn() // Updates the logIn state
            }
        }
    }
}

#Preview {
    AuthenticationView()
}
