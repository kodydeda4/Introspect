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
                  assessmentsTaken INTEGER,
                  assessmentResults TEXT NOT NULL
                );
                  
                Create table Assessment(
                 assessmentId integer primary key not null,
                 personId integer,
                 questionId integer,
                 assessmentCount integer,
                 personalityType integer,
                 FOREIGN KEY (questionid) REFERENCES Question(questionId)
                 FOREIGN KEY (personId) REFERENCES Person(personId)
                 FOREIGN KEY (personalityType) REFERENCES PersonalityType(personalityId)
                );
            """

            case .twoTableJoin:
                return """
                SELECT Assessment.assessmentId, Assessment.questionId
                FROM Assessment
                INNER JOIN Question ON Question.questionId = Assessmet.questionId;
                """
            case .threeTableJoin:
                return """
                SELECT Assessment.assessmentId, Assessment.questionId
                FROM Assessment
                INNER JOIN Question ON Question.questionId = Assessmet.questionId
                INNER JOIN PersonalitySpectrum ON PersonalitySpectrum.Id = Question.personalitySpectrumId;
                """

            case .selfJoin:
                return """
                SELECT A.questionId as Assessment1, B.questionId as Assessment2
                FROM Assessment A, Assessment B
                WHERE A.questionId = B.questionId;
                """

            case .aggregateFunction:
                return """
                SELECT COUNT(name)
                FROM Person;
                """

            case .aggregateFunctionExtended:
                return """
                SELECT COUNT(name)
                FROM Person
                GROUP BY assessmentResults;
                """

            case .textBasedSearch:
                return """
                SELECT personId
                FROM Person
                WHERE CONTAINS("Alice")
                """

            case .subQuery:
                return """
                SELECT Assessment.id
                    (SELECT MAX(Person.assessmentsTaken)
                     FROM PersonAS) as max_person
                FROM Person.assessmentsTaken AS p;
                """

            case .storedFunction:
                return """
                CREATE FUNCTION PersonLevel()
                RETURNS VCHAR(15)
                DETERMINISTIC
                BEGIN
                    DECLARE personLevel VARCHAR(15);

                    IF assessmentsTaken > 10 THEN
                        SET personLevel = '3';
                    ELSEIF (assessmentsTaken >= 5 AND
                                                assessmentsTaken <= 10) THEN
                        SET personLevel = '2';
                    ELSEIF assessmentsTaken < 10 THEN
                        SET personLevel = '1';
                    END IF;
                    RETURN (personLevel);
                END$$
                """

            case .storedProcedure:
                return """
                CREATE PROCEDURE setPersonName
                AS
                UPDATE Person
                SET Person.name = new_name
                where Person.name = old_name;
                """

            case .trigger:
                return """
                create trigger assessment_count
                before INSERT
                on
                Assessment
                UPDATE Assessment.Count = Assessment.Count + 1;
                """

            }
        }
    }
}


