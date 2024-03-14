//
//  CommentView.swift
//  HackerNewsAPI
//
//  Created by Kein Li on 3/14/24.
//

import SwiftUI

struct CommentView: View {
    
    let comment: Item
    @Binding var storyViewModel: StoryViewModel
    @State var expand = false
    
    
    var showMoreButtonStatus: Bool {
        comment.childCommentCount > 0 && expand == false
    }
    
    var body: some View {
        VStack(alignment:.leading, spacing: 5) {
            HStack {
                Text("\(comment.by ?? "") | ")
                    .font(.headline)
                Text("\(comment.displayTime)")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
            Text(comment.content ?? "")
            if showMoreButtonStatus {
                showMoreButton
            }
            if expand {
                List {
                    collapseButton
                    ForEach(storyViewModel.comments[comment] ?? [Item](), id: \.self) { comment in
                            CommentView(comment: comment, storyViewModel: $storyViewModel)
                    }
                }
            }
        }
        .onChange(of: expand) {
            Task {
                print("this ran")
                await storyViewModel.getComments(for: comment)
            }
        }
    }
    
    var showMoreButton: some View {
        Button {
            withAnimation {
                expand.toggle()
            }
        } label: {
            Label("See More", systemImage: "ellipsis")
        }
    }
    
    var collapseButton: some View {
        Button {
            withAnimation {
                expand.toggle()
            }
        } label: {
            Label("Collapse", systemImage: "chevron.up.circle")
        }
    }
}
//
//#Preview {
//    CommentView(comment: Item.mockComment())
//}
