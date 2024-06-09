//
//  DBHelper.swift
//  SmallExpenses
//
//  Created by Kein Li on 6/7/24.
//

import Foundation


// Initialize DB
class DBHelper {
    
    /// Copies the DB from Bundle to Documents for CRUD, if needed
    /// - Returns: the Path to the copied db
    static func copyDB() -> String? {
        do {
            let documentURL = URL.documentsDirectory
            let finalDBUrl = documentURL.appending(path: "mockDB.db", directoryHint: .checkFileSystem)
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: finalDBUrl.path) {
                print("a file exists! its name is : \(finalDBUrl.path(percentEncoded: false))")
                return finalDBUrl.path(percentEncoded: false)
            } else {
                guard let bundleDBPath = Bundle.main.path(forResource: "mockDB", ofType: ".db") else {
                    print("db does not exist here")
                    return nil
                }
                
                print("****")
                print("documentsURL : \(documentURL.path(percentEncoded: true)))")
                
                print("****")
                print("finalDBURL : \(finalDBUrl.path(percentEncoded: true))")
                
                print("****")
                print("Bundle DB Path : \(bundleDBPath)")
                
                try fileManager.copyItem(atPath: bundleDBPath, toPath: finalDBUrl.path)
                return finalDBUrl.path
            }
        } catch {
            print("***")
            print("error:", error)
        }
        return nil
    }
    
    static func deleteDBFromDocs() {
        
    }
}
