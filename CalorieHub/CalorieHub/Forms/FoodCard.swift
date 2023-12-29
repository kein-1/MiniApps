//
//  FoodCard.swift
//  CalorieHub
//
//  Created by Kein Li on 12/28/23.
//

import SwiftUI

struct FoodCard: View {
    
    var categoryName : String
    
    var body: some View {
        VStack {
            Text(categoryName)
            Image(categoryName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
        }
    }
}

#Preview {
    FoodCard(categoryName: "Sweets")
}
