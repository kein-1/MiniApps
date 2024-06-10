//
//  ContentView.swift
//  SmallExpenses
//
//  Created by Kein Li on 6/6/24.
//

import SwiftUI



struct ContentView: View {
    
    @State var vm : ExpenseViewModel = ExpenseViewModel(expenseRepo: LocalRepository())
    @State private var showSheet: Bool = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.expenses, id: \.self) { expense in
                    ExpenseCell(vm: vm, expense: expense)
                    
                }
            }
            .navigationTitle("Expenses")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button {
                        showSheet = true
                    } label: {
                        Label("", systemImage: "plus")
                    }

                }
            }
        }
        .task {
            await vm.fetchAllExpenses()
        }
        .refreshable {
            Task {
                await vm.fetchAllExpenses()
            }
        }
        .sheet(isPresented: $showSheet) {
            ExpenseInsertionView(vm: vm)
        }
    }
}

#Preview {
    ContentView()
}
