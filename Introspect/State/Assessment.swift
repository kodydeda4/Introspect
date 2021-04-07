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
        var progress : Progress   = .notYetStarted
        var questions: [Question] = Question.allCases
        
        var index = 0
        var currentQuestion: Question = Question.allCases.first!
        var showingSheetView = false
        
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
        // environment
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
                    print("back button tapped")
                }
                
                if state.index == 0 {
                    state.progress = .firstQuestion
                    
                } else if state.index < state.questions.count - 1 {
                    state.progress = .active
                    
                } else if state.index == state.questions.count - 1 {
                    state.progress = .lastQuestion
                }
                return .none
                                
            case .nextButtonTapped:
                switch state.progress {
                
                case .firstQuestion, .active:
                    state.index += 1
                    state.currentQuestion = state.questions[state.index]
                    
                case .notYetStarted, .lastQuestion, .finished:
                    print("Just return the effect")
                }
                
                if state.index == 0 {
                    state.progress = .firstQuestion
                    
                } else if state.index < state.questions.count - 1 {
                    state.progress = .active
                    
                } else if state.progress != .lastQuestion
                            && state.index == state.questions.count - 1 {
                    state.progress = .lastQuestion

                } else if state.progress == .lastQuestion && state.questions.filter({ $0.response == nil }).count == 0 {
                    state.progress = .finished
                }
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

                if state.index == 0 {
                    state.progress = .firstQuestion
                    
                } else if state.index < state.questions.count - 1 {
                    state.progress = .active
                    
                } else if state.progress != .lastQuestion && state.index == state.questions.count - 1 {
                    state.progress = .lastQuestion

                } else if state.progress == .lastQuestion && state.questions.filter({ $0.response == nil }).count == 0 {
                    state.progress = .finished
                    
                }
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
