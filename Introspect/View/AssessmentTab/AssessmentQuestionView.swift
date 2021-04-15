//
//  AssessmentQuestionView.swift
//  Introspect
//
//  Created by Kody Deda on 4/6/21.
//

import SwiftUI
import ComposableArchitecture

struct AssessmentQuestionView: View {
    let store: Store<Assessment.State, Assessment.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            VStack(spacing: 16) {
                
                Progressbar(
                    percentage: viewStore.percentCompleted,
                    action: { viewStore.send(.showSheetView) }
                )
                
                Text(viewStore.currentQuestion.content)
                    .font(.title)
                    .bold()
                    .frame(height: 300, alignment: .topLeading)
                
                HStack {
                    ForEach(Question.Response.allCases) { response in
                        Button(action: { viewStore.send(.responseButtonTapped(response)) }) {
                            Circle()
                                .foregroundColor(getColor(response))
                                .opacity((viewStore.changingQuestion && viewStore.currentQuestion.response != response) ? 0.25 : 1)
                                .animation(.default, value: viewStore.changingQuestion && viewStore.currentQuestion.response != response)
                        }
                    }
                }
                
                AssessmentDebugView(store: store)
            }
            .padding()
            .navigationBarHidden(true)
            .sheet(isPresented: viewStore.binding(get: \.showingSheetView, send: .hideSheetView)) {
                AssessmentSheetView(store: store)
            }
        }
    }
    
    func getColor(_ response: Question.Response) -> Color {
        switch response {
        case .stronglyAgree    : return Color.green.opacity(0.9)
        case .agree            : return Color.green.opacity(0.7)
        case .somewhatAgree    : return Color.green.opacity(0.6)
        case .undecided        : return Color.gray.opacity(0.6)
        case .somewhatDisagree : return Color.orange.opacity(0.6)
        case .disagree         : return Color.orange.opacity(0.7)
        case .stronglyDisagree : return Color.orange.opacity(0.9)
        }
    }
}


struct AssessmentQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        AssessmentQuestionView(store: Assessment.defaultStore)
    }
}


