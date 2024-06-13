//
//  Test.view.swift
//  SmallExpenses
//
//  Created by Kein Li on 6/12/24.
//

import SwiftUI

struct Test_view: View {
    
    var arr = (0..<5).map {$0 }
    
    var body: some View {
        List {
            ForEach(arr, id: \.self) { item in
                HStack {
                    Text(item, format: .number)
                }
                .frame(maxWidth: .infinity, minHeight: 50)
                .background {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.white)
                }
                .shadow(radius: 4)
                .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    Test_view()
}
