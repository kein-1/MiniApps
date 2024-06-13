//
//  ExpenseRepository.swift
//  SmallExpenses
//
//  Created by Kein Li on 6/6/24.
//

import Foundation
import GRDB

protocol ExpenseRepository {
    
    // MARK: - Connections
    func openDB() throws
    func setupDBSchema() throws
    
    
    // MARK: - CRUD
    func getAll() throws -> [Expense]
    func getOne(id: Int) throws -> Expense
    func add(for expense: Expense) throws
    
    @discardableResult
    func delete(for expense: Expense) throws -> Bool
    func update(for expense: Expense) throws
    
}

class LocalRepository: ExpenseRepository {
    
    var dbQueue: DatabaseQueue?
    
    init() {
        do {
            try openDB()
            try setupDBSchema()
        } catch {
            print("db connection error: ", error)
        }
    }
    
    func openDB() throws {
        let documentURL = URL.documentsDirectory
        let finalDBUrl = documentURL.appending(path: "expenseDB.db", directoryHint: .checkFileSystem)
        dbQueue = try DatabaseQueue(path: finalDBUrl.path)
        print("database connection is established and db initialized at : \(finalDBUrl.path)")
    }
    
    
    func setupDBSchema() throws {
        guard let dbQueue else {
            throw ConnectionError.notOpened
        }
        
        try dbQueue.write { db in
            try db.create(table: "expense", options: .ifNotExists) { table in
               table.autoIncrementedPrimaryKey("id")
               table.column("name", .text).notNull()
               table.column("amount", .double).notNull()
               table.column("date", .datetime).notNull()
           }
        }
    }
    
    func getAll() throws -> [Expense] {
        guard let dbQueue else {
            throw ConnectionError.notOpened
        }
        
        return try dbQueue.read { db in
            let expenses = try Expense.fetchAll(db)
            return expenses
        }
    }
    
    func getOne(id: Int) throws -> Expense {
        guard let dbQueue else {
            throw ConnectionError.notOpened
        }
        return Expense(id: 123, name: "", amount: 123, date: Date.now)
    }
    
    func add(for expense: Expense) throws {
        
        guard let dbQueue else {
            throw ConnectionError.notOpened
        }
        
        try dbQueue.write { db in
            try expense.insert(db)
        }
    }
    
    @discardableResult
    func delete(for expense: Expense) throws -> Bool {
        guard let dbQueue else {
            throw ConnectionError.notOpened
        }
        
        return try dbQueue.write { db in
            try expense.delete(db)
        }
    }
    
    func update(for expense: Expense) throws {
        guard let dbQueue else {
            throw ConnectionError.notOpened
        }
        
        guard let id = expense.id else {
            return
        }
        
        try dbQueue.write { db in
            var expense_ = try Expense.find(db, key: id)
            expense_.name = expense.name
            expense_.amount = expense.amount
            try expense_.update(db)
        }
    }
    
    
}
