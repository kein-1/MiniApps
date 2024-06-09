//
//  ExpenseRepository.swift
//  SmallExpenses
//
//  Created by Kein Li on 6/6/24.
//

import Foundation
import GRDB

protocol ExpenseRepository {
    func getAll() -> [Expense]
    func getOne(id: Int) -> Expense?
    func add(for expense: Expense) -> Bool
    func delete(for expense: Expense) -> Bool
    func update(for expense: Expense) -> Bool
}

class LocalRepository: ExpenseRepository {
    
    var dbQueue: DatabaseQueue? = nil
    
    init() {
        do {
            guard let dbPath = DBHelper.copyDB() else {
                return
            }
            let documentsURL = URL.documentsDirectory
            let finalDBUrl = documentsURL.appending(path: "mockDB.db", directoryHint: .checkFileSystem)
            print("-------")
            print("doc url:" , documentsURL.description)
            print("finalDB url: ", finalDBUrl)
            print("finalDB Path:", finalDBUrl.path)
            print(FileManager.default.fileExists(atPath: finalDBUrl.path))
            print("returned path: ", dbPath)
            dbQueue = try DatabaseQueue(path: dbPath)
        } catch {
            print("db connection error: ", error)
        }
    }
    
    func getAll() -> [Expense] {
        
        guard let dbQueue = dbQueue else {
            return [Expense]()
        }
        
        do {
            try dbQueue.read { db in
            }
        } catch {
            
        }
        
        return [Expense]()
    }
    
    func getOne(id: Int) -> Expense? {
        return nil
    }
    
    func add(for expense: Expense) -> Bool {
        return false
    }
    
    func delete(for expense: Expense) -> Bool {
        return false
    }
    
    func update(for expense: Expense) -> Bool {
        return false
    }
}
