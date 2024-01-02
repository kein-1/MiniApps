//
//  ViewModel.swift
//  CalorieHub
//
//  Created by Kein Li on 12/30/23.
//

import SwiftUI
import Observation

// Mark : ViewModel to store nutrition data and perform some calculations

@Observable
class ViewModel {
    
    var selectedDate = Date()
    var calories = 0.0
    var fats = 0.0
    var proteins = 0.0
    var carbs = 0.0


    func updateNutrition(_ foods : [Food]){
        calories = foods.reduce(0, {$0 + (Double($1.calories) ?? 0)})
        fats = foods.reduce(0, {$0 + (Double($1.fats ?? "") ?? 0)})
        proteins = foods.reduce(0, {$0 + (Double($1.protein ?? "") ?? 0)})
        carbs = foods.reduce(0, {$0 + (Double($1.carbohydrate ?? "") ?? 0)})
    }
}


