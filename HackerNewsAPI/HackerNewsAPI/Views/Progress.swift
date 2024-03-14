//
//  ProgressView.swift
//  HackerNewsAPI
//
//  Created by Kein Li on 3/14/24.
//

import SwiftUI

struct Progress: View {
    var body: some View {
        VStack {
            ProgressView()
                .tint(.orange)
            Text("Fetching Best Stories....")
        }
    }
}
//
//#Preview {
//    ProgressView()
//}
