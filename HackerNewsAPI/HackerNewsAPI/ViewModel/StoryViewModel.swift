//
//  StoryViewModel.swift
//  HackerNewsAPI
//
//  Created by Kein Li on 3/14/24.
//

import Foundation
import Observation


@Observable
class StoryViewModel {
    
    var comments = [Item:[Item]]()
    var isFetching = true
        
    
    
    func getComments(for item: Item) async {
        do {
            let commentItems = try await NetworkManager.shared.fetchAllComments(for: item)
            comments[item] = commentItems
            print(item.by!, item.id)
            print(commentItems)
            isFetching = false
        } catch {
            print("error in retrieval")
        }
    }
}


//  "by" : "norvig",
//  "id" : 2921983,
//  "kids" : [ 2922097, 2922429, 2924562, 2922709, 2922573, 2922140, 2922141 ],
//  "parent" : 2921506,
//  "text" : "Aw shucks, guys ... you make me blush with your compliments.<p>Tell you what, Ill make a deal: I'll keep writing if you keep reading. K?",
//  "time" : 1314211127,
//  "type" : "comment"
//}
