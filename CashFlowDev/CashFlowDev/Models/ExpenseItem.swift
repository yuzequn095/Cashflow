//
//  ExpenseItem.swift
//  CashFlowDev
//
//  Created by ZEQUN YU on 4/21/24.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    var date: Date
    var amount: Double
    var category: String
    var type: String
    var detail: String
}
