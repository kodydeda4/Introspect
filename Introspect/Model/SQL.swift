//
//  SQL.swift
//  Introspect
//
//  Created by Kody Deda on 4/12/21.
//

import Foundation
import SQLite

struct SQL {
    var db: Connection
    var path: String
    
    init() {
//        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
//        self.db = try! Connection("\(path)/db.sqlite3")
        self.db = try! Connection(.temporary)
        self.path = "see above"
        db.trace { print($0) }
    }
    
    enum Query: String, Identifiable, CaseIterable {
        var id: Query { self }
        
        // Examples
        // https://tinyurl.com/r4c6nmk
        case createUsersTable = "Create users Table"
        case createPostsTable = "Create posts Table"
        case addAliceUser     = "Insert alice into users Table"
        
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
            case .twoTableJoin:
                return """
                not yet implemented
                """
            case .threeTableJoin:
                return """
                not yet implemented
                """

            case .selfJoin:
                return """
                not yet implemented
                """

            case .aggregateFunction:
                return """
                not yet implemented
                """

            case .aggregateFunctionExtended:
                return """
                not yet implemented
                """

            case .textBasedSearch:
                return """
                not yet implemented
                """

            case .subQuery:
                return """
                not yet implemented
                """

            case .storedFunction:
                return """
                not yet implemented
                """

            case .storedProcedure:
                return """
                not yet implemented
                """

            case .trigger:
                return """
                not yet implemented
                """

            }
        }
    }
}


