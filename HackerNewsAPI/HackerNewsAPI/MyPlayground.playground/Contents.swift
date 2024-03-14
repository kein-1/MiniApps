import Foundation




enum NetworkErrors: Error {
    case invalidURL
    case invalidRequest
}



func fetchAllStories(for storyType: GetCase) async throws -> [Item] {
    
    // fetch all Ids based on what type of story
    let ids = try await fetchStoryIDs(for: storyType)
    
    // Fetch all stories concurrently using withThrowingTaskGroup
    let stories: [Item] = try await withThrowingTaskGroup(of: Item.self) { group in
        var listOfStories = [Item]()
        
        // results get stored in a group
        for id in ids {
            group.addTask {
                return try await fetchItem(for: id) // no retain cycle possible because of structured concurrency. tasks don't outlive the scope they are defined in
            }
        }
        
        for try await item in group {
            listOfStories.append(item)
        }
        
        return listOfStories
    }
    return stories
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

Task {
    do {
        let bestStory = GetCase.bestStories
        let result = try await fetchAllStories(for: bestStory)
        print(result)
    } catch {
        print(error)
    }
}
