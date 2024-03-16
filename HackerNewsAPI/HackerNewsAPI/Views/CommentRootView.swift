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
    @Binding var storyViewModel: StoryViewModel
    @State var expand = false
    
    
    var showMoreButtonStatus: Bool {
        comment.childCommentCount > 0 && expand == false
    }
    
    var body: some View {
        LazyVStack(alignment:.leading, spacing: 5) {
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
            
            if showMoreButtonStatus {
                expandButton
            }
            if expand {
                collapseButton
                ForEach(storyViewModel.comments[comment] ?? [Item](), id: \.self) { comment in
                    CommentView(comment: comment, storyViewModel: storyViewModel)
                        .padding(.leading,16)
                }
            }
        }
        .padding(.bottom, 15)
        .onChange(of: expand) {
            Task {
                await storyViewModel.getComments(for: comment)
//                await storyViewModel.getCommentsMock(for: comment)
            }
        }
    }
    
    var expandButton: some View {
        Button {
            withAnimation {
                expand.toggle()
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
                expand.toggle()
            }
        } label: {
            Label("Collapse", systemImage: "chevron.up.circle")
                .labelStyle(.titleAndIcon)
                .foregroundStyle(.orange)
                .font(.subheadline)
        }
    }
}
