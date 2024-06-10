//
//  ExpenseCard.swift
//  SmallExpenses
//
//  Created by Kein Li on 6/10/24.
//

import SwiftUI

struct ExpenseCell: View {
    
    @Bindable var vm: ExpenseViewModel
    let expense : Expense
    
    
    var body: some View {
        HStack {
            Text(expense.id ?? 0, format: .number)
            Text(expense.name)
            Text(expense.amount, format: .number)
            Text(expense.date, format: .dateTime)
        }
        .swipeActions(edge: .trailing) {
            Button(role: .destructive) {
                do {
                    try vm.expenseRepo.delete(for: expense)
                } catch {
                    print("Error: \(error)")
                }
            } label: {
                Label("Delete", systemImage: "trash")
            }
        }
    }
}
//
//#Preview {
//    ExpenseCell(expense: Expense(name: "name", amount: 123, date: Date.now))
//}
