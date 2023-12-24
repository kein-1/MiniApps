//
//  CustomLabel.swift
//  CalorieHub
//
//  Created by Kein Li on 12/24/23.
//

import SwiftUI

struct CustomLabel: View {
    var body: some View {
        Text("Next")
        .foregroundStyle(.white)
        .frame(width: 300, height: 100)
        .background(.orange.opacity(0.8))
        .clipShape(Circle())
    }
}

//#Preview {
//    CustomLabel()
//}
