//
//  TransactionListViewModel.swift
//  FinanceTracker (iOS)
//
//  Created by Thomas Brough on 01/03/2023.
//

import Foundation
import Combine
import Collections
import SwiftUI

typealias TransactionGroup = OrderedDictionary<String, [Transaction]>

final class TransactionListViewModel: ObservableObject {
    @Published var transactions: [Transaction] = []
    
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        getTransactions()
    }
    
    func getTransactions() {
        guard let url = URL(string: "Test") else {
            print("Error")
            return
        }
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode==200 else {
                    dump(response)
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [Transaction].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching transactions: ", error.localizedDescription)
                    
                case .finished:
                    print("Finished fetching transactions")
                }
            } receiveValue: { [weak self]result in
                self?.transactions = result
//                dump(self?.transactions)
            }
            .store(in: &cancellables)
    }
    
    func groupTransactionByMonth() -> TransactionGroup {
        guard !transactions.isEmpty else {
            return [:]
        }
        let groupedTransactions = TransactionGroup(grouping: transactions) { $0.month}
        
        return groupedTransactions
    }
    
    func accumulateTransactions() -> Double {
        print("accumulateTransactions")
        guard !transactions.isEmpty else {return 0}
        
        let todayDate = Calendar.current.description.dateParsed()
        print("Day Today: ", todayDate)
        
        var sum: Double = .zero
        
        for transaction in transactions {
            sum += transaction.amountLeft
            
        }

        return sum
    }
    
//    func getEachDaysAmoun(transactionList: TransactionList) -> [Double] {
//        var totalAmmountArray: [Double]
//        
//        
//        return totalAmmountArray
//    }
}
