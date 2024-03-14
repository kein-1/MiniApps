//
//  ItemView.swift
//  HackerNewsAPI
//
//  Created by Kein Li on 3/13/24.
//

import SwiftUI

struct StoryListView: View {
    var story: Item
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(story.title ?? "")
                .font(.headline.bold())
            
            HStack {
                Text((story.url ?? ""))
                    .lineLimit(1)
                    .truncationMode(.tail)
                Text("|")
                Text(story.displayTime)
                Text("|")
                Text("by : \(story.by ?? "")")
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
            .font(.footnote)
            .foregroundStyle(.gray)
            
            
            HStack() {
                Label(String(story.score ?? 0) , systemImage: "arrowshape.up")
                    .foregroundStyle(.cyan)
                    .labelStyle(.titleAndIcon)
                Label(String(story.commentCount ?? 0) , systemImage: "text.bubble.rtl")
                    .foregroundStyle(.orange)
                    .labelStyle(.titleAndIcon)
            }
            .font(.caption.bold())
        }
    }
}
//
//#Preview {
//    StoryListView(story: Item.mockStory())
//}
//
//
//
