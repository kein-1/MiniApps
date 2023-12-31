//
//  CalorieHubApp.swift
//  CalorieHub
//
//  Created by Kein Li on 12/19/23.
//

import SwiftUI
import SwiftData
import Observation

@main
struct CalorieHubApp: App {
    
    // Mark : View Model
    @State private var viewModel = ViewModel()
    
    // Mark : Health Store
    @State private var healthStore = HealthStore()
    
    // Mark : AppStorage boolean checking whether the user is onboarded
    @AppStorage("isOnBoarding") private var isOnBoarding : Bool = true
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(healthStore)
                .environment(viewModel)
                .modelContainer(for: [Food.self,UserGoals.self])
                .fullScreenCover(isPresented: $isOnBoarding) {
                    OnBoarding(isOnboarding: $isOnBoarding)
                        .environment(healthStore) // had to add this here as well to allow environment
                        .modelContainer(for: [Food.self,UserGoals.self])
                }
        }
    }
}
