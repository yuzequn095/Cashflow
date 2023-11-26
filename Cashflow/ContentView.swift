//
//  ContentView.swift
//  Cashflow
//
//  Created by ZEQUN YU on 4/24/23.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Title
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // Notification Icon
                ToolbarItem{
                    // Navagate to Transcation Creation Page
                    NavigationLink(destination: TranscationCreationView()) {
                        Image(systemName: "plus")
                            .frame(width: 45, height: 45)
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(Color.icon, .primary)
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
        .accentColor(.primary)
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }.environmentObject(transactionListVM)
    }
}
