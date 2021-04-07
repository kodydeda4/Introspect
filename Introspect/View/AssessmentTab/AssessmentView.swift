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
//            switch viewStore.testStatus {
//            case .notYetStarted:
//                AssessmentStartView(store: store)
//            case .active:
//                AssessmentQuestionView(store: store)
//            case .finished:
//                AssessmentFinishedView(store: store)
//            }
            if viewStore.testStatus == .notYetStarted {
                AssessmentStartView(store: store)
            } else if viewStore.testStatus == .finished {
                AssessmentFinishedView(store: store)
            } else {
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
