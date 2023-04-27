//
//  TransactionListViewModel.swift
//  Cashflow
//
//  Created by ZEQUN YU on 4/26/23.
//

import Foundation
import Combine

final class TransactionListViewModel: ObservableObject { // Subscribe and refresh as content
    // @Published - send notification to subscriber when data changes
    @Published var transactions: [Transaction] = [] // Empty array as the default value
    
    private var cancellables = Set<AnyCancellable>() // An activity or action supports cancellation
    
    init() {
        getTransactions()
    }
    
    func getTransactions() {
        // guard - early return
        guard let url = URL(string: "https://designcode.io/data/transactions.json") else {
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
                dump(self?.transactions)
            }
            .store(in: &cancellables)
    }
}
