//
//  ContentView.swift
//  HackerNewsAPI
//
//  Created by Kein Li on 3/9/24.
//

import SwiftUI

struct HomeView: View {
    
    @State var hackerNewsVM = HackerNewsViewModel()
    
    
    var body: some View {
        NavigationStack {
            if hackerNewsVM.isFetching {
                Progress()
            } else {
                List(hackerNewsVM.stories, id: \.self) { story in
                    NavigationLink {
                        StoryView(story: story)
                    } label: {
                        StoryListView(story: story)
                    }
                }
                .navigationTitle("Today's Best Stories")
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
