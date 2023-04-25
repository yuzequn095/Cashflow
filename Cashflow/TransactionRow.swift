//
//  TransactionRow.swift
//  Cashflow
//
//  Created by ZEQUN YU on 4/25/23.
//

import SwiftUI

struct TransactionRow: View {
    // Decalre the variable
    var transaction: Transaction
    
    var body: some View {
        HStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 6) {
                // Transaction Detail
                Text(transaction.detail)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                // Transaction Category
                Text(transaction.category)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
                
                // Transaction Date
                Text(Date(), format: .dateTime.year().month().day())
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
        }
        .padding([.top, .bottom], 8)
    }
}

struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRow(transaction: transactionPreviewData)
        TransactionRow(transaction: transactionPreviewData)
    }
}
