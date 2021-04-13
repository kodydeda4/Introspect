//
//  ContentView.swift
//  Introspect
//
//  Created by Kody Deda on 4/9/21.
//

import SwiftUI

struct ContentView: View {
    let f = SQL.init()
    
    @State var selectedSQLAction: SQL.Query = .createUsersTable
    
    var body: some View {
        Form {
            ForEach(SQL.Query.allCases) { action in
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
