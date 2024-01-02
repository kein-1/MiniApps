//
//  Nutritient Card.swift
//  CalorieHub
//
//  Created by Kein Li on 1/2/24.
//

import SwiftUI
import SwiftData

struct Nutritient_Card: View {
    
    @Query(filter: Food.currentPredicate()) var foods : [Food]
    @Environment(ViewModel.self) var viewModel
    
    
    var body: some View {
        VStack {
            
            Text(viewModel.calories.formatted())
            Text(viewModel.fats.formatted())
            Text(viewModel.proteins.formatted())
            Text(viewModel.carbs.formatted())
        }
        .onAppear {
            viewModel.updateNutrition(foods)
        }
    }
    
    
    
}

#Preview {
    let vm = ViewModel()
    return Nutritient_Card()
        .modelContainer(DataPreviewController.foodPreviewContainer)
        .environment(vm)
}
