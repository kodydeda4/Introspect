//
//  Root.swift
//  Introspect
//
//  Created by Kody Deda on 4/6/21.
//

import SwiftUI
import ComposableArchitecture


struct Assessment {
    struct State: Equatable {
        var progress               = Progress.notYetStarted
        var questions              = Question.allCases
        var currentQuestion        = Question.allCases.first!
        var currentQuestionIndex   = 0
        var showingSheetView       = false
        var changingQuestion       = false
        var assessmentResult       = PersonalityType()
        
        var percentCompleted: CGFloat {
            let complete = CGFloat(questions.filter { $0.response != nil }.count)
            let all  = CGFloat(questions.count)
            return complete / all
        }
        
        enum Progress {
            case notYetStarted
            case firstQuestion
            case active
            case lastQuestion
            case finished
        }
    }
    
    enum Action: Equatable {
        case startButtonTapped
        case responseButtonTapped(Question.Response)
        case backButtonTapped
        case nextButtonTapped
        case submitButtonTapped

        case hideSheetView
        case showSheetView
        case sheetQuestionButtonTapped(Int)
    }
    
    struct Environment {
        func getProgress(_ state: Assessment.State) -> Assessment.State.Progress {
            if state.currentQuestionIndex == 0 {
                return .firstQuestion
                
            } else if state.currentQuestionIndex < state.questions.count - 1 {
                return .active
                
            } else if state.progress != .lastQuestion && state.currentQuestionIndex == state.questions.count - 1 {
                return .lastQuestion

            } else if state.progress == .lastQuestion && state.questions.filter({ $0.response == nil }).count == 0 {
                return .finished
                
            } else {
                return state.progress
            }
        }
        
        func getProgressIndexButtonTapped(_ state: Assessment.State) -> Assessment.State.Progress {
            if state.currentQuestionIndex == 0 {
                return .firstQuestion
                
            } else if state.currentQuestionIndex < state.questions.count - 1 {
                return .active
                
            } else if state.progress != .lastQuestion && state.currentQuestionIndex == state.questions.count - 1 {
                return .lastQuestion

            } else if state.progress == .lastQuestion && state.questions.filter({ $0.response == nil }).count == 0 {
                return .finished
                
            } else {
                return state.progress
            }
        }
        
        func getProgressBackButtonTapped(_ state: Assessment.State) -> Assessment.State.Progress {
            if state.currentQuestionIndex == 0 {
                return .firstQuestion
                
            } else if state.currentQuestionIndex < state.questions.count - 1 {
                return .active
                
            } else if state.currentQuestionIndex == state.questions.count - 1 {
                return .lastQuestion
                
            } else {
                return state.progress
            }
        }
    }
}

