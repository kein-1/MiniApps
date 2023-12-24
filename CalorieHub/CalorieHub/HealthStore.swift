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
    
    
    func requestAuthorization() {
        // These return optionals so unwrap. Basically sets up the data we want to read/write
        guard let stepCount = HKQuantityType.quantityType(forIdentifier: .stepCount) else { return }
        guard let caloriesBurned = HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned) else { return }
        guard let weight = HKQuantityType.quantityType(forIdentifier: .bodyMass) else { return }
        guard let height = HKQuantityType.quantityType(forIdentifier: .height) else { return }
        guard let walkingSpeed = HKQuantityType.quantityType(forIdentifier: .walkingSpeed) else { return }
        
        //Since healthStore is also optional, we need to unwrap here as well
        guard let healthStore = self.healthStore else { return }
        
        let allTypes = Set([stepCount, caloriesBurned, weight, height, walkingSpeed])
        
        healthStore.requestAuthorization(toShare: allTypes , read: allTypes) { (success, error) in
            if success {
            } else {
                print("error in authorization")
            }
        } // want to share and read everything
    }
    
    
    func requestAuthHeightWeight() {
        // These return optionals so unwrap. Basically sets up the data we want to read/write
       
        
        
        //Since healthStore is also optional, we need to unwrap here as well
        guard let healthStore = self.healthStore else { return }
        
        
        guard let weight = HKQuantityType.quantityType(forIdentifier: .bodyMass) else { return }
        guard let height = HKQuantityType.quantityType(forIdentifier: .height) else { return }
        
       
        
        let allTypes = Set([weight, height])
        
        healthStore.requestAuthorization(toShare: allTypes , read: allTypes) { (success, error) in
            if success {
                
            } else {
                print("error in authorization")
            }
        } // want to share and read everything
    }
    
    func savingUserWeightAndHeight(_ weight : Double, _ height : Double) {
        guard let healthStore = self.healthStore else { return }
        guard let weight = HKQuantityType.quantityType(forIdentifier: .bodyMass) else{ return }
        guard let height = HKQuantityType.quantityType(forIdentifier: .height) else { return }
        
        let statusWeight = healthStore.authorizationStatus(for: weight)
        let statusHeight = healthStore.authorizationStatus(for: height)
        
        if statusWeight.rawValue == 2 && statusHeight.rawValue == 2 {
            print("we are good")
        }
        
        
    }
    
}


