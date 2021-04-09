//
//  MySQLStripped.swift
//  Introspect
//
//  Created by Kody Deda on 4/9/21.
//

import Foundation
import SQLite

struct MySQLStripped {
    var db: Connection
    
    init() {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!

        //self.db = try! Connection("\(path)/db.sqlite3")
        self.db = try! Connection(.temporary)
        db.trace { print($0) }

    }
//    
//    func run() {
//
//    }
}


