//
//  TranscationCreationView.swift
//  Cashflow
//
//  Created by ZEQUN YU on 11/25/23.
//

import SwiftUI

struct TranscationCreationView: View {
    
    // State - A property wrapper type that can read and write a value managed by SwiftUI
    @State private var amount: String = ""
    @State private var date = Date()
    @State private var category: String = ""
    @State private var detail: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                // Use Section instances to organize content into seperate sections
                Section {
                    TextField("Amount", text: $amount)
                        .keyboardType(.decimalPad)
                    DatePicker("Date", selection: $date, displayedComponents: .date)
                    TextField("Category", text: $category)
                    TextField("Detail", text: $detail)
                }
            }
            .navigationTitle("New Transcation")
        }
    }
}

struct TransactionCreation_Previews: PreviewProvider {
    static var previews: some View {
        TranscationCreationView()
    }
}
