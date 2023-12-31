//
//  ContentView.swift
//  CalorieHub
//
//  Created by Kein Li on 12/19/23.
//

import SwiftUI
import HealthKit

struct ContentView: View {
    
    var body: some View {
        TabView {
            PrimaryView()
            .tabItem {
                Label("Home", systemImage: "house")
            }
            
            FoodCategoriesView()
                .tabItem {
                    Label("Add a Food", systemImage: "plus.app")
                }
            Text("view2")
                .tabItem {
                    Label("Personal", systemImage: "person")
                }
            
        }
        .padding()
    }
}

#Preview {
    
    var healthStore = HealthStore()
    var viewModel = ViewModel()
    
    return ContentView()
        .environment(healthStore)
        .environment(viewModel)
        .modelContainer(for: Food.self)
}
