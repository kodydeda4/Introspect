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
                    Label("About", systemImage: "gear")
                        .foregroundColor(.accentColor)
                }
                NavigationView {
                    AssessmentView(store: store.scope(state: \.assessment, action: Root.Action.assessment))
                }
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                        .foregroundColor(.accentColor)
                }
                NavigationView {
                    ProfileView(store: store)
                }
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
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
