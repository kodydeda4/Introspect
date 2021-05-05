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
    
    func execute(_ query: SQL.Query) {
        do {
            try db.execute(query.code)
        }
        catch {}
    }
    
    func example() {
        do {
            
        // I. Creating a Table
        let users = Table("users")
            
        let id       = Expression<Int64>("id")
        let email    = Expression<String>("email")
        let balance  = Expression<Double>("balance")
        let verified = Expression<Bool>("verified")
        let name     = Expression<String?>("name")
            
        try db.run(users.create { t in     // CREATE TABLE "users" (
            t.column(id, primaryKey: true) //     "id" INTEGER PRIMARY KEY NOT NULL,
            t.column(email, unique: true)  //     "email" TEXT UNIQUE NOT NULL,
            t.column(name)                 //     "name" TEXT
        })                                 // )
        
        // II. Inserting Rows
        // The insert function, when run successfully, returns an Int64 representing the inserted row’s ROWID.
        do {
            let rowid1 = try db.run(users.insert(email <- "alice@mac.com", name <- "Alice A.")) // INSERT INTO "users" ("email", "name") VALUES ('alice@mac.com', 'Alice A.')
            let rowid2 = try db.run(users.insert(email <- "mike@mac.com", name <- "Mike B."))   // INSERT INTO "users" ("email", "name") VALUES ('mike@mac.com', 'Mike B.')
            let rowid3 = try db.run(users.insert(email <- "sarah@mac.com", name <- "Sarah C.")) // INSERT INTO "users" ("email", "name") VALUES ('sarah@mac.com', 'Sarah C.')
            
            print("inserted id: \(rowid1)")
            print("inserted id: \(rowid2)")
            print("inserted id: \(rowid3)")
        } catch {
            print("insertion failed: \(error)")
        }
            
        // III. Iterating and Accessing Values
        for user in try db.prepare(users) {
            print("id: \(user[id]), email: \(user[email]), name: \(user[name])")
            // id: 1, email: alice@mac.com, name: Optional("Alice")
        }
        // SELECT * FROM "users"
            
            
        
            
            
            
            
        //-----------------------------------------------------------------------------
        } catch {
            print("Error.")
        }
    }
    
    enum Query: String, Identifiable, CaseIterable {
        var id: Query { self }
        
        // Examples
        // https://tinyurl.com/r4c6nmk
        case createUsersTable = "Create users Table"
        case createPostsTable = "Create posts Table"
        case addAliceUser     = "Insert alice into users Table"
        case selectAllFromUsers
        
        // UNCW Required
        case twoTableJoin              = "2-Table Join"
        case threeTableJoin            = "3-Table Join"
        case selfJoin                  = "Self Join"
        case aggregateFunction         = "Aggregate Function"
        case aggregateFunctionExtended = "Aggregate Function using GROUP BY and HAVING"
        case textBasedSearch           = "Text-Based-Search Query using LIKE with wildcard(s)"
        case subQuery                  = "Subquery"
        case storedFunction            = "Stored Function"
        case storedProcedure           = "Stored Procedure"
        case trigger                   = "Trigger"
        
        var code: String {
            switch self {
            
            case .createUsersTable:
                return """
                CREATE TABLE users (
                    id INTEGER PRIMARY KEY NOT NULL,
                    email TEXT UNIQUE NOT NULL,
                    name TEXT
                );
                """
            case .createPostsTable:
                return """
                CREATE TABLE posts (
                    id INTEGER PRIMARY KEY NOT NULL,
                    title TEXT NOT NULL,
                    body TEXT NOT NULL,
                    published_at DATETIME
                );
                """
            case .addAliceUser:
                return """
                INSERT INTO users (email) VALUES ('alice@mac.com')
                """
            
            case .selectAllFromUsers:
                return """
                SELECT * FROM users
                """
            
            case .twoTableJoin:
                return """
                -- not yet implemented
                """
            case .threeTableJoin:
                return """
                -- not yet implemented
                """

            case .selfJoin:
                return """
                -- not yet implemented
                """

            case .aggregateFunction:
                return """
                -- not yet implemented
                """

            case .aggregateFunctionExtended:
                return """
                -- not yet implemented
                """

            case .textBasedSearch:
                return """
                -- not yet implemented
                """

            case .subQuery:
                return """
                -- not yet implemented
                """

            case .storedFunction:
                return """
                -- not yet implemented
                """

            case .storedProcedure:
                return """
                -- not yet implemented
                """

            case .trigger:
                return """
                -- not yet implemented
                """

            }
        }
    }
}


