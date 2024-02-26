//
//  CheckBoxStyle.swift
//  HabitTracker
//
//  Created by Kein Li on 12/16/23.
//

import Foundation
import SwiftUI

// Custom check box style
struct CheckBoxStyle : ToggleStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        Image(systemName: configuration.isOn ? "checkmark.square" : "square")
            .resizable()
            .frame(width: 22, height: 22)
            .onTapGesture {
                configuration.isOn.toggle() // configuration.isOn is built in conforming to ToggleStyle
            }
            .foregroundStyle(.green)
    }
}

//
//
extension ToggleStyle where Self == CheckBoxStyle {
    static var checkBox : CheckBoxStyle {
        CheckBoxStyle()
    }
}


