//
//  PrimaryView.swift
//  CalorieHub
//
//  Created by Kein Li on 12/28/23.
//

import SwiftUI
import SwiftData

struct PrimaryView: View {
    @Environment(HealthStore.self) private var healthStore
    @Environment(ViewModel.self) private var viewModel
    @Environment(\.modelContext) private var context
    
//    var currDate = viewModel.selectedDate
//    
    @Query(filter: Food.currentPredicate()) var foods : [Food]
    
    var body: some View {
        NavigationStack {
            List(Food.mealTimes, id: \.self) { mealTime in
                Section {
                    ForEach(foods) { food in
                        VStack {
                            FoodDisplayItem(food: food)
                        }
                        Text(food.category)
                    }
                } header: {
                    Text(mealTime)
                        .foregroundStyle(.orange)
                        .font(.headline.bold())
                }
            }
        }
        .onAppear {
            print(foods)
        }
    }
    
}
//
//#Preview {
//    var healthStore = HealthStore()
//    var viewModel = ViewModel()
//    return PrimaryView()
//        .environment(healthStore)
//        .environment(viewModel)
//        .modelContainer(for: Food.self)
//}
