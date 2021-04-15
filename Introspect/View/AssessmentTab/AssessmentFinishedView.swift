//
//  AssessmentFinishedView.swift
//  Introspect
//
//  Created by Kody Deda on 4/6/21.
//

import SwiftUI
import ComposableArchitecture

struct AssessmentFinishedView: View {
    let store: Store<Assessment.State, Assessment.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                ScrollView {
                    Text("Done!")
                        .font(.title)
                        .bold()
                        .padding()
                                        
                    HStack {
                        Button("Go Back") {
                            viewStore.send(.backButtonTapped)
                        }
                        .buttonStyle(RoundedRectangleButtonStyle())
                        
                        Button("View Results") {
                            viewStore.send(.viewResultsButtonTapped)
                        }
                        .buttonStyle(RoundedRectangleButtonStyle(color: .accentColor))
                    }
                    AssessmentDebugView(store: store)

                }
                .padding()
            }
        }
    }
}
struct AssessmentFinishedView_Previews: PreviewProvider {
    static var previews: some View {
        AssessmentFinishedView(store: Assessment.defaultStore)
    }
}
