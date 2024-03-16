//
//  UserFavorites.swift
//  HackerNewsAPI
//
//  Created by Kein Li on 3/16/24.
//

import SwiftUI

struct UserFavorites: View {
    
    @State var userFavorites = UserFavoritesViewModel()
    
    var body: some View {
        VStack {
            ForEach(userFavorites.retrievedFavorites, id: \.self) { story in
                StoryListView(story: story)
                Divider()
            }
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .padding()
    }
}
//
//#Preview {
//    UserFavorites()
//}
