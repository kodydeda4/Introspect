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
                
                // Question
                Text(viewStore.currentQuestion.content)
                    .font(.title)
                    .bold()
                    .padding(.vertical)
                
                // Responses
                ForEach(Question.Response.allCases) { response in
                    Button(response.rawValue) { viewStore.send(.responseButtonTapped(response)) }
                        .buttonStyle(RoundedRectangleButtonStyle(color: response.buttonColor))
                }
                
                // Navbuttons
                Spacer()
                HStack {
                    Button("Back") {
                        viewStore.send(.backButtonTapped)
                    }
                    .buttonStyle(RoundedRectangleButtonStyle())
                    .disabled(viewStore.progress == .firstQuestion)
                    .opacity(viewStore.progress == .firstQuestion ? 0.60 : 1.0)
                    
                    Button(viewStore.progress == .lastQuestion ? "Finish" : "Next") {
                        viewStore.send(.nextButtonTapped)
                    }
                    .buttonStyle(RoundedRectangleButtonStyle(color: .accentColor))
                }
                .disabled(viewStore.changingQuestion)
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
