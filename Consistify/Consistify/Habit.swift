//
//  Habit.swift
//  HabitTracker
//
//  Created by Kein Li on 12/15/23.
//

import Foundation
import SwiftData
import Observation


// Ensure this is a @Model. By default, @Model data are identifiable so we don't need id
@Model
class Habit{
    let name : String
    let type : HabitType
    let date : String
    var icon : String {
        switch self.type {
            
        case .fitness :
            return "figure.run"
        
        case .health:
            return "heart"
            
        case .study :
            return "book"
            
        case .misc:
            return "questionmark.circle"
            
        case .sleep :
            return "clock"
        }
    }
    var isCompleted = false
    
    // initializer
    init(name: String, type: HabitType, date: String) {
        self.name = name
        self.type = type
        self.date = date
    }
}


enum HabitType: String, CaseIterable, Codable{
    
    case fitness = "Exercise"
    case health = "Health"
    case study = "Study"
    case misc = "Misc"
    case sleep = "Sleep"
    
}


//
//
//class Habit : Identifiable, CustomDebugStringConvertible {
//    let id = UUID()
//    let name : String
////    let description : String
//    let type : HabitType
//    let date : String
//    var icon : String {
//        switch self.type {
//            
//        case .fitness :
//            return "figure.run"
//        
//        case .health:
//            return "heart"
//            
//        case .study :
//            return "book"
//            
//        case .misc:
//            return "questionmark.circle"
//            
//        case .sleep :
//            return "clock"
//        }
//    }
//    var isCompleted = false
//    
//    // initializer
//    init(name: String, type: HabitType, date: String) {
//        self.name = name
//        self.type = type
//        self.date = date
//    }
//    
//    var debugDescription : String {
//        return "Habit : \(id) \(name) \(type) \(date) \(icon) \(isCompleted)"
//    }
//    
//}
