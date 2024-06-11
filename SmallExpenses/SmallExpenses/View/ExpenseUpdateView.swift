//
//  ExpenseUpdateView.swift
//  SmallExpenses
//
//  Created by Kein Li on 6/10/24.
//

import SwiftUI

struct ExpenseUpdateView: View {
    
    @Bindable var vm : ExpenseViewModel
    @Binding var expense: Expense
    
    var body: some View {
        VStack {
            Form {
                TextField("Name: ", text: $expense.name)
                TextField("Expense: ", value: $expense.amount, formatter: self.numberFormatter)
            }
            Spacer()
            Button("Save") {
                vm.updateExpense(expense: expense)
            }
        }
        .padding()
    }
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.zeroSymbol = ""
        return formatter
    }()
}
