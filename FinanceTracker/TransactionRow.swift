//
//  TransactionRow.swift
//  FinanceTracker (iOS)
//
//  Created by Thomas Brough on 01/03/2023.
//

import SwiftUI


struct TransactionRow: View {
    @State var radioButton: Bool = true
    var transaction: Transaction
    var body: some View {
        HStack(spacing: 20) {
            //MARK: Transaction Catagory Icon
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.icon.opacity(0.3))
                .frame(width: 44, height: 44)
                .overlay {
                    transaction.icon
                }
            VStack(alignment: .leading, spacing: 6) {
                //MARK: Transaction Merchant
                Text(transaction.merchant)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                
//                //MARK: Transaction Catagory
//                Text(transaction.category)
//                    .font(.footnote)
//                    .opacity(0.7)
//                    .lineLimit(1)
                
                //MARK: Transaction Due Date
                Text(transaction.dateParsed, format: .dateTime.day().month())
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
            }
            
            Spacer()
            
        
            //MARK: TransactionAmount
            if radioButton {
                Text(transaction.amountLeft,format: .currency(code:"GBP"))
                    .bold()
                    .foregroundColor(Color.text)
                    .padding(.trailing, 10)
            } else {
                Text(transaction.amountLeft-transaction.amount,format: .currency(code:"GBP"))
                    .bold()
                    .foregroundColor(Color.text)
                    .padding(.trailing, 10)
            }
            
            
            Image(systemName: radioButton ? "square" : "checkmark.square")
                .padding(.trailing, 10)
                .onTapGesture {
                    self.radioButton.toggle()
                    updateIsPending(transaction: transaction, value: radioButton)
                }
                
        }
        .padding([.top, .bottom], 8)
    }
}

struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRow(transaction: transactionPreviewData1)
//        TransactionRow(transaction: transactionPreviewData)
//            .preferredColorScheme(.dark)
    }
}


func updateIsPending(transaction: Transaction, value: Bool) {
    var transaction: Transaction = transaction
    transaction.isPending = value
}