extension Assessment {
    static let reducer = Reducer<State, Action, Environment>.combine(
        Reducer { state, action, environment in
            switch action {
            
            case .startButtonTapped:
                state.progress = .firstQuestion
                return .none
                
            case let .responseButtonTapped(selection):
                switch state.currentQuestion.response != selection {
                
                case false:
                    state.currentQuestion.response = nil
                    state.questions[state.currentQuestionIndex] = state.currentQuestion
                    
                    return .none
                    
                case true:
                    state.currentQuestion.response = selection
                    state.questions[state.currentQuestionIndex] = state.currentQuestion
                    state.changingQuestion = true
                    
                    switch state.currentQuestion.tendsToward {
                    
                    case .introversion:
                        switch selection {
                        case .stronglyAgree, .agree, .somewhatAgree, .undecided:
                            state.assessmentResult.introversion += selection.rawValue
                        case .somewhatDisagree, .disagree, .stronglyDisagree:
                            state.assessmentResult.extroversion += -selection.rawValue
                        }

                    case .extroversion:
                        switch selection {
                        case .stronglyAgree, .agree, .somewhatAgree, .undecided:
                            state.assessmentResult.extroversion += selection.rawValue
                        case .somewhatDisagree, .disagree, .stronglyDisagree:
                            state.assessmentResult.introversion += -selection.rawValue
                        }
                        
                    case .sensing:
                        switch selection {
                        case .stronglyAgree, .agree, .somewhatAgree, .undecided:
                            state.assessmentResult.sensing += selection.rawValue
                            
                        case .somewhatDisagree, .disagree, .stronglyDisagree:
                            state.assessmentResult.intuition += -selection.rawValue
                        }
                        
                    case .intuition:
                        switch selection {
                        case .stronglyAgree, .agree, .somewhatAgree, .undecided:
                            state.assessmentResult.intuition += selection.rawValue
                        case .somewhatDisagree, .disagree, .stronglyDisagree:
                            state.assessmentResult.sensing += -selection.rawValue
                        }

                    case .thinking:
                        switch selection {
                        case .stronglyAgree, .agree, .somewhatAgree, .undecided:
                            state.assessmentResult.thinking += selection.rawValue
                        case .somewhatDisagree, .disagree, .stronglyDisagree:
                            state.assessmentResult.feeling += -selection.rawValue
                        }
                        
                    case .feeling:
                        switch selection {
                        case .stronglyAgree, .agree, .somewhatAgree, .undecided:
                            state.assessmentResult.feeling += selection.rawValue
                        case .somewhatDisagree, .disagree, .stronglyDisagree:
                            state.assessmentResult.thinking += -selection.rawValue
                        }

                    case .judging:
                        switch selection {
                        case .stronglyAgree, .agree, .somewhatAgree, .undecided:
                            state.assessmentResult.judging += selection.rawValue
                        case .somewhatDisagree, .disagree, .stronglyDisagree:
                            state.assessmentResult.percieving += -selection.rawValue
                        }

                    case .percieving:
                        switch selection {
                        case .stronglyAgree, .agree, .somewhatAgree, .undecided:
                            state.assessmentResult.percieving += selection.rawValue
                        case .somewhatDisagree, .disagree, .stronglyDisagree:
                            state.assessmentResult.judging += -selection.rawValue
                        }
                    }


                    return Effect(value: .nextButtonTapped)
                        .delay(for: 1.0, scheduler: DispatchQueue.main)
                        .eraseToEffect()
                }
                
            case .backButtonTapped:
                switch state.progress {
                case .active, .lastQuestion:
                    state.currentQuestionIndex -= 1
                    state.currentQuestion = state.questions[state.currentQuestionIndex]
                    
                case .finished:
                    state.currentQuestion.response = nil
                    state.questions[state.currentQuestionIndex] = state.currentQuestion
                    state.progress = .lastQuestion
                    
                default:
                    print("backButtonTapped")
                }
                state.progress = environment.getProgressBackButtonTapped(state)
                return .none
                                
            case .nextButtonTapped:
                state.changingQuestion = false
                
                switch state.progress {
                
                case .firstQuestion, .active:
                    state.currentQuestionIndex += 1
                    state.currentQuestion = state.questions[state.currentQuestionIndex]
                    
                default:
                    print("nextButtonTapped")
                }
                
                state.progress = environment.getProgress(state)
                return .none

            case .submitButtonTapped:
                state.progress = .finished
                return .none
                
            case .hideSheetView:
                state.showingSheetView = false
                return .none
                
            case .showSheetView:
                state.showingSheetView = true
                return .none
                
            case let .sheetQuestionButtonTapped(int):
                state.questions[state.currentQuestionIndex].response = state.currentQuestion.response
                state.currentQuestionIndex = int
                state.currentQuestion = state.questions[state.currentQuestionIndex]

                state.showingSheetView = false
                state.progress = environment.getProgressIndexButtonTapped(state)
                return .none
            }
        }
        .debug()
    )
}

extension Assessment {
    static let defaultStore = Store(
        initialState: .init(),
        reducer: reducer,
        environment: .init()
    )
}
