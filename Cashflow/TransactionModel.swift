//
//  TransactionModel.swift
//  Cashflow
//
//  Created by ZEQUN YU on 4/25/23.
//

import Foundation

struct Transaction: Identifiable, Decodable {
    /*
    let id: Int
    let account: String
    let date: String
    let amount: Double
    let category: String
    let categoryId: Int
    let detail: String
    let memo: String
    let type: TransactionType.RawValue
    */
    
    let id: Int
    let date: String
    let institution: String
    let account: String
    var merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    var categoryId: Int
    var category: String
    let isPending: Bool
    var isTransfer: Bool
    var isExpense: Bool
    var isEdited: Bool
    
    var dateParsed: Date {
        date.dateParsed()
    }
    
    var signedAmount: Double {
        return type == TransactionType.credit.rawValue ? amount : -amount
    }
}

enum TransactionType: String {
    case debit = "debit"
    case credit = "credit"
}
