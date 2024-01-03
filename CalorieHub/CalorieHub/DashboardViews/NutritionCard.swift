//
//  Nutritient Card.swift
//  CalorieHub
//
//  Created by Kein Li on 1/2/24.
//

import SwiftUI
import SwiftData

struct Nutritient_Card: View {
    
    @Environment(ViewModel.self) var viewModel
    @Query(filter: Food.currentPredicate()) var foods : [Food]
    @Query var userGoals : [UserGoals]
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(viewModel.totalCalories.formatted())
                Text(viewModel.totalFats.formatted())
                Text(viewModel.totalProteins.formatted())
                Text(viewModel.totalCarbs.formatted())
//                
                Divider()
                Text(userGoals[0].dailyCaloriesGoal?.formatted() ?? "")
                Text(userGoals[0].dailyFatsGoal?.formatted() ?? "")
                Text(userGoals[0].dailyProteinGoal?.formatted() ?? "")
                Text(userGoals[0].dailyCarbsGoal?.formatted() ?? "")
            }
            .navigationTitle(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Title@*/Text("Title")/*@END_MENU_TOKEN@*/)
        }
        .onAppear {
            viewModel.updateNutrition(foods)
            print(userGoals.count)
        }
    }
    
    
    
}

#Preview {
    let vm = ViewModel()
    return Nutritient_Card()
//        .modelContainer(DataPreviewController.userGoalPreviewContainer)
//        .modelContainer(DataPreviewController.foodPreviewContainer)
        .modelContainer(DataPreviewController.mainContainer)
        .environment(vm)
}
