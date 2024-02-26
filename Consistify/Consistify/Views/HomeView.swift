//
//  HomeView.swift
//  HabitTracker
//
//  Created by Kein Li on 12/15/23.
//

import SwiftUI

struct HomeView: View {
    
    
    var body: some View {
        NavigationStack  {
            VStack {
                DateView()
                Spacer()
                // add a habit progress view tracker here
                
                // view showing all habits for the day
                // allow an option to edit a habit via clicking it
                // mayb incorporate it with .sheet 
                HabitsListView()
                    .frame(maxHeight: .infinity)
                
                Spacer()
            }
            .toolbar {
//                ToolbarItem(placement: .topBarTrailing) {
//                    NavigationLink(value: 1) {
//                        AddHabitsView(habitModel: $habitModel)
//                    } label: {
//                        Image(systemName: "plus")
//                    }
//                }
            }
        }
    }
}

#Preview {
    // need to add this otherwise view crashes
    // need to add this otherwise view crashes
    let store = HabitStore()
    return HomeView().environment(store)
}
