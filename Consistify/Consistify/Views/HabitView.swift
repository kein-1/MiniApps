//
//  Habit.swift
//  HabitTracker
//
//  Created by Kein Li on 12/16/23.
//

import SwiftUI
import SwiftData

struct HabitView: View {
    // use the @Environment wrapper to access the store
    @Environment(HabitStore.self) private var habitStore
    
    
    @Query var habits : [Habit]
    
    var habit : Habit
    @State private var isOn = false
    
    
    var body: some View {
            HStack {
                HStack{
                    Image(systemName: habit.icon)
                    Text(habit.name)
                    Label("hi", systemImage: "plus")
                }
                .font(.subheadline)
                .foregroundStyle(habit.isCompleted ? .gray : .primary)
                .strikethrough(habit.isCompleted)
                
                Spacer()
                Toggle("", isOn: $isOn)
                    .toggleStyle(.checkBox)
                    .onChange(of: isOn) {
                        toggleHabitCompletion(habit: habit)
                    }
        }
    }
    
    func toggleHabitCompletion(habit : Habit){
        for item in habits {
            if item === habit {
                item.isCompleted.toggle()
            }
        }
    }
}

//#Preview {
//    
//    var habit = Habit(name: "hi23", type: .fitness, date: "test")
//    let store = HabitStore()
//    return HabitView(habit: habit)
//        .environment(store)
//}
