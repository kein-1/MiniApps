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
//    
//    init(id: Int64? = nil, name: String, amount: Double, date: Date) {
//        self.id = id
//        self.name = name
//        self.amount = amount
//        self.date = date
//    }
    
}


// For auto increment keys, conform to MutablePersistableRecord's and implement didInsert
extension Expense :  MutablePersistableRecord{
    mutating func didInsert(_ inserted: InsertionSuccess) {
        id = inserted.rowID
    }

}
