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
            Text(food.calories)
        }
    }
}

//#Preview {
//    FoodDisplayItem()
//}
