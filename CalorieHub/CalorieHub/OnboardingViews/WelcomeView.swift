//
//  WelcomeView.swift
//  CalorieHub
//
//  Created by Kein Li on 12/24/23.
//

import SwiftUI

struct WelcomeView: View {
    
    @Binding var selection : Int
    
    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Text("Welcome to")
                Text("calorieHub!")
                    .foregroundStyle(.orange)
            }
            .font(.headline)
            
            Text("The goal of this app is to promote improve your health and fitness. Press next to continue")
                .padding()
            
            Spacer()
            
            Button {
                withAnimation{
                    selection += 1
                }
            } label: {
                CustomLabel(text: "Next")
            }
        }
        .transition(.slide)
    }
}
//
//#Preview {
//    WelcomeView()
//}
