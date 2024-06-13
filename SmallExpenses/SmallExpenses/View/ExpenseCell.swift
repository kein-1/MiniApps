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
            VStack(alignment: .leading) {
                Text(expense.name)
                    .font(.system(size: 18).bold())
                Text(expense.date, format: .dateTime)
                    .font(.system(size: 14))
                    .foregroundStyle(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Text(expense.amount, format: .currency(code: "USD"))
        }
        .padding()
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
        .frame(maxWidth: .infinity, minHeight: 50)
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
        }
        .shadow(radius: 4)
        .onDisappear {
            Task {
                await vm.fetchAllExpenses()
            }
        }
    }
}
//
//#Preview {
//    @State var vm : ExpenseViewModel = ExpenseViewModel(expenseRepo: LocalRepository())
//    return ExpenseCell(vm: vm, expense: Expense(name: "name", amount: 123, date: Date.now))
//}
