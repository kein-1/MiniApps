//
//  HabitTrackerApp.swift
//  HabitTracker
//
//  Created by Kein Li on 12/14/23.
//

import SwiftUI
import SwiftData

@main
struct HabitTrackerApp: App {
    
    @State private var habitStore = HabitStore()
    
    var body: some Scene {
        WindowGroup {
            
        // add this to the environment variable so all subviews
        // can access it using @Environment property wrapper
            LandingView()
                .environment(habitStore)
        }
        .modelContainer(for: [Habit.self])
    }
}
