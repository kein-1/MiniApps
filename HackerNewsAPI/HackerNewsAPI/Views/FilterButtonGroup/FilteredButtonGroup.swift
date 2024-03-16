//
//  FilterButtonsView.swift
//  HackerNewsAPI
//
//  Created by Kein Li on 3/15/24.
//

import SwiftUI

struct FilteredButtonGroup: View {
    
    @State var collapsed = true
    
    var body: some View {
        VStack {
            if !collapsed {
                FilterSubButtons(systemImageStr: "arrowshape.turn.up.left")
                FilterSubButtons(systemImageStr: "square.and.arrow.down")
            }
            FloatingFilterButton(collapsed: $collapsed)
        }
        .padding(.trailing,15)
    }
    
}
