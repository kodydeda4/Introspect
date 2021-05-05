//
//  SQLView2.swift
//  Introspect
//
//  Created by Kody Deda on 5/5/21.
//

import SwiftUI


struct SQLView2: View {
    let sql = SQL.init()
        
    var body: some View {
        Form {
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
