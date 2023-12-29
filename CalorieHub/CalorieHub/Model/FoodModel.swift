//
//  FoodModel.swift
//  CalorieHub
//
//  Created by Kein Li on 12/19/23.
//

import Foundation
import SwiftData

// Food model : user tracks each food

@Model
class Food {
    
    var name : String
    var date = Date()
    var category : String
    var calories : Double?
    var fats : Double?
    var protein : Double?
    var carbohydrate : Double?
    
    
    init(name: String, category: String, calories: Double? = nil, fats: Double? = nil, protein: Double? = nil, carbohydrate: Double? = nil) {
        self.name = name
        self.category = category
        self.calories = calories
        self.fats = fats
        self.protein = protein
        self.carbohydrate = carbohydrate
    }
    
}
