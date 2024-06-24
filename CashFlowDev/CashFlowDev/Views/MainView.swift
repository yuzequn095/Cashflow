//
//  MainView.swift
//  CashFlowDev
//
//  Created by ZEQUN YU on 4/21/24.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = ExpenseViewModel()

    var body: some View {
        NavigationView {
            List {
                // 1. Graph Placeholder (assuming a simple text for demonstration)
                Text("Net: \(viewModel.netIncome, specifier: "%.2f")")
                    .font(.title)
                    .foregroundColor(viewModel.netIncome >= 0 ? .green : .red)

                // 2. Total Income
                HStack {
                    HStack {
                        Text("Total Income:")
                        Spacer()
                        Text("\(viewModel.totalIncome, specifier: "%.2f")")
                            .foregroundColor(.green)
                    }
                    // 3. Total Expenses
                    HStack {
                        Text("Total Expenses:")
                        Spacer()
                        Text("\(viewModel.totalExpenses, specifier: "%.2f")")
                            .foregroundColor(.red)
                    }
                }

                // 4. List of Transactions
                ForEach(viewModel.expenses) { expense in
                    HStack {
                        Text(expense.name)
                        Spacer()
                        Text("\(expense.amount, specifier: "%.2f")")
                            .foregroundColor(expense.isExpense ? .red : .green)
                    }
                }
            }
            .navigationTitle("Expense Tracker")
        }
    }
}

#Preview {
    MainView()
}
