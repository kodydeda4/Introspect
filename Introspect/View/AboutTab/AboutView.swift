//
//  AboutView.swift
//  Introspect
//
//  Created by Kody Deda on 4/6/21.
//

import SwiftUI
import ComposableArchitecture

struct AboutView: View {
    let store: Store<Root.State, Root.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            Form {
                Section(header: Text("UNCW Fall 2021")) {
                    Text("CSC 455 - Database Design & Implementation")
                    Text("Dr Ferner")
                }
                Section(header: Text("Team Members")) {
                    ForEach([
                        "Kody Deda",
                        "Alex Chisolm",
                        "Basam Ahmed",
                    ], id: \.self) {
                        Text($0)
                    }
                }
            }
            .navigationBarTitle("About")
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView(store: Root.defaultStore)
    }
}
