//
//  Root.swift
//  Introspect
//
//  Created by Kody Deda on 4/6/21.
//

import SwiftUI
import ComposableArchitecture

struct Root {
    struct State: Equatable {
        var questionNumber = 0
        var questions: [Question] = Question.allCases
        var currentQuestion: Question = Question.allCases.first!
        var testFinished = false
    }
    
    enum Action: Equatable {
        case optionSelected(String)
        case previousQuestionButtonTapped
        case nextQuestionButtonTapped
        case toggleTestFinished
    }
    
    struct Environment {
        // environment
    }
}

extension Root {
    static let reducer = Reducer<State, Action, Environment>.combine(
        Reducer { state, action, environment in
            switch action {
            
            case let .optionSelected(option):
                if option != state.currentQuestion.selectedResponse {
                    state.currentQuestion.selectedResponse = option
                    state.questions[state.questionNumber].selectedResponse = option
                    return Effect(value: .nextQuestionButtonTapped)
                        .delay(for: 0.5, scheduler: DispatchQueue.main)
                        .eraseToEffect()
                    
                } else {
                    state.currentQuestion.selectedResponse = nil
                    state.questions[state.questionNumber].selectedResponse = nil
                    return .none
                }
                
            case .previousQuestionButtonTapped:
                if state.questionNumber > 0 {
                    state.questionNumber -= 1
                    state.currentQuestion = state.questions[state.questionNumber]
                }
                return .none
                
                
            case .nextQuestionButtonTapped:
                if state.questionNumber + 1 < state.questions.count {
                    state.questionNumber += 1
                    state.currentQuestion = state.questions[state.questionNumber]
                    return .none
                } else {
                    if state.questions.filter({ $0.selectedResponse == nil }).isEmpty {
                        return Effect(value: .toggleTestFinished)
                    } else {
                        return .none
                    }
            }
            
            case .toggleTestFinished:
                state.testFinished.toggle()
                return .none
            }
        }
        .debug()
    )
}

extension Root {
    static let defaultStore = Store(
        initialState: .init(),
        reducer: reducer,
        environment: .init()
    )
}
