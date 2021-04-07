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
        case questionIndexButtonTapped(Int)
        
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
                switch state.testStatus {
                case .active:
                    state.questionIndex -= 1
                    state.currentQuestion = state.questions[state.questionIndex]
                    if state.questionIndex == state.questions.count - 1 {
                        state.testStatus = .firstQuestion
                    }
                
                case .lastQuestion:
                    state.questionIndex -= 1
                    state.currentQuestion = state.questions[state.questionIndex]
                    state.testStatus = .active
                    
                case .finished:
                    state.currentQuestion.response = nil
                    state.questions[state.questionIndex].response = state.currentQuestion.response
                    state.testStatus = .lastQuestion
                    
                default:
                    print("back button tapped")
                }
                return .none
                
                
            case .nextButtonTapped:
                switch state.testStatus {
                
                case .lastQuestion:
                    if state.questionIndex == state.questions.count - 1
                        && state.questions.filter({ $0.response == nil }).count == 0
                    {
                        state.testStatus = .finished
                    }
                    
                default:
                    state.questions[state.questionIndex] = state.currentQuestion
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
                
            case let .questionIndexButtonTapped(int):
                state.questions[state.questionIndex].response = state.currentQuestion.response
                state.questionIndex = int
                state.currentQuestion = state.questions[state.questionIndex]
                
                state.showingSheetView = false
                
                return Effect(value: .updateTestStatus)
                
            case .updateTestStatus:
                if state.questionIndex == 0 {
                    state.testStatus = .firstQuestion
                } else if state.questionIndex == state.questions.count - 1 {
                    state.testStatus = .lastQuestion
                } else {
                    state.testStatus = .active
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
