//
//  AddFoodView.swift
//  CalorieHub
//
//  Created by Kein Li on 12/28/23.
//

import SwiftUI

struct FoodCategoriesView: View {
    
    let images = ["Beverages", "Breakfast", "Entree", "Seafood", "Sweets"]
    let columns = Array(repeating: GridItem(.flexible(), spacing: 30), count : 2)
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 45) {
                    ForEach(images, id: \.self){ image in
                        NavigationLink {
                            AddFoodForm(category: image)
                        } label: {
                            FoodCard(categoryName: image)
                        }
                        .foregroundStyle(.orange)
                    }
                }
            }
            .navigationTitle("Select a type of food")
            .navigationBarTitleDisplayMode(.inline)
            .padding()
        }
    }
}

#Preview {
    FoodCategoriesView()
}
