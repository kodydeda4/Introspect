//
//  AssessmentDebugView.swift
//  Introspect
//
//  Created by Kody Deda on 4/15/21.
//

import SwiftUI
import ComposableArchitecture

struct AssessmentDebugView: View {
    let store: Store<Assessment.State, Assessment.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                HStack {
                    Text(viewStore.currentQuestion.tendsToward.rawValue)
                        .font(.title)
                        .bold()
                        .foregroundColor(.green)
                    
                    Text(viewStore.currentQuestion.tendsToward.opposite.rawValue)
                        .font(.title)
                        .bold()
                        .foregroundColor(.orange)
                }
                
                HStack {
                    TextField("", text: .constant("\(viewStore.introversion.description) Introversion"))
                    TextField("", text: .constant("\(viewStore.extroversion.description) Extroversion"))
                }
                HStack {
                    TextField("", text: .constant("\(viewStore.sensing.description) Sensing"))
                    TextField("", text: .constant("\(viewStore.intuition.description) Intuition"))
                }
                HStack {
                    TextField("", text: .constant("\(viewStore.thinking.description) Thinking"))
                    TextField("", text: .constant("\(viewStore.feeling.description) Feeling"))
                }
                HStack {
                    TextField("", text: .constant("\(viewStore.judging.description) Judging"))
                    TextField("", text: .constant("\(viewStore.percieving.description) Percieving"))
                }
            }
            .padding()
            .border(Color.red)
        }
    }
}

struct AssessmentDebugView_Previews: PreviewProvider {
    static var previews: some View {
        AssessmentDebugView(store: Assessment.defaultStore)
    }
}
