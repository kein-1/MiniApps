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
    
    func getStories(for storyType: GetCase) async {
        do {
            stories = try await NetworkManager.shared.fetchAllStories(for: storyType)
            isFetching = false
        } catch {
            print("error in retrieval")
        }
    }
    
}

