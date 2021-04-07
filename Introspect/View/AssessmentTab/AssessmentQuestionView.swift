//
//  AssessmentQuestionView.swift
//  Introspect
//
//  Created by Kody Deda on 4/6/21.
//

import SwiftUI
import ComposableArchitecture

struct AssessmentQuestionView: View {
    @Environment(\.presentationMode) var presentationMode

    let store: Store<Assessment.State, Assessment.Action>
        
    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                VStack(alignment: .leading) {
                    VStack(alignment: .trailing) {
                        Text("\(viewStore.questionNumber+1)/\(viewStore.questions.count) Complete")
                            .bold()
                        HStack(spacing: 0) {
                            ForEach(viewStore.questions) {
                                if $0.selectedResponse == nil {
                                    Rectangle()
                                        .foregroundColor(Color(.secondarySystemBackground))
                                } else {
                                    Rectangle()
                                        .foregroundColor(.accentColor)
                                }
                            }
                        }
                        .frame(height: 10)
                        .background(Color(.secondarySystemBackground))
                        .clipShape(Capsule())
                    }
                    Text(viewStore.currentQuestion.content)
                        .font(.title)
                        .bold()
                        .padding()
                                        
                    ForEach(viewStore.currentQuestion.responses, id: \.self) { response in
                        Button(response.lowercased()) {
                            viewStore.send(.optionSelected(response))
                        }
                        .buttonStyle(
                            RoundedRectangleButtonStyle(
                                style: viewStore.currentQuestion.selectedResponse == response
                                    ? .confirm
                                    : .dismiss
                            )
                        )
                    }
                    .padding(.horizontal)
                    Spacer()
                    HStack {
                        Button("Back") {
                            viewStore.send(.previousQuestionButtonTapped)
                        }
                        .buttonStyle(RoundedRectangleButtonStyle(style: .dismiss))
                        .disabled(viewStore.questionNumber == 0)

                        Button("Next") {
                            viewStore.send(.nextQuestionButtonTapped)
                            
                        }
                        .buttonStyle(
                            RoundedRectangleButtonStyle(
                                style: viewStore.questions.filter { $0.selectedResponse == nil }.count != 0 && viewStore.questionNumber + 1 == viewStore.questions.count
                                    ? .dismiss
                                    : .confirm
                            )
                        )
                        .disabled(viewStore.questions.filter { $0.selectedResponse == nil }.count != 0 && viewStore.questionNumber + 1 == viewStore.questions.count)
                    }
                }
                .padding()
                .navigationBarHidden(true)
                .gesture(
                    DragGesture()
                        .onEnded {
                            if $0.translation.width > 100 {
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        }
                )

            }
        }
    }
}
struct AssessmentQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        AssessmentQuestionView(store: Assessment.defaultStore)
    }
}
