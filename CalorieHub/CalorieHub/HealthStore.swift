//
//  HealthManager.swift
//  CalorieHub
//
//  Created by Kein Li on 12/19/23.
//

import Foundation
import HealthKit
import Observation


enum HealthErrors : Error {
    case healthDataNotAvailable
    case authorization
}

@Observable
class HealthStore{
    
    var healthStore : HKHealthStore?
    var error : HealthErrors?
    
    init() {
        // Step 1 :
        // Check if it is available on this platform. If so, instantiate it
        if HKHealthStore.isHealthDataAvailable() {
            healthStore = HKHealthStore()
        } else {
            // probably add this as an error msg ?
            error = HealthErrors.healthDataNotAvailable
            print("HealthKit is not available on this platform.")
        }
    }
    
    
     // need to set these up in the app's p.list - keys required for getting this to work. Per docs : You must set the usage keys, or your app will crash when you request authorization.

//    Customize the messages displayed on the permissions sheet by setting the following keys:
//    NSHealthShareUsageDescription customizes the message for reading data.
//    NSHealthUpdateUsageDescription customizes the message for writing data.
    
    // HKHealthStore.requestAuthorization is async method, so we need to add async/await . it also throws error, so catch
    func requestAuthorization() {
        // These return optionals so unwrap. Basically sets up the data we want to read/write
        guard let stepCount = HKObjectType.quantityType(forIdentifier: .stepCount) else { return }
        guard let caloriesBurned = HKObjectType.quantityType(forIdentifier: .activeEnergyBurned) else { return }
        guard let weight = HKObjectType.quantityType(forIdentifier: .bodyMass) else { return }
        guard let walkingSpeed = HKObjectType.quantityType(forIdentifier: .walkingSpeed) else { return }
        
        //Since healthStore is also optional, we need to unwrap here as well
        guard let healthStore = self.healthStore else { return }
        
        let allTypes = Set([stepCount, caloriesBurned, weight, walkingSpeed])
        
        healthStore.requestAuthorization(toShare: allTypes , read: allTypes) { (success, error) in
            if !success {
                print("error in authorization")
            }
        } // want to share and read everything
        
    }
    
}


