//
//  RootView.swift
//  Introspect
//
//  Created by Kody Deda on 4/6/21.
//

import SwiftUI
import ComposableArchitecture

struct AssessmentView: View {
    let store: Store<Assessment.State, Assessment.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            if !viewStore.testStarted {
                AssessmentStartView(store: store)
            } else if viewStore.testStarted && !viewStore.testFinished {
                AssessmentQuestionView(store: store)
            } else {
                AssessmentFinishedView(store: store)
            }
        }
    }
}

struct AssessmentView_Previews: PreviewProvider {
    static var previews: some View {
        AssessmentView(store: Assessment.defaultStore)
    }
}
