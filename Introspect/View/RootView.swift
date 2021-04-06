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
                    Text(viewStore.questions[viewStore.questionNumber].content)
                        .font(.title)
                        .bold()
                        .padding()
                    
                    HStack {
                        Button("Back", action: {
                            viewStore.send(.previousQuestionButtonTapped)
                        })
                        .buttonStyle(RoundedRectangleButtonStyle(style: .dismiss))

                        Button("Next", action: {
                            viewStore.send(.nextQuestionButtonTapped)
                        })
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
