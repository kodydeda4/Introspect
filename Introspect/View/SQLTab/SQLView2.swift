//
//  SQLView2.swift
//  Introspect
//
//  Created by Kody Deda on 5/5/21.
//

import SwiftUI


struct SQLView2: View {
    let sql = SQL.init()
    
    @State var users = [String]()
        
    var body: some View {
        Form {
            Text(users.joined())

            Button("Example") {
                sql.example()
            }

            ForEach(SQL.Query.allCases) { query in
                Button(query.rawValue) {
                    sql.execute(query)
                }
            }
        }
    }
}

struct SQLView2_Previews: PreviewProvider {
    static var previews: some View {
        SQLView2()
    }
}
