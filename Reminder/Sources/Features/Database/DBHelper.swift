//
//  DBHelper.swift
//  Reminder
//
//  Created by Bruna Porato on 09/12/25.
//

import Foundation
import SQLite3

class DBHelper {
    static let shared = DBHelper()
    
    private var db: OpaquePointer?
    
    private init() {
        openDatabase()
        createTable()
    }
    
    private func openDatabase() {
        let fileURL = try! FileManager.default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("Reminder.sqlite")
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("Error opening database")
        }
            
    }
    
    private func createTable() {
        let createTableQuery =  """
        CREATE TABLE IF NOT EXISTS Receipts (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            medicine TEXT,
            time TEXT,
            recurrency TEXT,
            takenNow INTEGER
        );
        """
        
        var statement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, createTableQuery, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Successfully created table")
            } else {
                print("Failed to create table")
            }
        } else {
            print("CreateTable statement failed")
        }
        
        sqlite3_finalize(statement)
    }
    
    func insertReceipt(medicine: String, time: String, recurrency: String, takenNow: Bool) {
        let insertQuery = "INSERT INTO Receipts (medicine, time, recurrency, takenNow) VALUES (?, ?, ?, ?);"
        var statement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, insertQuery, -1, &statement, nil) == SQLITE_OK {
            sqlite3_bind_text(statement, 1, (medicine as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 2, (time as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 3, (recurrency as NSString).utf8String, -1, nil)
            sqlite3_bind_int(statement, 4, (takenNow ? 1 : 0))
            
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Successfully inserted receipt")
            } else {
                print("Failed to insert receipt")
            }
        } else {
            print("INSERT statement compilation failed")
        }
        
        sqlite3_finalize(statement)
    }
    
    func fetchReceipts() -> [Medicine] {
        let fetchQuery = "SELECT medicine, time, recurrency FROM Receipts"
        var statement: OpaquePointer?
        var receipts: [Medicine] = []
        
        if sqlite3_prepare(db, fetchQuery, -1, &statement, nil) == SQLITE_OK {
            while sqlite3_step(statement) == SQLITE_ROW {
                let medicine = String(cString: sqlite3_column_text(statement, 0))
                let time = String(cString: sqlite3_column_text(statement, 1))
                let recurrency = String(cString: sqlite3_column_text(statement, 2))
                receipts.append(Medicine(medicine: medicine, time: time, recurrency: recurrency))
            }
        } else {
            print("SELECT statement failed")
        }
        
        sqlite3_finalize(statement)
        
        return receipts
    }
}
