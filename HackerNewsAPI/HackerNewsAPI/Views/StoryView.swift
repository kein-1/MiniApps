//
//  StoryView.swift
//  HackerNewsAPI
//
//  Created by Kein Li on 3/14/24.
//

import SwiftUI

struct StoryView: View {
    
    let story: Item
    @State var storyViewModel = StoryViewModel()
    @State var item = Item.mockComment()
    
    var body: some View {
        ScrollView {
            Section {
                StoryListView(story: story)
            }
            
            Divider()
            
            LazyVStack(alignment: .leading) {
                ForEach(storyViewModel.comments[story] ?? [Item](), id: \.self) { comment in
                    CommentRootView(comment: comment, storyViewModel: $storyViewModel)
                }
            }
            .padding()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await storyViewModel.getComments(for: story)
//            storyViewModel.buildMockData()
//            await storyViewModel.getCommentsMock(for: story)
        }
    }
}

#Preview {
    StoryView(story: Item.mockStory())
}
