//
//  AddHabits.swift
//  HabitTracker
//
//  Created by Kein Li on 12/15/23.
//

import SwiftUI
import SwiftData

struct AddHabitsView: View {
    
    // use the @Environment wrapper to access the store
    @Environment(HabitStore.self) var habitStore
    @Environment(\.modelContext) var modelContext

    @Binding var selected : Int
    
    @State private var habitName = ""
    @State private var habitType = HabitType.fitness
    
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    TextField("Name", text: $habitName)
                        .textFieldStyle(.plain)
                } header: {
                    Text("Habit Name")
                        .foregroundStyle(.black)
                }
                
                Section {
                    Picker("Enter Habit Type", selection: $habitType) {
                        ForEach(HabitType.allCases, id: \.self){ type in
                            Text(type.rawValue).tag(type)
                        }
                    }
                } header: {
                    Text("Habit Type")
                        .foregroundStyle(.black)
                }
            }
            // NavigationLinks does not work well with ToolBar..
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Clear") {
                    }
                }
                
                // programatically reset the tab view back to home screen
                ToolbarItem(placement: .primaryAction) {
                    Button("Add Habit") {
                        
                        let newHabit = habitStore.createHabit(habitName, habitType)
                        modelContext.insert(newHabit)
                        selected = 0
                    }
                }
            }
            .navigationBarTitle("Create a new Habit")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct HabitButtonStyle : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .scaleEffect(configuration.isPressed ? 1.25 : 1)
            .foregroundStyle(.primary)
//            .background(.blue)
//            .clipShape(Capsule())
    }
}

extension ButtonStyle where Self == HabitButtonStyle {
    static var habitStyle : HabitButtonStyle {
        HabitButtonStyle()
    }
}

	
#Preview {
    // need to add this otherwise view crashes
    let store = HabitStore()
    return AddHabitsView(selected: .constant((0)))
        .environment(store)
        .modelContainer(for: [Habit.self], inMemory: true)
}
