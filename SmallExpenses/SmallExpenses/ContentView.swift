//
//  ContentView.swift
//  SmallExpenses
//
//  Created by Kein Li on 6/6/24.
//

import SwiftUI



struct ContentView: View {
    
    @State private var vm : ExpenseViewModel = ExpenseViewModel(expenseRepo: LocalRepository())
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Text("Hello, world!")
            Text("Hello, world!")
            Text("Hello, world!")
            Text("Hello, world!")
            Text("Hello, world!")
            Text("Hello, world!")
            
            Button("get all") {
                vm.expenseRepo.getAll()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
