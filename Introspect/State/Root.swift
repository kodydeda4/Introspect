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
    }
    
    enum Action: Equatable {
        case optionSelected(String)
        case previousQuestionButtonTapped
        case nextQuestionButtonTapped
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
                if option != state.currentQuestion.answered {
                    state.currentQuestion.answered = option
                    state.questions[state.questionNumber].answered = option
                    return Effect(value: .nextQuestionButtonTapped)
                        .delay(for: 0.5, scheduler: DispatchQueue.main)
                        .eraseToEffect()
                    
                } else {
                    state.currentQuestion.answered = nil
                    state.questions[state.questionNumber].answered = nil
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
                }
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
