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
            HStack {
                Divider()
                    .frame(width: 3)
                    .overlay(.orange)
                
                LazyVStack(alignment:.leading, spacing: 5) {
                    HStack {
                        Text("\(comment.by ?? "") | ")
                            .font(.headline)
                        Text("\(comment.displayTime)")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                    .padding(.bottom, 10)
                    
                    Text(comment.content?.htmlToString() ?? "")
                        .fontDesign(.rounded)
                        .font(.subheadline)
                    
                    if moreComments {
                        ForEach(storyViewModel.comments[comment] ?? [Item](), id: \.self) { comment in
                            CommentView(comment: comment, storyViewModel: storyViewModel)
                                .padding(.leading,16)
                        }
                    }
                }
            }
            .fixedSize(horizontal: false, vertical: true)
            .padding([.top,.bottom], 10)
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
