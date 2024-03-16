//
//  FloatingFilterButton.swift
//  HackerNewsAPI
//
//  Created by Kein Li on 3/15/24.
//

import SwiftUI

struct FloatingFilterButton: View {
    
    @Binding var collapsed : Bool
    
    var body: some View {
        Button {
            withAnimation {
                collapsed.toggle()
            }
        } label: {
            Label(collapsed ? "Filter" : "", systemImage: collapsed ? "line.3.horizontal.decrease.circle" : "xmark")
                .modifier(ConditionalModifier(collapsed: collapsed))
        }

    }
}


/// Used to apply conditional label style
struct ConditionalModifier : ViewModifier {
    var collapsed: Bool
    
    @ViewBuilder
    func body(content: Content) -> some View {
        if self.collapsed {
            content
                .font(.title2.weight(.semibold))
                .padding()
                .background(.orange)
                .foregroundStyle(.white)
                .clipShape(Capsule())
                .shadow(radius: 4, x: 0, y: 6)
                .labelStyle(.titleAndIcon)
        } else {
            content.labelStyle(.iconOnly)
                .font(.title2.weight(.semibold))
                .padding(20)
                .background(.orange)
                .foregroundStyle(.white)
                .clipShape(Capsule())
                .shadow(radius: 4, x: 0, y: 6)
                .labelStyle(.iconOnly)
        }
    }
}



//#Preview {
//    FloatingFilterButton()
//}
