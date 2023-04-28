//
//  TransactionListViewModel.swift
//  Cashflow
//
//  Created by ZEQUN YU on 4/26/23.
//

import Foundation
import Combine
import Collections

typealias TransactionGroup = OrderedDictionary<String, [Transaction]>
typealias TransactionPrefixSum = [(String, Double)]

final class TransactionListViewModel: ObservableObject { // Subscribe and refresh as content
    // @Published - send notification to subscriber when data changes
    @Published var transactions: [Transaction] = [] // Empty array as the default value
    
    private var cancellables = Set<AnyCancellable>() // An activity or action supports cancellation
    
    init() {
        // getTransactions()
        transactions = transactionListPreviewData
    }
    
    func getTransactions() {
        // guard - early return
        var cor_url: String = "https://designcode.io/data/transactions.json"
        var inc_url: String = "random.url"
        guard let url = URL(string: inc_url) else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    dump(response)  // Better print format for object
                    throw URLError(.badServerResponse)
                }
                
                return data
            }
            .decode(type: [Transaction].self, decoder: JSONDecoder()) // Convert JSON data to an array of transaction
            .receive(on: DispatchQueue.main) // Switch back to the main thread -> update UI
            .sink{ completion in // handle data task result
                switch  completion {
                case .failure(let error):
                    print("Error fetching transactions: ", error.localizedDescription)
                case .finished:
                    print("Finished fetching transactions")
                }
            } receiveValue: { [weak self] result in // weak self - release memory when necessary
                self?.transactions = result
                dump("fetching data")
                dump(self?.transactions)
            }
            .store(in: &cancellables)
    }
    
    func groupTransactionsByMonth() -> TransactionGroup {
        guard !transactions.isEmpty else { return [:] }
        
        let groupedTransactions = TransactionGroup(grouping: transactions) { $0.month }
        
        return groupedTransactions
    }
    
    func accumulateTransactions() -> TransactionPrefixSum {
        // print("accumulateTransactions")
        guard !transactions.isEmpty else { return [] }
        
        let today = "12/31/2022".dateParsed() // Date() // ??? why one year less
        // print("today: ", today)
        let dateInterval = Calendar.current.dateInterval(of: .month, for: today)!
        
        // print("dateInterval: ", dateInterval)
        
        var sum: Double = .zero
        var cumulativeSum = TransactionPrefixSum()
        
        for date in stride(from: dateInterval.start, to: today, by: 60 * 60 * 24) {
            let dailyExpenses = transactions.filter { $0.dateParsed == date && $0.isExpense }
            let dailyTotal = dailyExpenses.reduce(0) { $0 - $1.signedAmount }
            
            sum += dailyTotal
            sum = sum.roundedTo2Digits()
            
            cumulativeSum.append((date.formatted(), sum))
            
            // print(date.formatted(), "dailyTotal: ", dailyTotal, " sum: ", sum)
        }
        
        return cumulativeSum
    }
}
