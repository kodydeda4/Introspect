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
        var currentQuestion: Question { questions[questionNumber] }
    }
    
    enum Action: Equatable {
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
            
            case .previousQuestionButtonTapped:
                if state.questionNumber > 0 {
                    state.questionNumber -= 1
                }
                return .none
                
            case .nextQuestionButtonTapped:
                if state.questionNumber + 1 < state.questions.count {
                    state.questionNumber += 1
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
