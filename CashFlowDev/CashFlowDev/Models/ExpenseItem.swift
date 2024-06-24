//
//  ExpenseItem.swift
//  CashFlowDev
//
//  Created by ZEQUN YU on 4/21/24.
//

import Foundation

struct ExpenseItem: Identifiable {
    var id = UUID()
    var name: String
    var amount: Double
    var date: Date
    var isExpense: Bool // True for expense, False for income
}
