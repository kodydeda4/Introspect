//
//  SQLView2.swift
//  Introspect
//
//  Created by Kody Deda on 5/5/21.
//

import SwiftUI


struct SQLView2: View {
    let f = SQL.init()
    
    @State var selectedSQLAction: SQL.Query = .createUsersTable
    
    var body: some View {
        Form {
            Button("foo") {
                SQL.Query.createUsersTable
            }
        }
    }
}

struct SQLView2_Previews: PreviewProvider {
    static var previews: some View {
        SQLView2()
    }
}
