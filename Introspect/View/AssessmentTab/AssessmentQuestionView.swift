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
            VStack(alignment: .leading) {
                Progressbar(percentage: viewStore.percentCompleted, action: { viewStore.send(.showSheetView) })
                
                Text(viewStore.currentQuestion.content)
                    .font(.title)
                    .bold()
                    .padding(.vertical)
                    .frame(height: 300, alignment: .topLeading)
                
                HStack {
                    ForEach(Question.Response.allCases) { response in
                        Button(action: { viewStore.send(.responseButtonTapped(response)) }) {
                            Circle()
                                .foregroundColor(response.buttonColor)
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
}




struct AssessmentQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        AssessmentQuestionView(store: Assessment.defaultStore)
    }
}


