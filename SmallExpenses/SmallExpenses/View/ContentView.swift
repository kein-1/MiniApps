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
                HStack {
                    Text("Total:")
                    Text(vm.total, format: .currency(code: "USD"))
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                ForEach($vm.expenses, id: \.self) { $expense in
                    
                    ExpenseCell(vm: vm, expense: expense)
                        .overlay {
                            NavigationLink(destination: ExpenseUpdateView(vm: vm, expense: $expense)) {
                                EmptyView()
                            }
                            .opacity(0)
                        }
                }
            }
            .listStyle(.plain)
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
                       
                       
   //                    NavigationLink {
   //                        ExpenseUpdateView(vm: vm, expense: $expense)
   //                    } label: {
   //                        ExpenseCell(vm: vm, expense: expense)
   //                    }
   //                    .listRowSeparator(.hidden)
   //
                                   
