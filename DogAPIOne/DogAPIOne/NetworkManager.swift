//
//  NetworkManager.swift
//  DogAPIOne
//
//  Created by Kein Li on 2/18/24.
//

import Foundation


enum DogError: Error {
    case errorRequest
    case invalidData
}




class NetworkManager {
    
    // Singleton
    static let shared = NetworkManager()
    private init() {}
    
    
    // async/await - frees up this thread to go do something else while the fetching from network occurs
    func getAPI() async throws -> Dog? {
                guard let url = URL(string: "https://dogapi.dog/api/v2/facts?limit=1") else { return nil }
        
        
        let (data, response) = try await URLSession.shared.data(from:url)
        
        // use as? to cast it to HTTPURLResponse and ensure the status code is 200
        // if neither works, then the guard trips and throws a custom error
        // throwing propogates up the function calls so we can handle the error
        // with do/catch in the function that calls this one
        // Important note: must use try to call functions that throw, and must
        // use await on async functions
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { throw DogError.errorRequest}
        
        
        // use try? to decode. If error, it returns nil so the guard code trips
        let decoder = JSONDecoder()
        guard let dog = try? decoder.decode(Dog.self, from: data) else {
            throw DogError.invalidData
        }
        return dog
    }
    
}
