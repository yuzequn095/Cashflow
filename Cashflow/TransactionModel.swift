//
//  TransactionModel.swift
//  Cashflow
//
//  Created by ZEQUN YU on 4/25/23.
//

import Foundation

struct Transaction: Identifiable {
    let id: Int
    let date: String
    let amount: Double
    let category: String
    let categoryId: Int
    let detail: String
    let memo: String
    let type: TransactionType.RawValue
}

enum TransactionType: String {
    case debit = "debit"
    case credit = "credit"
}
