//
//  UserGoals.swift
//  CalorieHub
//
//  Created by Kein Li on 12/31/23.
//

import SwiftUI
import SwiftData

@Model
class UserGoals {
    
    var weightGoal : Double?
    var stepsGoal : Double?
    
    init(_ weightGoal: Double?, _ stepsGoal: Double?) {
        self.weightGoal = weightGoal
        self.stepsGoal = stepsGoal
    }
}
