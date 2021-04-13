//
//  RootView.swift
//  Introspect
//
//  Created by Kody Deda on 4/6/21.
//

import SwiftUI
import ComposableArchitecture

struct RootView: View {
    let store: Store<Root.State, Root.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            TabView {
                NavigationView {
                    AboutView(store: store)
                }
                .tabItem {
                    Label("About", systemImage: "gearshape.fill")
                        .foregroundColor(.accentColor)
                }
                NavigationView {
                    AssessmentView(store: store.scope(state: \.assessment, action: Root.Action.assessment))
                }
                .tabItem {
                    Label("Test", systemImage: "doc.plaintext.fill")
                        .foregroundColor(.accentColor)
                }
                NavigationView {
                    ResultsView(store: store)
                }
                .tabItem {
                    Label("Results", systemImage: "person.crop.circle.fill")
                        .foregroundColor(.accentColor)
                }
                NavigationView {
                    SQLView()
                }
                .tabItem {
                    Label("SQL", systemImage: "text.book.closed.fill")
                        .foregroundColor(.accentColor)
                }

            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(store: Root.defaultStore)
    }
}
