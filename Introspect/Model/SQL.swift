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
    }
    
    enum Query: String, Identifiable, CaseIterable {
        var id: Query { self }

        case createTables              = "Create Tables"
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
            
            case .createTables:
                return """
                create table PersonalityType(
                  personalityId integer primary key not null,
                  description text,
                  fourLetterCode text
                  
                );

                create table PersonalitySpectrum(
                  id integer,
                  introversion float
                );

                create table Response(
                  responseId integer primary key not null,
                  response TEXT
                );

                create table Question(
                  questionId integer primary key not null,
                  content TEXT,
                  responseId integer,
                  personalitySpectrumId integer,
                  FOREIGN KEY (personalitySpectrumId) REFERENCES PersonalitySpectrum(id),
                  FOREIGN KEY (responseId) REFERENCES Response(responseId)
                );

                CREATE TABLE Person (
                  personId INTEGER PRIMARY KEY NOT NULL,
                  name TEXT,
                  assessmentResults TEXT NOT NULL
                );
                  
                Create table Assessment(
                 assessmentId integer primary key not null,
                 personId integer,
                 questionId integer,
                 personalityType integer,
                 FOREIGN KEY (questionid) REFERENCES Question(questionId)
                 FOREIGN KEY (personId) REFERENCES Person(personId)
                 FOREIGN KEY (personalityType) REFERENCES PersonalityType(personalityId)
                );
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


