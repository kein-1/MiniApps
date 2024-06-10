//
//  ExpenseInsertionView.swift
//  SmallExpenses
//
//  Created by Kein Li on 6/9/24.
//

import SwiftUI

struct ExpenseInsertionView: View {
    
    
    @Environment(\.dismiss) private var dismiss
    @Bindable var vm: ExpenseViewModel
    
    @State private var name = ""
    @State private var amount = 0.0

    var body: some View {
        
        VStack {
            Form {
                TextField("Name: ", text: $name)
                TextField("Expense: ", value: $amount, formatter: self.numberFormatter)
            }
            Button {
                let expense = Expense(name: name, amount: amount, date: Date.now)
                try? vm.expenseRepo.add(for: expense)
                Task {
                    await vm.fetchAllExpenses()
                }
                dismiss()
            } label: {
                Text("Cancel")
            }
            .buttonStyle(.myButtonStyle)
            
        }
    }
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.zeroSymbol = ""
        return formatter
    }()
}


struct MyButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(40)
            .foregroundStyle(.white)
            .background(
                configuration.isPressed ? .blue.opacity(0.5) : .blue
            )
            .clipShape(Capsule())
    }
}

extension ButtonStyle where Self == MyButtonStyle {
    static var myButtonStyle : MyButtonStyle {
        return MyButtonStyle()
    }
}


//
//#Preview {
//    
//    ExpenseInsertionView()
//}
