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
            
            VStack(alignment: .trailing, spacing: 20) {
                Text("View 1")
                Text("View 2")
                Text("View 3")
                
                Spacer()
            }
            .padding()
            .border(.blue)
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
    ContentView()
}
