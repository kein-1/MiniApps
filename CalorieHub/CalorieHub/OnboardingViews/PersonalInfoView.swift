//
//  PersonalInfoView.swift
//  CalorieHub
//
//  Created by Kein Li on 12/19/23.
//

import SwiftUI

struct PersonalInfoView: View {
    
    // Mark : - Properties
    
    @Binding var selection : Int
    @State private var userAge : Int?
    @State private var userWeight : Double?
    @State private var userHeight : Double?
    
    var body: some View {
        VStack {
            
            // Mark : - User info form
            
            HStack {
                Text("Tell us about")
                Text("yourself")
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
                    TextField("Enter weight", value: $userWeight, format: .number)
                } header: {
                    Text("Weight")
                }
                
                Section {
                    TextField("Enter weight", value: $userHeight, format: .number)
                } header: {
                    Text("Weight")
                }
            }
            .listStyle(.plain)
            
            
            
            Spacer()
            
            // Mark : - Next screen
            
            Button{
                selection += 1
                // save health data here
            } label: {
                Text("Next")
                .foregroundStyle(.white)
                .frame(width: 300, height: 100)
                .background(.orange.opacity(0.8))
                .clipShape(Circle())
            }
        }
    }
}
//
//#Preview {
//    PersonalInfoView(selection: .constant(0))
//}
