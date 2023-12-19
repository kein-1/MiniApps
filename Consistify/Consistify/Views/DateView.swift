//
//  DateView.swift
//  HabitTracker
//
//  Created by Kein Li on 12/14/23.
//

import SwiftUI

struct DateView: View {
    
    // use the @Environment wrapper to access the store
    @Environment(HabitStore.self) private var habitStore
    
    
    var body: some View {
        // Use geometry reader to get the parent container's size, then
        // we can set the HStack's width to the parent's with and then use
        // center alignement
//        GeometryReader { geometry in
        VStack {
            ScrollViewReader { scrollViewProxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(habitStore.rangeOfDays, id: \.self){ date in
                            DateRoundedRectangleView(date: date)
                                .id(habitStore.dateExtractor(date: date, format: "d EEE")) // give it an id
                            // in this cae it uses a String
                        }
                    }
                }
                .onAppear {
                    let stringID = habitStore.dateExtractor(date: habitStore.dateOffset(), format: "d EEE")
                    scrollViewProxy.scrollTo(stringID)
                }
            }
            .padding()
            
        }
    }
}
//
#Preview {
    // need to add this otherwise view crashes
   let store = HabitStore()
   return DateView()
        .environment(store)
}
