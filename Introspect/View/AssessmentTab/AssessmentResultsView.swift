//
//  PersonalityTypeView.swift
//  Introspect
//
//  Created by Kody Deda on 4/13/21.
//

import SwiftUI
import ComposableArchitecture

struct AssessmentResultsView: View {
    let store: Store<Assessment.State, Assessment.Action>
    @State var animating = false
    
    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                PersonalityTypeDetailView(type: viewStore.personalityType)
                
                Button("Finished") {
                    viewStore.send(.finishedButtonTapped)
                }
                .buttonStyle(RoundedRectangleButtonStyle(color: .accentColor))
                .padding()
            }
            .opacity(animating ? 1 : 0)
            .animation(Animation.easeIn(duration: 1.5), value: animating)
            .onAppear { animating.toggle() }
        }
    }
}


struct PersonalityTypeView_Previews: PreviewProvider {
    static var previews: some View {
        AssessmentResultsView(store: Assessment.defaultStore)
    }
}
