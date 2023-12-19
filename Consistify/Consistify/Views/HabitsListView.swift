//
//  HabitsView.swift
//  HabitTracker
//
//  Created by Kein Li on 12/15/23.
//

import SwiftUI
import SwiftData

struct HabitsListView: View {
    
    // use the @Environment wrapper to access the store
    
    @Environment(\.modelContext) private var modelContext

    @Query var habits : [Habit]
    
    
    var body: some View {
        
        if habits.isEmpty {
            RoundedRectangle(cornerRadius: 25)
                .fill(.clear)
                .strokeBorder(.blue, lineWidth: 3)
                .padding()
                .overlay {
                    Text("No habits shown. Please add a new habit!")
                }
                .frame(height: 300)
        } else {
            List {
                Section {
                    ForEach(habits) { habit in
                        HabitView(habit: habit)
                    }
                    .onDelete(perform: delete)
                } header: {
                    Text("Today's Habits")
                }
            }
            .listStyle(.plain)
            .listSectionSeparator(.hidden, edges: .all)
        }
    }
    
    
    
    
    func delete(indexSet : IndexSet) {
        for index in indexSet {
            let habit = habits[index] // returns the model
            modelContext.delete(habit) // deletes it
        }
    }
}

#Preview {
    let store = HabitStore()
    return HabitsListView()
        .environment(store)
        .modelContainer(for: [Habit.self])
}
