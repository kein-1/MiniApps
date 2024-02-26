//
//  DogViewModel.swift
//  DogAPIOne
//
//  Created by Kein Li on 2/25/24.
//

import Foundation
import Observation

@Observable
class DogViewModel {
    
    var dogs = [Dog]()
    
    // In View Model, call the network manager's method to fetch and return the data
    func fetchData() async {
        do {
            if let dog = try await NetworkManager.shared.getAPI() {
                dogs.append(dog)
            }
        } catch DogError.errorRequest {
            print("Error with making get request")
        } catch DogError.invalidData {
            print("Error converting data")
        } catch {
            print("Error!")
        }
    }
    
    
    func deleteFact(at indexSet: IndexSet) {
        dogs.remove(atOffsets: indexSet)
    }
    
    
    
}


