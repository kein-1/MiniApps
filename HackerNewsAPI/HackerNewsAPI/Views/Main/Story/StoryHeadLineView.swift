//
//  StoryHeadLineView.swift
//  HackerNewsAPI
//
//  Created by Kein Li on 3/16/24.
//

import Foundation


import SwiftUI

struct StoryHeadLineView: View {
        
    @Binding var storyViewModel : StoryViewModel
    
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
                
                Button {
                    storyViewModel.saveItem(for: story)
                } label: {
                    Label("Favorite" , systemImage: "heart")
                        .customLabelModifier()
                        .foregroundStyle(.cyan)
                }

            }
            .padding(.top, 10)
            .font(.caption.bold())
        }
    }
}

#Preview {
    @State var vm = StoryViewModel()
    return StoryHeadLineView(storyViewModel: $vm, story: Item.mockStory())
}

