//
//  CommentHeadLineView.swift
//  HackerNewsAPI
//
//  Created by Kein Li on 3/14/24.
//

import SwiftUI

struct CommentHeadLineView: View {
    let comment: Item
    var body: some View {
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
}
//
//#Preview {
//    CommentHeadLineView()
//}
