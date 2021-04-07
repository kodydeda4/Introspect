//
//  AssessmentStartView.swift
//  Introspect
//
//  Created by Kody Deda on 4/6/21.
//

import SwiftUI

import SwiftUI
import ComposableArchitecture

struct AssessmentStartView: View {
    let store: Store<Assessment.State, Assessment.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                VStack {
                    Text("Start")
                        .font(.title)
                        .bold()
                        .padding()
                    
                    Button("Start Test") {
                        viewStore.send(.startTestButtonTapped)
                    }
                    .buttonStyle(RoundedRectangleButtonStyle(style: .confirm))
                }
                .padding()
            }
        }
    }
}
struct AssessmentStartView_Previews: PreviewProvider {
    static var previews: some View {
        AssessmentFinishedView(store: Assessment.defaultStore)
    }
}
