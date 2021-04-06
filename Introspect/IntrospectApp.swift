//
//  IntrospectApp.swift
//  Introspect
//
//  Created by Kody Deda on 4/6/21.
//

import SwiftUI

@main
struct IntrospectApp: App {
    var body: some Scene {
        WindowGroup {
            RootView(store: Root.defaultStore)
            //ExampleView(store: Example.defaultStore)
        }
    }
}
