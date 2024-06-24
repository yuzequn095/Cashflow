//
//  ExpenseViewModel.swift
//  CashFlowDev
//
//  Created by ZEQUN YU on 6/23/24.
//

import Foundation

class ExpenseViewModel: ObservableObject {
    @Published var expenses: [ExpenseItem] = [
        ExpenseItem(name: "Groceries", amount: 150, date: Date(), isExpense: true),
        ExpenseItem(name: "Salary", amount: 2000, date: Date(), isExpense: false),
        ExpenseItem(name: "Utilities", amount: 100, date: Date(), isExpense: true)
    ]

    var totalIncome: Double {
        expenses.filter { !$0.isExpense }.reduce(0) { $0 + $1.amount }
    }

    var totalExpenses: Double {
        expenses.filter { $0.isExpense }.reduce(0) { $0 + $1.amount }
    }

    var netIncome: Double {
        totalIncome - totalExpenses
    }
}
