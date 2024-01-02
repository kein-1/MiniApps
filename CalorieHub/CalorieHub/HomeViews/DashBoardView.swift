//
//  DashBoardView.swift
//  CalorieHub
//
//  Created by Kein Li on 1/1/24.
//

import SwiftUI
import SwiftData


// Mark : Primary landing view for user
// Designed to read user's steps, calories,
// total goals etc for the day
struct DashBoardView: View {
    
    @Query(filter: Food.currentPredicate()) var foods : [Food]

    var body: some View {
        Text(foods.reduce(0, {$0 + (Double($1.calories) ?? 0)}), format: .number)
    }
}
    

#Preview {
    DashBoardView()
        .modelContainer(DataPreviewController.foodPreviewContainer)
}
