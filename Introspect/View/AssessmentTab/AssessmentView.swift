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
            switch viewStore.progress {
            case .notYetStarted:
                AssessmentStartView(store: store)
            case .finished:
                AssessmentFinishedView(store: store)
            case .viewingResults:
                AssessmentResultsView(store: store)
            default:
                AssessmentQuestionView(store: store)
            }
        }
    }
}

struct AssessmentView_Previews: PreviewProvider {
    static var previews: some View {
        AssessmentView(store: Assessment.defaultStore)
    }
}

