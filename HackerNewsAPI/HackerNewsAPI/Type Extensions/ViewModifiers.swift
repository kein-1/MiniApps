//
//  ViewModifiers.swift
//  HackerNewsAPI
//
//  Created by Kein Li on 3/16/24.
//

import SwiftUI

// MARK: - Custom View Modifiers

struct CustomLabelModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .labelStyle(.titleAndIcon)
            .padding([.top,.bottom], 5)
            .padding([.horizontal], 15)
            .background {
                Capsule(style: .continuous)
                    .fill(.clear)
                    .strokeBorder(lineWidth: 1)
            }
    }
}

extension View {
    func customLabelModifier() -> some View {
        self.modifier(CustomLabelModifier())
    }
}
