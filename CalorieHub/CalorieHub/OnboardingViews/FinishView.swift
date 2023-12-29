//
//  FinishView.swift
//  CalorieHub
//
//  Created by Kein Li on 12/24/23.
//

import SwiftUI

struct FinishView: View {
    
    @Binding var isOnboarding : Bool
    
    var body: some View {
        VStack(spacing: 40) {
           
            
            Text("Great ! Press the button to complete the process")
                .padding()
            
            Spacer()
            
            Button {
                isOnboarding = false
            } label: {
                CustomLabel(text: "Done!")
            }
        }
        .transition(.slide)
    }
}
//
//#Preview {
//    FinishView()
//}
