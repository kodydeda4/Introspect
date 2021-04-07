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
        var progress : Progress = .notYetStarted
        var questions: [Question] = Question.allCases
        
        var index = 0
        var currentQuestion: Question = Question.allCases.first!
        var showingSheetView = false
        var changingQuestion = false
        
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
        case questionIndexButtonTapped(Int)
        case responseButtonTapped(String)
        case backButtonTapped
        case nextButtonTapped
        case submitButtonTapped
        case hideSheetView
        case showSheetView
    }
    
    struct Environment {
        func getProgress(_ state: Assessment.State) -> Assessment.State.Progress {
            if state.index == 0 {
                return .firstQuestion
                
            } else if state.index < state.questions.count - 1 {
                return .active
                
            } else if state.progress != .lastQuestion && state.index == state.questions.count - 1 {
                return .lastQuestion

            } else if state.progress == .lastQuestion && state.questions.filter({ $0.response == nil }).count == 0 {
                return .finished
                
            } else {
                return state.progress
            }
        }
        
        func getProgressIndexButtonTapped(_ state: Assessment.State) -> Assessment.State.Progress {
            if state.index == 0 {
                return .firstQuestion
                
            } else if state.index < state.questions.count - 1 {
                return .active
                
            } else if state.progress != .lastQuestion && state.index == state.questions.count - 1 {
                return .lastQuestion

            } else if state.progress == .lastQuestion && state.questions.filter({ $0.response == nil }).count == 0 {
                return .finished
                
            } else {
                return state.progress
            }
        }
        
        func getProgressBackButtonTapped(_ state: Assessment.State) -> Assessment.State.Progress {
            if state.index == 0 {
                return .firstQuestion
                
            } else if state.index < state.questions.count - 1 {
                return .active
                
            } else if state.index == state.questions.count - 1 {
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

            case let .responseButtonTapped(response):
                switch state.currentQuestion.response == response {
                case true:
                    state.currentQuestion.response = nil
                    state.questions[state.index] = state.currentQuestion
                    return .none
                    
                case false:
                    state.currentQuestion.response = response
                    state.questions[state.index] = state.currentQuestion
                    
                    state.changingQuestion = true

                    return Effect(value: .nextButtonTapped)
                        .delay(for: 1.0, scheduler: DispatchQueue.main)
                        .eraseToEffect()
                }
                
            case .backButtonTapped:
                switch state.progress {
                case .active, .lastQuestion:
                    state.index -= 1
                    state.currentQuestion = state.questions[state.index]
                    
                case .finished:
                    state.currentQuestion.response = nil
                    state.questions[state.index] = state.currentQuestion
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
                    state.index += 1
                    state.currentQuestion = state.questions[state.index]
                    
                default:
                    print("nextButtonTapped")
                }
                
                state.progress = environment.getProgress(state)
                return .none

                
            case .startButtonTapped:
                state.progress = .firstQuestion
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
                
            case let .questionIndexButtonTapped(int):
                state.questions[state.index].response = state.currentQuestion.response
                state.index = int
                state.currentQuestion = state.questions[state.index]

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
