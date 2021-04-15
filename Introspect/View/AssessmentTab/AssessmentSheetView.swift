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
            ScrollView {
                Text("Questions")
                    .font(.title)
                    .bold()
                    .padding(.top)
                
                LazyVGrid(columns: [GridItem](repeating: .init(.flexible()), count: 4)) {
                    ForEach(0..<viewStore.questions.count) { index in
                        Button(index.description) {
                            viewStore.send(.sheetQuestionButtonTapped(index))
                        }
                        .buttonStyle(
                            RoundedRectangleButtonStyle(
                                color: viewStore.questions[index].response == nil ? Color(.secondarySystemBackground) : .accentColor
                            )
                        )
                    }
                }
                .padding()
            }
            .frame(alignment: .top)
        }
    }
}

struct AssessmentSheetView_Previews: PreviewProvider {
    static var previews: some View {
        AssessmentSheetView(store: Assessment.defaultStore)
    }
}

