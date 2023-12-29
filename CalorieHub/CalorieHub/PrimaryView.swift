//
//  PrimaryView.swift
//  CalorieHub
//
//  Created by Kein Li on 12/28/23.
//

import SwiftUI

struct PrimaryView: View {
    @Environment(HealthStore.self) private var healthStore
    @Environment(\.modelContext) private var context
    
    var body: some View {
        NavigationStack {
            
        }
    }
}

#Preview {
    var healthStore = HealthStore()
    return PrimaryView()
        .environment(healthStore)
}
