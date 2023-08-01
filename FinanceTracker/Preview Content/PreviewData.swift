//
//  PreviewData.swift
//  FinanceTracker (iOS)
//
//  Created by Thomas Brough on 01/03/2023.
//

import Foundation
import SwiftUI

var transactionPreviewData1 = Transaction(id: 1, dueDate: "5/03", merchant: "Rent", amount: 900,
                                         amountLeft: 900,isPending: false, categoryId: 1, category: "Flat")
var transactionPreviewData2 = Transaction(id: 2, dueDate: "5/03", merchant: "Car insurance", amount: 134.50,
                                          amountLeft: 134.50,isPending: true, categoryId: 2, category: "Car")

var transactionListPreviewData = [transactionPreviewData1, transactionPreviewData2]
//[Transaction](repeating: transactionPreviewData, count: 10)
