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
//            TabView {
//                AboutView(store: store)
//                    .tabItem { Label("About", systemImage: "gear").foregroundColor(.accentColor) }
                AssessmentView(store: store.scope(state: \.assessment, action: Root.Action.assessment))
            
                    
//                    .tabItem { Label("Search", systemImage: "magnifyingglass").foregroundColor(.accentColor) }
//                ProfileView(store: store)
//                    .tabItem { Label("Profile", systemImage: "heart").foregroundColor(.accentColor) }
//            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(store: Root.defaultStore)
    }
}
