//
//  PreviewData.swift
//  Cashflow
//
//  Created by ZEQUN YU on 4/25/23.
//

import Foundation
import SwiftUI

var transactionPreviewData = Transaction(id: 1, account: "Wells Fargo Debit", date: "04/24/2023", amount: 19.9, category: "Entertainment", categoryId: 1, detail: "Apple Store", memo: "App in-purchase", type: "debit")

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
