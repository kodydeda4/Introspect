//
//  ContentView.swift
//  Introspect
//
//  Created by Kody Deda on 4/9/21.
//

import SwiftUI

struct ContentView: View {
    let f = MySQLStripped.init()
    
    @State var users = ""
    
    enum SQLAction {
        case createUsersTable
        case createPostsTable
        case addAliceUser
        
        var sqlCode: String {
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
    
    var body: some View {
        NavigationView {
        
            VStack(alignment: .leading) {
                Text(users)
                
                Button("Create users Table") {
                    try! f.db.execute(SQLAction.createUsersTable.sqlCode)
                }
                Button("Create posts Table") {
                    try! f.db.execute(SQLAction.createPostsTable.sqlCode)
                }
                Button("add user") {
                    try! f.db.run(SQLAction.addAliceUser.sqlCode)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
