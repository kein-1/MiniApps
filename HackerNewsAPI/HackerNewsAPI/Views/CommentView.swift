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
        
        VStack {
            HStack {
                Divider()
                    .frame(width: 3)
                    .overlay(.orange)
                
                VStack(alignment:.leading, spacing: 5) {
                    
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("\(comment.by ?? "") | ")
                                .font(.headline)
                            Text("\(comment.displayTime)")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                        }
                        Text(comment.content ?? "")
                            .fontDesign(.rounded)
                            .font(.subheadline)
                    }
                    
                    if moreComments {
                        ForEach(storyViewModel.comments[comment] ?? [Item](), id: \.self) { comment in
                            CommentView(comment: comment, storyViewModel: storyViewModel)
                                .padding(.leading,16)
                        }
                    }
                }
            }
            .fixedSize(horizontal: false, vertical: true)
        }
        .padding([.top,.bottom], 10)
        .task {
            if moreComments {
                await storyViewModel.getComments(for: comment)
//                await storyViewModel.getCommentsMock(for: comment)
            }
        }
    }
}
//
//#Preview {
//    CommentView(comment: Item.mockComment())
//}
