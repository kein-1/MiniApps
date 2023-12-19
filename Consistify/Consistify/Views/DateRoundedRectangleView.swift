//
//  DateRoundedRectangle.swift
//  HabitTracker
//
//  Created by Kein Li on 12/15/23.
//

import SwiftUI

struct DateRoundedRectangleView: View {
    
    // use the @Environment wrapper to access the store
    @Environment(HabitStore.self) private var habitStore
    
    var date : Date
    var body: some View {
        
        // if current date passed in is equal to currently selected date, conditionally set its border values
        RoundedRectangle(cornerRadius: 15)
            .strokeBorder(habitStore.dateVerifier(date) ? .blue : .gray, lineWidth: habitStore.dateVerifier(date) ? 3 : 2)
            .fill(.clear)
            .overlay {
                VStack {
                    Text(habitStore.dateExtractor(date: date, format: "dd"))
                        .font(.caption)
                    
                    Text(habitStore.dateExtractor(date: date, format: "EEE"))
                        .font(.caption2)
                }
            }
            .frame(width: 45, height: 60, alignment: .center)
            .onTapGesture {
                habitStore.currentDay = date
            }
        }
}
//
//#Preview {
//    DateRoundedRectangleView()
//}
