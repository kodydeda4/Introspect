//
//  SQLAction.swift
//  Introspect
//
//  Created by Kody Deda on 4/12/21.
//

import Foundation

enum SQLAction: String, Identifiable, CaseIterable {
    var id: SQLAction { self }
    
    // Taken from https://github.com/stephencelis/SQLite.swift/blob/master/Documentation/Index.md#executing-arbitrary-sql
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
