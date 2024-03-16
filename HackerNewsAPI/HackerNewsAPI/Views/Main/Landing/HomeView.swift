//
//  ContentView.swift
//  HackerNewsAPI
//
//  Created by Kein Li on 3/9/24.
//

import SwiftUI

struct HomeView: View {
    
    @State var hackerNewsVM = HackerNewsViewModel()
    @State var userVM = UserFavoritesViewModel()
    
    var body: some View {
        NavigationStack {
            if hackerNewsVM.isFetching {
                Progress()
            } else {
                List {
                    ForEach(hackerNewsVM.filteredStories, id: \.self) { story in
                        NavigationLink {
                            StoryView(story: story)
                        } label: {
                            StoryListView(story: story)
                        }
                    }
                }
                .searchable(text: $hackerNewsVM.searchableText)
                .listStyle(.plain)
                .navigationTitle("Today's Best Stories")
                .overlay(alignment: .bottomTrailing) {
                    FilteredButtonGroup()
                }
                .toolbar {
                    NavigationLink("Favorites") {
                        UserFavorites()
                    }
                }
            }
        }
        .task {
            await hackerNewsVM.getStories(for: GetCase.bestStories)
        }
        .refreshable {
            await hackerNewsVM.getStories(for: GetCase.bestStories)
        }
        
    }
}

#Preview {
    HomeView()
}
