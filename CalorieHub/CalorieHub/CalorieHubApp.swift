//
//  CalorieHubApp.swift
//  CalorieHub
//
//  Created by Kein Li on 12/19/23.
//

import SwiftUI

@main
struct CalorieHubApp: App {
    
    @State private var healthStore = HealthStore()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView(healthStore: healthStore)
        }
    }
}
