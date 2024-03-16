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
            var commentItems = try await NetworkManager.shared.fetchAllComments(for: item)
            commentItems = commentItems.filter { item in
                guard let status = item.deleted else { return true }
                return status == false
            }
            comments[item] = commentItems
            isFetching = false
        } catch {
            print("error in retrieval")
        }
    }
}


extension StoryViewModel {
    func buildMockData() {
        let story = Item.mockStory()
        
        let commentZero = Item(id: 0,
                        deleted: nil,
                        type: "comment",
                        by: "norvig",
                        dead: nil,
                        parent: 2921506,
                        poll: nil,
                        url: nil,
                        score: nil,
                        title: "i am a title",
                        parts: nil,
                        commentCount: nil,
                        creationTime:  1314211127,
                        childCommentIDs: [1,2],
                        content: "I am root comment")
        
        comments[story] = [commentZero]
        
        let commentOne = Item(id: 1,
                              deleted: nil,
                              type: "comment",
                              by: "norvig",
                              dead: nil,
                              parent: 2921506,
                              poll: nil,
                              url: nil,
                              score: nil,
                              title: "some title 1" ,
                              parts: nil,
                              commentCount: nil,
                              creationTime:  1314211127,
                              childCommentIDs: [],
                              content: "I am a child comment 1")
        
        let commentTwo = Item(id: 2,
                              deleted: nil,
                              type: "comment",
                              by: "norvig",
                              dead: nil,
                              parent: 2921506,
                              poll: nil,
                              url: nil,
                              score: nil,
                              title: "some title 2",
                              parts: nil,
                              commentCount: nil,
                              creationTime:  1314211127,
                              childCommentIDs: [3],
                              content: "I am a child comment 2")
        
        comments[commentZero] = [commentOne,commentTwo]
        
        let commentThree = Item(id: 3,
                                deleted: nil,
                                type: "comment",
                                by: "norvig",
                                dead: nil,
                                parent: 2921506,
                                poll: nil,
                                url: nil,
                                score: nil,
                                title: "some title 3",
                                parts: nil,
                                commentCount: nil,
                                creationTime:  1314211127,
                                childCommentIDs: [],
                                content: "I am a child comment 3")
        
        comments[commentTwo] = [commentThree]
    }
    
    func getCommentsMock(for item: Item) async {
        var commentItems = comments[item] ?? [Item]()
        commentItems = commentItems.filter { item in
            guard let status = item.deleted else { return true }
            return status == false
        }
        comments[item] = commentItems
        isFetching = false
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
