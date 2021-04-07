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
        var progress: Progress = .notYetStarted
        var questions: [Question] = Question.allCases
        
        var questionIndex = 0
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
        case startTestButtonTapped
//        case questionIndexButtonTapped(Int)
        
        case responseSelected(String)
        
        case backButtonTapped
        case nextButtonTapped
        
        case submitButtonTapped
        
        case hideSheetView
        case showSheetView
        
        
        case updateTestStatus
    }
    
    struct Environment {
        // environment
    }
}

extension Assessment {
    static let reducer = Reducer<State, Action, Environment>.combine(
        Reducer { state, action, environment in
            switch action {
            
            case let .responseSelected(response):
                if state.currentQuestion.response == response {
                    state.currentQuestion.response = nil
                    state.questions[state.questionIndex].response = state.currentQuestion.response
                    return .none
                } else {
                    state.currentQuestion.response = response
                    state.questions[state.questionIndex].response = state.currentQuestion.response
                    
                    return Effect(value: .nextButtonTapped)
                        .delay(for: 0.5, scheduler: DispatchQueue.main)
                        .eraseToEffect()
                }
                
            case .backButtonTapped:
                switch state.progress {
                case .active:
                    state.questionIndex -= 1
                    state.currentQuestion = state.questions[state.questionIndex]
                    if state.questionIndex == state.questions.count - 1 {
                        state.progress = .firstQuestion
                    }
                
                case .lastQuestion:
                    state.questionIndex -= 1
                    state.currentQuestion = state.questions[state.questionIndex]
                    state.progress = .active
                    
                case .finished:
                    state.currentQuestion.response = nil
                    state.questions[state.questionIndex].response = state.currentQuestion.response
                    state.progress = .lastQuestion
                    
                default:
                    print("back button tapped")
                }
                return .none
                
                
            case .nextButtonTapped:
                switch state.progress {
                
                case .lastQuestion:
                    if state.questionIndex == state.questions.count - 1
                        && state.questions.filter({ $0.response == nil }).count == 0
                    {
                        state.progress = .finished
                    }
                    
                default:
                    state.questions[state.questionIndex] = state.currentQuestion
                    state.questionIndex += 1
                    state.currentQuestion = state.questions[state.questionIndex]

                    if state.questionIndex == state.questions.count - 1 {
                        state.progress = .lastQuestion
                    }
                }
                return .none
                
            case .startTestButtonTapped:
                state.progress = .active
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
                
//            case let .questionIndexButtonTapped(int):
//                state.questions[state.questionIndex].response = state.currentQuestion.response
//                state.questionIndex = int
//                state.currentQuestion = state.questions[state.questionIndex]
//
//                state.showingSheetView = false
//
//                return Effect(value: .updateTestStatus)
                
            case .updateTestStatus:
                if state.questionIndex == 0 {
                    state.progress = .firstQuestion
                } else if state.questionIndex == state.questions.count - 1 {
                    state.progress = .lastQuestion
                } else {
                    state.progress = .active
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
