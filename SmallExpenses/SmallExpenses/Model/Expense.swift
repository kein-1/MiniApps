//
//  Expense.swift
//  SmallExpenses
//
//  Created by Kein Li on 6/6/24.
//

import Foundation
import GRDB

struct Expense: FetchableRecord, PersistableRecord, Codable, Hashable {
   
    var id: Int64?
    var name : String
    var amount: Double
    let date: Date
    
}


// For auto increment keys, conform to MutablePersistableRecord's and implement didInsert
extension Expense :  MutablePersistableRecord{
    mutating func didInsert(_ inserted: InsertionSuccess) {
        id = inserted.rowID
    }

}
