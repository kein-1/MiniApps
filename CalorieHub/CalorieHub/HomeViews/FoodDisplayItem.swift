//
//  FoodDisplayItem.swift
//  CalorieHub
//
//  Created by Kein Li on 12/30/23.
//

import SwiftUI

struct FoodDisplayItem: View {
    
    var food : Food
    var body: some View {
        VStack {
            Text(food.name)
            Text(food.calories, format: .number)
            Text(food.fats, format: .number)
            Text(food.carbohydrate, format: .number)
            Text(food.protein, format: .number)
        }
    }
}

//#Preview {
//    FoodDisplayItem()
//}
