//
//  CommentParentView.swift
//  HackerNewsAPI
//
//  Created by Kein Li on 3/14/24.
//

import SwiftUI



/// The root comment for each story, with collapse/expand buttons
/// If each root comment has a child, show the child if the expand button is clicked
struct CommentRootView: View {
    
    let comment: Item
    var level: Int = 0
    
    @State var commentViewModel = CommentViewModel()
    
    var body: some View {
        HStack {
            if level != 0 {
                Divider()
                    .frame(width: 3)
                    .overlay(.orange)
                    .padding(.trailing, 10)
            }
            
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
                
                if comment.childCommentCount > 0 && !commentViewModel.expand {
                    expandButton
                }
                
                if commentViewModel.expand {
                    collapseButton
                    ForEach(commentViewModel.comments[comment] ?? [Item](), id: \.self) { comment in
                        CommentRootView(comment: comment, level: self.level + 1)
                            .padding(.leading,10)
                    }
                }
            }
        }
        .fixedSize(horizontal: false, vertical: true)
        .padding([.top,.bottom], 10)
    }
    
    
    var expandButton: some View {
        Button {
            withAnimation {
                commentViewModel.expand = true
                Task {
                    await commentViewModel.getComments(for: comment)
                }
            }
        } label: {
            Label("See Comments", systemImage: "chevron.down.circle")
                .labelStyle(.titleAndIcon)
                .foregroundStyle(.orange)
                .font(.subheadline)
        }
    }
    
    var collapseButton: some View {
        Button {
            withAnimation {
                commentViewModel.expand = false
            }
        } label: {
            Label("Collapse", systemImage: "chevron.up.circle")
                .labelStyle(.titleAndIcon)
                .foregroundStyle(.orange)
                .font(.subheadline)
        }
    }
}
