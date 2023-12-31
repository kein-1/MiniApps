//
//  PersonalInfoView.swift
//  CalorieHub
//
//  Created by Kein Li on 12/19/23.
//

import SwiftUI

struct PersonalInfoView: View {
    
    // Mark : - Properties
    @Environment(HealthStore.self) private var healthStore
    
    @Binding var selection : Int
    @State private var userAge : Int?
    @State private var userWeight : Double?
    @State private var userHeight : Double?
    @State private var userGoal : Double?
    @State private var userStepsGoal : Double?
    
    var body: some View {
        VStack(spacing: 20) {
            
            // Mark : - User info form
            
            HStack {
                Text("Tell us about")
                Text("yourself!")
                    .foregroundStyle(.orange)
            }
            .font(.headline)
            
            
            
            List {
                Section {
                    TextField("Enter your age", value: $userAge, format: .number)
                        .textFieldStyle(.roundedBorder)
                    
                } header: {
                    Text("Age")
                }
                
                Section {
                    TextField("Enter weight (lbs)", value: $userWeight, format: .number)
                        .textFieldStyle(.roundedBorder)
                } header: {
                    Text("Weight (lbs)")
                }
                
                Section {
                    TextField("Enter height (in)", value: $userHeight, format: .number)
                        .textFieldStyle(.roundedBorder)
                } header: {
                    Text("Height (in)")
                }
                
                Section {
                    TextField("Enter goal weight (lbs)", value: $userGoal, format: .number)
                        .textFieldStyle(.roundedBorder)
                } header: {
                    Text("What is your goal weight?")
                }
                
                Section {
                    TextField("Enter steps goal", value: $userGoal, format: .number)
                        .textFieldStyle(.roundedBorder)
                } header: {
                    Text("How many daily steps are you aiming to hit?")
                }
            }
            .ignoresSafeArea(.keyboard, edges: .bottom) // added to stop keyboard from pushing up view
            .scrollContentBackground(.hidden)
            
            
            // Mark : - Save user data + Next screen
            
            Button{
                healthStore.savingUserWeightAndHeight(userWeight ?? 0, userHeight ?? 0)
                selection += 1
            } label: {
                CustomLabel(text: "Next")
            }
        }
    }
}
//
#Preview {
    let healthStore = HealthStore()
    return PersonalInfoView(selection: .constant(0))
        .environment(healthStore)
}
