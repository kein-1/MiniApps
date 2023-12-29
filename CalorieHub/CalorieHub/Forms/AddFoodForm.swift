//
//  AddFoodForm.swift
//  CalorieHub
//
//  Created by Kein Li on 12/29/23.
//

import SwiftUI

struct AddFoodForm: View {
    
    @Environment(\.modelContext) private var context
    
    @State private var name = ""
    @State private var calories: Double?
    @State private var fat : Int?
    @State private var carbs : Int?
    @State private var protein : Int?
    
    
    let sectionTitles = [
        "Food Name",
        "Calories",
        "Fats",
        "Carbohydrates",
        "Proteins"
    ]

    let textFieldPlaceholders = [
        "Enter food name",
        "Enter Calories",
        "(Optional) Enter Fats",
        "(Optional) Enter Carbs",
        "(Optional) Enter Proteins"
    ]
    
    var category : String
    
//        .overlay(alignment: .bottom) {
//            Divider()
//        }
        
    
    var body: some View {
        VStack {
            Form {
                ForEach(textFieldPlaceholders.indices, id: \.self) { index in
                    Section(sectionTitles[index]) {
                        TextField(textFieldPlaceholders[index], text: $name)
                            .overlay(alignment: .bottom) { // great trick to add a bottom bar
                                Divider()
                            }
                    }
                }
            }
            .navigationTitle("Add a food ") // without this, the backbutton has the text of the previous view's nav title
            .scrollContentBackground(.hidden) // hides the form's background
            
            Button {
                
            } label: {
                CustomLabel(text: "Add")
            }
        }
    }
}

#Preview {
    AddFoodForm(category: "Sweets")
}
