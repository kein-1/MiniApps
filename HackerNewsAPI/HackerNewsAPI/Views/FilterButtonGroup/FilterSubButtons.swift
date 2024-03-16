//
//  FilterSubButtons.swift
//  HackerNewsAPI
//
//  Created by Kein Li on 3/15/24.
//

import SwiftUI

struct FilterSubButtons: View {
    
    var systemImageStr: String
    
    var body: some View {
        Button {
            
        } label: {
            Label("", systemImage: systemImageStr)
                .labelStyle(.iconOnly)
                .font(.title3)
                .padding()
                .background(.orange)
                .foregroundStyle(.white)
                .clipShape(Circle())
               
        }

    }
}
