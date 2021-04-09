//
//  ContentView.swift
//  Introspect
//
//  Created by Kody Deda on 4/9/21.
//

import SwiftUI

enum SQLAction: String, Identifiable, CaseIterable {
    var id: SQLAction { self }
    
    enum QueryType {
        case selection
        case other
    }
    
    case createUsersTable = "Create users Table"
    case createPostsTable = "Create posts Table"
    case addAliceUser     = "Insert alice into users Table"
    
    var queryType: QueryType {
        switch self {
        case .createUsersTable, .createPostsTable:
            return .selection
            
        case .addAliceUser:
            return .other
        }
    }
    
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
    
    //    VStack(alignment: .leading) {
    //        ForEach(SQLAction.allCases.filter { $0.queryType == .selection }) { action in
    //            Section(header: Text(action.rawValue)) {
    //                Text(action.code)
    //            }
    //        }
    //    }

    
    
    var body: some View {
        ScrollView {
            ForEach(SQLAction.allCases) { action in
                VStack(alignment: .leading) {
                    
                    Text(action.rawValue)
                        .font(.title2)
                        .bold()
                        .foregroundColor(.primary)
                    
                    Text(action.code)
                        .foregroundColor(.accentColor)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    
                    
                }
                .padding()
                //.padding(.horizontal)
                //.padding(.vertical, 8)
                
            }
        }
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
