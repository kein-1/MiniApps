//
//  CommentViewModel.swift
//  HackerNewsAPI
//
//  Created by Kein Li on 3/16/24.
//

import Foundation
import Observation


@Observable
class CommentViewModel {
    
    var comments = [Item:[Item]]()
    var isFetching = true
    var expand = false
    
    var showMoreButtonStatus: Bool {
        return !comments.isEmpty
    }
    
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
            print(error)
            print("error in retrieval")
        }
    }
}
