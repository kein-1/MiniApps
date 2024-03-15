//
//  HackerNewsViewModel.swift
//  HackerNewsAPI
//
//  Created by Kein Li on 3/13/24.
//

import Foundation
import Observation


@Observable
class HackerNewsViewModel {
    
    var stories = [Item]()
    var isFetching = true
    var searchableText = ""
    
    var filteredStories: [Item] {
        if searchableText.isEmpty { return stories }
        
        return stories.filter{$0.title?.localizedCaseInsensitiveContains(searchableText) ?? false}
    }
    
    func getStories(for storyType: GetCase) async {
        do {
            stories = try await NetworkManager.shared.fetchAllStories(for: storyType)
            isFetching = false
        } catch {
            print("error in retrieval")
        }
    }
    
    
    
}

