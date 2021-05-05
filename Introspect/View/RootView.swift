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
                    PersonalityTypesView(store: store)
                }
                .background(Color(.systemGroupedBackground))
                .tabItem {
                    Label("Types", systemImage: "puzzlepiece.fill")
                        .foregroundColor(.accentColor)
                }
                NavigationView {
                    AssessmentView(store: store.scope(state: \.assessment, action: Root.Action.assessment))
                }
                .tabItem {
                    Label("Assessment", systemImage: "doc.text.below.ecg.fill")
                        .foregroundColor(.accentColor)
                }
                NavigationView {
                    SQLView()
                }
                .tabItem {
                    Label("SQL", systemImage: "curlybraces")
                        .foregroundColor(.accentColor)
                }
                NavigationView {
                    SQLView2()
                }
                .tabItem {
                    Label("SQL 2", systemImage: "externaldrive.fill.badge.plus")
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
