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
            NavigationView {
                VStack {
                    Text(viewStore.currentQuestion.content)
                        .font(.title)
                        .bold()
                        .padding()
                    
                    Spacer()
                    ForEach(viewStore.currentQuestion.options, id: \.self) { option in
                        Button(option.lowercased()) {
                            viewStore.send(.optionSelected(option))
                        }
                        .buttonStyle(RoundedRectangleButtonStyle(
                                        style: viewStore.currentQuestion.answered == option ? .confirm : .dismiss))
                    }
                    .padding(.horizontal)
                    Spacer()
                    HStack {
                        Button("Back") {
                            viewStore.send(.previousQuestionButtonTapped)
                        }
                        .buttonStyle(RoundedRectangleButtonStyle(style: .dismiss))
                        
                        Button("Next") {
                            viewStore.send(.nextQuestionButtonTapped)
                            
                        }
                        .buttonStyle(RoundedRectangleButtonStyle(style: .confirm))
                    }
                }
                .padding()
                .navigationBarTitle("Question \(viewStore.questionNumber+1)/\(viewStore.questions.count)")
            }
        }
    }
}


struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(store: Root.defaultStore)
    }
}
