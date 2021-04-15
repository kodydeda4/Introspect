//
//  AssessmentStartView.swift
//  Introspect
//
//  Created by Kody Deda on 4/6/21.
//

import SwiftUI
import ComposableArchitecture

struct AssessmentStartView: View {
    let store: Store<Assessment.State, Assessment.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                Text("Myer Briggs Test")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Description about Myer Briggs goes here")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                    .padding(.top, 1)
                
                Button("Start Assessment") {
                    viewStore.send(.startButtonTapped)
                }
                .buttonStyle(RoundedRectangleButtonStyle(color: .accentColor))
                .padding()
            }
            .padding()
        }
    }
}
struct AssessmentStartView_Previews: PreviewProvider {
    static var previews: some View {
        AssessmentStartView(store: Assessment.defaultStore)
    }
}
