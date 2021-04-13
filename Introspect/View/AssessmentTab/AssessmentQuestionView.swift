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
            GeometryReader { geo in
                VStack(alignment: .leading) {
                    Progressbar(percentage: viewStore.percentCompleted, action: { viewStore.send(.showSheetView) })
                    
                    // Question
                    Text(viewStore.currentQuestion.content)
                        .font(.title)
                        .bold()
                        .padding(.vertical)
                        //.frame(height: geo.size.height * 0.25)
                        .frame(height: geo.size.height * 0.3, alignment: .topLeading)
                    
                    
                    DebugView(store: store)
                    
                    //Spacer()
                    HStack {
                        Spacer()
                        //                        Text("Agree")
                        //                            .opacity((viewStore.changingQuestion && ![.stronglyAgree, .somewhatAgree, .agree].contains(viewStore.currentQuestion.response) ? 0.1 : 1))
                        //                            .animation(.default, value: [.stronglyAgree].contains(viewStore.currentQuestion.response))
                        
                        ForEach(Question.Response.allCases) { response in
                            Button(action: { viewStore.send(.responseButtonTapped(response)) }) {
                                Circle()
                                    .foregroundColor(response.buttonColor)
                                
                            }
                            .opacity((viewStore.changingQuestion && viewStore.currentQuestion.response != response) ? 0.25 : 1)
                            .animation(.default, value: viewStore.changingQuestion && viewStore.currentQuestion.response != response)
                            //                            .frame(width: 25)
                            
                        }
                        //                        Text("Disagree")
                        //                            .opacity((viewStore.changingQuestion && ![.stronglyDisagree, .somewhatDisagree, .disagree].contains(viewStore.currentQuestion.response) ? 0.1 : 1))
                        //                            .animation(.spring(), value: [.stronglyAgree].contains(viewStore.currentQuestion.response))
                        Spacer()
                    }
                    .frame(height: geo.size.height * 0.25)
                    
                    //                HStack {
                    //                    Button("Back") {
                    //                        viewStore.send(.backButtonTapped)
                    //                    }
                    //                    .buttonStyle(RoundedRectangleButtonStyle())
                    //                    .disabled(viewStore.progress == .firstQuestion)
                    //                    .opacity(viewStore.progress == .firstQuestion ? 0.60 : 1.0)
                    //
                    //                    Button(viewStore.progress == .lastQuestion ? "Finish" : "Next") {
                    //                        viewStore.send(.nextButtonTapped)
                    //                    }
                    //                    .buttonStyle(RoundedRectangleButtonStyle(color: .accentColor))
                    //                }
                    //                .padding(.vertical)
                    //                .disabled(viewStore.changingQuestion)
                }
                
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

// MARK:- DebugView
private struct DebugView: View {
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


struct DebugView_Previews: PreviewProvider {
    static var previews: some View {
        DebugView(store: Assessment.defaultStore)
    }
}
