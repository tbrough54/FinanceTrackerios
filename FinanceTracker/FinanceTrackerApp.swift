//
//  FinanceTrackerApp.swift
//  Shared
//
//  Created by Thomas Brough on 01/03/2023.
//

import SwiftUI

@main
struct FinanceTrackerApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
