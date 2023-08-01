//
//  TransactionModel.swift
//  FinanceTracker (iOS)
//
//  Created by Thomas Brough on 01/03/2023.
//

import Foundation
import SwiftUI

struct Transaction: Identifiable, Decodable, Hashable {
    let id: Int
    let dueDate: String?
    var merchant: String
    let amount: Double
    let amountLeft: Double
//    let type: TransactionType.RawValue
    var isPending: Bool
    var categoryId: Int
    var category: String
    var icon: Image {
        if let catagory = Catagory.categories.first(where: {$0.id == categoryId }) {
            return catagory.icon
        }
        
        return Image(systemName: "questionmark")
    }
    
    var dateParsed: Date {
        dueDate!.dateParsed()
    }
    
    var month: String {
        dateParsed.formatted(.dateTime.year().month(.wide))
    }
}

//enum TransactionType: String {
//    case debit = "Debit"
//    case credit = "Credit"
//}


struct Catagory {
    let id: Int
    let name: String
    let icon: Image
}

extension Catagory {
    static let flat = Catagory(id: 1, name: "Flat", icon: Image(systemName: "house"))
    static let car = Catagory(id: 2, name: "Car", icon: Image(systemName: "car"))
    static let personal = Catagory(id: 3, name: "Personal", icon: Image(systemName: "person.circle"))
    static let other = Catagory(id: 4, name: "Other", icon: Image(systemName: "ellipsis.circle"))
}

extension Catagory {
    static let categories: [Catagory] = [
        .flat,
        .car,
        .personal,
        .other
    ]
}
