//
//  RootView.swift
//  Introspect
//
//  Created by Kody Deda on 4/6/21.
//

import SwiftUI
import ComposableArchitecture

struct RootView: View {
    let store: Store<Root.State, Root.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            if viewStore.testFinished {
                TestFinishedView(store: store)
            } else {
                TestView(store: store)
            }
        }
    }
}

struct TestFinishedView: View {
    let store: Store<Root.State, Root.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                VStack {
                    Text("Done!")
                        .font(.title)
                        .bold()
                        .padding()
                    
                    HStack {
                        Button("Go Back") {
                            viewStore.send(.toggleTestFinished)
                        }
                        .buttonStyle(RoundedRectangleButtonStyle(style: .dismiss))
                        
                        Button("Submit") {
                            viewStore.send(.previousQuestionButtonTapped)
                        }
                        .buttonStyle(RoundedRectangleButtonStyle(style: .confirm))
                    }
                }
                .padding()
            }
        }
    }
}


struct TestView: View {
    let store: Store<Root.State, Root.Action>
    
    @State var completedQuestions = 0
    
    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                VStack(alignment: .leading) {
                    
                    //Progressbar
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
                        .buttonStyle(RoundedRectangleButtonStyle(style: .confirm))
                    }
                }
                .padding()
                .navigationBarHidden(true)
                //.navigationBarTitle("Question \(viewStore.questionNumber+1)/\(viewStore.questions.count)")
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(store: Root.defaultStore)
    }
}




struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(store: Root.defaultStore)
    }
}
