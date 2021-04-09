//
//  ContentView.swift
//  Introspect
//
//  Created by Kody Deda on 4/9/21.
//

import SwiftUI

enum SQLAction: String, Identifiable, CaseIterable {
    var id: SQLAction { self }
    
    case createUsersTable = "Create users Table"
    case createPostsTable = "Create posts Table"
    case addAliceUser     = "Insert alice into users Table"
    
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
        }
    }
    
    
}

struct ContentView: View {
    let f = MySQLStripped.init()
    
    @State var selectedSQLAction: SQLAction = .createUsersTable
    
    var body: some View {
        Form {
            ForEach(SQLAction.allCases) { action in
                Section(header: Text(action.rawValue)) {
                    Text(action.code)
                        .padding(.vertical)
                }
            }
        }
        .navigationBarTitle("SQL Queries")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
