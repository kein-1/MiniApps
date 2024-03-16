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
            
            
            HStack {
                Label(String(story.score ?? 0) , systemImage: "arrowshape.up")
                    .customLabelModifier()
                    .foregroundStyle(.orange)
                Label(String(story.commentCount ?? 0) , systemImage: "text.bubble.rtl")
                    .customLabelModifier()
                    .foregroundStyle(.cyan)
            }
            .padding(.top, 10)
            .font(.caption.bold())
        }
    }
}


// MARK: - Custom View Modifiers

struct CustomLabelModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .labelStyle(.titleAndIcon)
            .padding([.top,.bottom], 5)
            .padding([.horizontal], 15)
            .background {
                Capsule(style: .continuous)
                    .fill(.clear)
                    .strokeBorder(lineWidth: 1)
            }
    }
}

extension View {
    func customLabelModifier() -> some View {
        self.modifier(CustomLabelModifier())
    }
}


