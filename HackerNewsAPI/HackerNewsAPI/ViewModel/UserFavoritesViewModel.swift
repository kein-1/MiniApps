//
//  UserFavoritesViewModel.swift
//  HackerNewsAPI
//
//  Created by Kein Li on 3/16/24.
//

import Foundation
import Observation

@Observable
class UserFavoritesViewModel {
    var favorites : [Item]?
    
    init() {
        self.favorites = loadFavorites()
    }
    
    var retrievedFavorites: [Item] {
        guard let unwrapped = favorites else {
            return [Item]()
        }
        return unwrapped
    }
    
    
    func loadFavorites() -> [Item]? {
        let key = "favorite-stories"
        
        if let encodedData = UserDefaults.standard.data(forKey: key) {
            if let decodedData = try? JSONDecoder().decode([Item].self, from: encodedData) {
                return decodedData
            }
        }
        return nil
    }
    
    
    
    
}

extension UserFavoritesViewModel {
    
    func printUserDefaults() {
        let key = "favorite-stories"
        
        guard let encodedData = UserDefaults.standard.data(forKey: key) else {
            print("no key/data")
            return
        }
        
        guard let decodedData = try? JSONDecoder().decode([Item].self, from: encodedData) else {
            print("no decoded data")
            return
        }
        print(decodedData)
    }
}
