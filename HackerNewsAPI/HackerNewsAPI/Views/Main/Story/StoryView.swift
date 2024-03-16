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
    
    var body: some View {
        
        ScrollView {
            if storyViewModel.isFetching {
                Progress()
            } else {
                Section {
                    StoryHeadLineView(storyViewModel: $storyViewModel, story: story)
                }
                
                Divider()
                
                LazyVStack(alignment: .leading) {
                    ForEach(storyViewModel.comments[story] ?? [Item](), id: \.self) { comment in
                        CommentRootView(comment: comment, storyViewModel: $storyViewModel)
                    }
                }
                .padding()
            }
            
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await storyViewModel.getComments(for: story)
        }
    }
}

//#Preview {
//    StoryView(story: Item.mockStory())
//}
