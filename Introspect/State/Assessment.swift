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
        var introversion           = 0
        var extroversion           = 0
        var sensing                = 0
        var intuition              = 0
        var thinking               = 0
        var feeling                = 0
        var judging                = 0
        var percieving             = 0
        
        var personalityType: PersonalityType {
            let ie = introversion > extroversion ? PersonalitySpectrum.introversion : PersonalitySpectrum.extroversion
            let sn = sensing      > intuition    ? PersonalitySpectrum.sensing      : PersonalitySpectrum.intuition
            let tf = thinking     > feeling      ? PersonalitySpectrum.thinking     : PersonalitySpectrum.feeling
            let jp = judging      > percieving   ? PersonalitySpectrum.judging      : PersonalitySpectrum.percieving
            
            let str = [ie, sn, tf, jp]
                .map(\.letter)
                .joined()

            return PersonalityType(rawValue: str)!
        }
        
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
            case viewingResults
        }
    }
    
    enum Action: Equatable {
        case startButtonTapped
        case responseButtonTapped(Question.Response)
        case backButtonTapped
        case nextButtonTapped
        case viewResultsButtonTapped
        case finishedButtonTapped

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
                            state.introversion += selection.rawValue
                        case .somewhatDisagree, .disagree, .stronglyDisagree:
                            state.extroversion += -selection.rawValue
                        }

                    case .extroversion:
                        switch selection {
                        case .stronglyAgree, .agree, .somewhatAgree, .undecided:
                            state.extroversion += selection.rawValue
                        case .somewhatDisagree, .disagree, .stronglyDisagree:
                            state.introversion += -selection.rawValue
                        }
                        
                    case .sensing:
                        switch selection {
                        case .stronglyAgree, .agree, .somewhatAgree, .undecided:
                            state.sensing += selection.rawValue
                            
                        case .somewhatDisagree, .disagree, .stronglyDisagree:
                            state.intuition += -selection.rawValue
                        }
                        
                    case .intuition:
                        switch selection {
                        case .stronglyAgree, .agree, .somewhatAgree, .undecided:
                            state.intuition += selection.rawValue
                        case .somewhatDisagree, .disagree, .stronglyDisagree:
                            state.sensing += -selection.rawValue
                        }

                    case .thinking:
                        switch selection {
                        case .stronglyAgree, .agree, .somewhatAgree, .undecided:
                            state.thinking += selection.rawValue
                        case .somewhatDisagree, .disagree, .stronglyDisagree:
                            state.feeling += -selection.rawValue
                        }
                        
                    case .feeling:
                        switch selection {
                        case .stronglyAgree, .agree, .somewhatAgree, .undecided:
                            state.feeling += selection.rawValue
                        case .somewhatDisagree, .disagree, .stronglyDisagree:
                            state.thinking += -selection.rawValue
                        }

                    case .judging:
                        switch selection {
                        case .stronglyAgree, .agree, .somewhatAgree, .undecided:
                            state.judging += selection.rawValue
                        case .somewhatDisagree, .disagree, .stronglyDisagree:
                            state.percieving += -selection.rawValue
                        }

                    case .percieving:
                        switch selection {
                        case .stronglyAgree, .agree, .somewhatAgree, .undecided:
                            state.percieving += selection.rawValue
                        case .somewhatDisagree, .disagree, .stronglyDisagree:
                            state.judging += -selection.rawValue
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

            case .viewResultsButtonTapped:
                state.progress = .viewingResults
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
                
            case .finishedButtonTapped:
                //implemented in root.state
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
