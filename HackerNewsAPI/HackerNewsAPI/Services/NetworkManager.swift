//
//  NetworkManager.swift
//  HackerNewsAPI
//
//  Created by Kein Li on 3/11/24.
//

import Foundation


enum NetworkErrors: Error {
    case invalidURL
    case invalidRequest
}


/// Singleton Network Manager
class NetworkManager {
    
    static var shared = NetworkManager()
    
    private init() { }
    
    
    // MARK: API call methods
    
    /// Fetch as many items concurrently as possible
    /// - Parameter storyType: the type of stories to return
    /// - Returns: a list of stories
    func fetchAllStories(for storyType: GetCase) async throws -> [Item] {
        
        // fetch all Ids based on what type of story
        let ids = try await fetchStoryIDs(for: storyType)
        
        // Fetch all stories concurrently using withThrowingTaskGroup
        let stories: [Item] = try await withThrowingTaskGroup(of: Item.self) { group in
            var listOfStories = [Item]()
            
            // results get stored in a group
            for id in ids {
                group.addTask {
                    return try await self.fetchItem(for: id) // no retain cycle possible because of structured concurrency. tasks don't outlive the scope they are defined in
                }
            }
            
            for try await item in group {
                listOfStories.append(item)
            }
            
            return listOfStories
        }
        return stories
    }
    
    
    /// Fetch as many items concurrently as possible
    /// - Parameter item: the type of item(story/commment)
    /// - Returns: a list of comment items
    func fetchAllComments(for item: Item) async throws -> [Item] {
        
        guard let ids = item.childCommentIDs else {
            return [Item]()
        }
            
        // Fetch all stories concurrently using withThrowingTaskGroup
        let comments: [Item] = try await withThrowingTaskGroup(of: Item.self) { group in
            var listOfComments = [Item]()
            
            // results get stored in a group
            for id in ids {
                group.addTask {
                    return try await self.fetchItem(for: id) // no retain cycle possible because of structured concurrency. tasks don't outlive the scope they are defined in
                }
            }
            
            for try await item in group {
                listOfComments .append(item)
            }
            
            return listOfComments
        }
        return comments
    }
    
    
    /// Fetches the item
    /// - Parameter id: id of the item
    /// - Returns: Item.self
    func fetchItem(for id: Int) async throws -> Item {
        
        guard let url = URL(string: "https://hacker-news.firebaseio.com/v0/item/\(id).json") else {
            throw NetworkErrors.invalidURL
        }
        
        let (data,response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkErrors.invalidRequest
        }
        
        let decoder = JSONDecoder()
        let decodedData = try decoder.decode(Item.self, from: data)
        return decodedData
    }
    
    
    /// Returns an array of the best/new/top stories
    func fetchStoryIDs(for storyType: GetCase) async throws -> [Int] {
        guard let url = URL(string: "https://hacker-news.firebaseio.com/v0/\(storyType.rawValue).json") else {
            throw NetworkErrors.invalidURL
        }
        
        let (data,response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkErrors.invalidRequest
        }
        
        let decoder = JSONDecoder()
        let decodedData = try decoder.decode([Int].self, from: data)
        return decodedData
    }
}


// "https://www.donnywals.com/running-tasks-in-parallel-with-swift-concurrencys-task-groups/" - great reference for understanding task groups
