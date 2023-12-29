//
//  CalorieHubApp.swift
//  CalorieHub
//
//  Created by Kein Li on 12/19/23.
//

import SwiftUI
import SwiftData

@main
struct CalorieHubApp: App {
    
    @State private var healthStore = HealthStore()
    @AppStorage("isOnBoarding") private var isOnBoarding : Bool = true
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(healthStore)
                .modelContainer(for: Food.self)
                .fullScreenCover(isPresented: $isOnBoarding) {
                    OnBoarding(isOnboarding: $isOnBoarding)
                }
        }
    }
}
