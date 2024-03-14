//
//  CommentView.swift
//  HackerNewsAPI
//
//  Created by Kein Li on 3/14/24.
//

import SwiftUI



/// A comment view. If each comment has more children, load them as well
struct CommentView: View {
    
    let comment: Item
    let storyViewModel: StoryViewModel
    
    var moreComments: Bool {
        comment.childCommentCount > 0
    }
    
    var body: some View {
        VStack(alignment:.leading, spacing: 5) {
            CommentHeadLineView(comment: comment)
            
            if moreComments {
                ForEach(storyViewModel.comments[comment] ?? [Item](), id: \.self) { comment in
                        CommentView(comment: comment, storyViewModel: storyViewModel)
                        .padding(.leading,16)
                }
            }
        }
        .task {
            if moreComments {
                await storyViewModel.getComments(for: comment)
            }
        }
    }
}
//
//#Preview {
//    CommentView(comment: Item.mockComment())
//}
