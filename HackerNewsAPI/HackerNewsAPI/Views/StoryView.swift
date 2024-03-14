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
        VStack {
            StoryListView(story: story)
            
            List {
                ForEach(storyViewModel.comments[story] ?? [Item](), id: \.self) { comment in
                    Section {
                        CommentView(comment: comment, storyViewModel: $storyViewModel)
                    }
                }
            }
            .listSectionSpacing(.compact)
        }
        
        .task {
            await storyViewModel.getComments(for: story)
        }
    }
}

#Preview {
    StoryView(story: Item.mockStory())
}
