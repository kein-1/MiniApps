//
//  OnBoarding.swift
//  CalorieHub
//
//  Created by Kein Li on 12/19/23.
//

import SwiftUI

struct OnBoarding: View {
    
    @State private var selection = 0
    
    var body: some View {
        VStack {
            Text("caloriehub")
                .font(.title)
                .foregroundStyle(.orange)
                .padding(.bottom, 50)
            
            TabView(selection: $selection) {
                PersonalInfoView(selection: $selection)
                    .tag(0)
                Text("Screen 2")
                    .tag(1)
                Text("Screen 3")
                    .tag(2)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
        }
    }
}

#Preview {
    OnBoarding()
}
