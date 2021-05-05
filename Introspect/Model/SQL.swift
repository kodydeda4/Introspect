//
//  SQL.swift
//  Introspect
//
//  Created by Kody Deda on 4/12/21.
//

import Foundation
import SQLite

struct SQL {
    private var db: Connection
    private var path: String
    
    init() {
//        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
//        self.db = try! Connection("\(path)/db.sqlite3")
        self.db = try! Connection(.temporary)
        self.path = "see above"
        db.trace { print($0) }
    }

    
    func example() {
        
        // I. Creating a Table
        let personalityTypes = Table("users")
        let id       = Expression<Int64>("id")
        let name     = Expression<String?>("name")
        let email    = Expression<String>("email")
        
        do {
            try db.run(personalityTypes.create { t in
                t.column(id, primaryKey: true)
                t.column(name)
                t.column(email, unique: true)
            })
        } catch {
            print("creation failed: \(error)")
        }
        
        // II. INSERT - Inserting rows (returns an Int64 representing the row’s ROWID.)
        do {
            let rowid1 = try db.run(personalityTypes.insert(email <- "alice@mac.com", name <- "Alice A."))
            let rowid2 = try db.run(personalityTypes.insert(email <- "mike@mac.com", name <- "Mike B."))
            let rowid3 = try db.run(personalityTypes.insert(email <- "sarah@mac.com", name <- "Sarah C."))
            print("inserted id: \(rowid1)")
            print("inserted id: \(rowid2)")
            print("inserted id: \(rowid3)")
        } catch {
            print("insertion failed: \(error)")
        }
        
        // III. SELECT - Iterating and Accessing Values
        do {
            for user in try db.prepare(personalityTypes) {
                print("id: \(user[id]), email: \(user[email]), name: \(String(describing: user[name]))")
            }
            for user in try db.prepare(personalityTypes.select(id, email)) {
                print("id: \(user[id]), email: \(user[email])")
            }
        } catch {
            print("iteration failed: \(error)")
        }
    }
    
//    enum Query: String, Identifiable, CaseIterable {
//        var id: Query { self }
//
//        // Examples
//        // https://tinyurl.com/r4c6nmk
//        case createUsersTable = "Create users Table"
//        case createPostsTable = "Create posts Table"
//        case addAliceUser     = "Insert alice into users Table"
//        case selectAllFromUsers
//
//        // UNCW Required
//        case twoTableJoin              = "2-Table Join"
//        case threeTableJoin            = "3-Table Join"
//        case selfJoin                  = "Self Join"
//        case aggregateFunction         = "Aggregate Function"
//        case aggregateFunctionExtended = "Aggregate Function using GROUP BY and HAVING"
//        case textBasedSearch           = "Text-Based-Search Query using LIKE with wildcard(s)"
//        case subQuery                  = "Subquery"
//        case storedFunction            = "Stored Function"
//        case storedProcedure           = "Stored Procedure"
//        case trigger                   = "Trigger"
//
//        var code: String {
//            switch self {
//
//            case .createUsersTable:
//                return """
//                CREATE TABLE users (
//                    id INTEGER PRIMARY KEY NOT NULL,
//                    email TEXT UNIQUE NOT NULL,
//                    name TEXT
//                );
//                """
//            case .createPostsTable:
//                return """
//                CREATE TABLE posts (
//                    id INTEGER PRIMARY KEY NOT NULL,
//                    title TEXT NOT NULL,
//                    body TEXT NOT NULL,
//                    published_at DATETIME
//                );
//                """
//            case .addAliceUser:
//                return """
//                INSERT INTO users (email) VALUES ('alice@mac.com')
//                """
//
//            case .selectAllFromUsers:
//                return """
//                SELECT * FROM users
//                """
//
//            case .twoTableJoin:
//                return """
//                -- not yet implemented
//                """
//            case .threeTableJoin:
//                return """
//                -- not yet implemented
//                """
//
//            case .selfJoin:
//                return """
//                -- not yet implemented
//                """
//
//            case .aggregateFunction:
//                return """
//                -- not yet implemented
//                """
//
//            case .aggregateFunctionExtended:
//                return """
//                -- not yet implemented
//                """
//
//            case .textBasedSearch:
//                return """
//                -- not yet implemented
//                """
//
//            case .subQuery:
//                return """
//                -- not yet implemented
//                """
//
//            case .storedFunction:
//                return """
//                -- not yet implemented
//                """
//
//            case .storedProcedure:
//                return """
//                -- not yet implemented
//                """
//
//            case .trigger:
//                return """
//                -- not yet implemented
//                """
//
//            }
//        }
//    }
}


