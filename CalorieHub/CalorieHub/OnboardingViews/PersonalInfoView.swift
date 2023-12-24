//
//  PersonalInfoView.swift
//  CalorieHub
//
//  Created by Kein Li on 12/19/23.
//

import SwiftUI

struct PersonalInfoView: View {
    
    // Mark : - Properties
    @Environment(HealthStore.self) var healthStore
    @Binding var selection : Int
    @State private var userAge : Int?
    @State private var userWeight : Double?
    @State private var userHeight : Double?
    
    var body: some View {
        VStack {
            
            // Mark : - User info form
            
            HStack {
                Text("Tell us about")
                Text("yourself!")
                    .foregroundStyle(.orange)
            }
            .font(.headline)
            .frame(height: 150)
            
            
            List {
                Section {
                    TextField("Enter your age", value: $userAge, format: .number)
                } header: {
                    Text("Age")
                }
                
                
                Section {
                    TextField("Enter weight (lbs)", value: $userWeight, format: .number)
                } header: {
                    Text("Weight (lbs)")
                }
                
                Section {
                    TextField("Enter height (in)", value: $userHeight, format: .number)
                } header: {
                    Text("Height (in)")
                }
            }
            .listStyle(.plain)
            
            
            
            Spacer()
            
            // Mark : - Save user data + Next screen
            
            Button{
                healthStore.savingUserWeightAndHeight(userWeight ?? 0, userHeight ?? 0)
//                selection += 1
            } label: {
                CustomLabel()
            }
        }
        .onAppear {
            healthStore.requestAuthHeightWeight()
        }
    }
    
    
    
}
//
//#Preview {
//    PersonalInfoView(selection: .constant(0))
//}
