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
        var questionIndex = 0
        var questions: [Question] = Question.allCases
        var currentQuestion: Question = Question.allCases.first!
        
        var testStatus: TestStatus = .notYetStarted
        
//        var unansweredQuestions : Int { questions.filter { $0.selectedResponse == nil }.count }
//        var firstQuestion : Bool { questionIndex == 0 }
//        var lastQuestion  : Bool { unansweredQuestions == 1 && questionIndex == questions.count - 1 }
        
        var showingSheetView = false
        
        enum TestStatus {
            case notYetStarted
            case firstQuestion
            case active
            case lastQuestion
            case finished
        }
    }
    
    enum Action: Equatable {
        case startTestButtonTapped
        case updateCurrentQuestion(Int)
        
        case responseSelected(String)
        
        case backButtonTapped
        case nextButtonTapped
        
//        case toggleTestFinished
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
            
            case let .responseSelected(option):
                if option != state.currentQuestion.selectedResponse {
                    state.currentQuestion.selectedResponse = option
                    state.questions[state.questionIndex].selectedResponse = option
                    return Effect(value: .nextButtonTapped)
                        .delay(for: 0.5, scheduler: DispatchQueue.main)
                        .eraseToEffect()
                    
                } else {
                    state.currentQuestion.selectedResponse = nil
                    state.questions[state.questionIndex].selectedResponse = nil
                    return .none
                }
                
            case .backButtonTapped:
                if state.questionIndex > 0 {
                    state.questionIndex -= 1
                    state.currentQuestion = state.questions[state.questionIndex]
                }
                return .none
                
                
            case .nextButtonTapped:
                switch state.testStatus {
                
                case .lastQuestion:
                    state.testStatus = .finished
                    
                default:
                    state.questionIndex += 1
                    state.currentQuestion = state.questions[state.questionIndex]

                    if state.questionIndex == state.questions.count - 1 {
                        state.testStatus = .lastQuestion
                    }
                }
                return .none
                
            case .startTestButtonTapped:
                state.testStatus = .active
                return .none

            case .submitButtonTapped:
                state.testStatus = .finished
                return .none
                
            case .hideSheetView:
                state.showingSheetView = false
                return .none
                
            case .showSheetView:
                state.showingSheetView = true
                return .none
                
            case let .updateCurrentQuestion(int):
                state.questionIndex = int
                state.currentQuestion = state.questions[state.questionIndex]
                return Effect(value: .hideSheetView)
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
