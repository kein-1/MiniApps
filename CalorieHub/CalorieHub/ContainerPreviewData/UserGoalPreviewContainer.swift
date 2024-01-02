//
//  UserGoalPreviewContainer.swift
//  CalorieHub
//
//  Created by Kein Li on 1/1/24.
//

import Foundation
import SwiftData


// Mark: Goal of this is to populate swiftdata with testing data (extension option did not work)
// This one is used to see data in Preview in Xcode. Great for testing

@MainActor
let userGoalPreviewContainer : ModelContainer = {
    do {
        
        // This sets configuration allowing data to NOT be saved across instances of app launches. Useful for testing/preview
        // Basically saying for each of the data types, this will be its configuration. We do this for more explicit control
        let configuration = ModelConfiguration(for: UserGoals.self, isStoredInMemoryOnly: true)
        
        
        // ModelConatiner here takes variadic parameter.. so it means it can be 0 or more
        // No need for array brackets
        let container = try ModelContainer(for: UserGoals.self, configurations : configuration)
        
        let sampleData2 : UserGoals = UserGoals(2000.5, 15000.5)
        
        return container
    } catch {
        print("failed to create")
        fatalError("Failed to create container")
    }
}() // runs the closure and assigns its value to previewContainer
