//
//  SheetView.swift
//  Introspect
//
//  Created by Kody Deda on 4/6/21.
//

import SwiftUI
import ComposableArchitecture

struct AssessmentSheetView: View {
    let store: Store<Assessment.State, Assessment.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                Text("Questions")
                    .font(.title)
                    .bold()
                    
                Divider()
                    .padding()

                LazyVGrid(
                    columns: [GridItem](repeating: .init(.flexible()), count: 4),
                    spacing: 20
                ) {
                    ForEach(0..<viewStore.questions.count) { index in
                        Button(index.description) {
                            viewStore.send(.updateCurrentQuestion(index))
                                
                        }
                        .buttonStyle(RoundedRectangleButtonStyle(style: viewStore.questions[index].selectedResponse == nil ? .dismiss : .confirm))
                        .shadow(radius: viewStore.questionNumber == index ? 1 : 0)
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct AssessmentSheetView_Previews: PreviewProvider {
    static var previews: some View {
        AssessmentSheetView(store: Assessment.defaultStore)
    }
}
