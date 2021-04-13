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
        var assessment = Assessment.State()
        var completedAssessments: [Assessment.State] = []
    }
    
    enum Action: Equatable {
        case assessment(Assessment.Action)
    }
    
    struct Environment {
        // environment
    }
}

extension Root {
    static let reducer = Reducer<State, Action, Environment>.combine(
        Assessment.reducer.pullback(
            state: \.assessment,
            action: /Action.assessment,
            environment: { _ in .init() }
        ),
        Reducer { state, action, environment in
            switch action {
            case let .assessment(subaction):
                switch subaction {
                case .viewResultsButtonTapped:
                    state.completedAssessments.append(state.assessment)
                case .finishedButtonTapped:
                    state.assessment = Assessment.State()
                default:
                    print("")
                }
                return .none
            }
        }
    )
}

extension Root {
    static let defaultStore = Store(
        initialState: .init(),
        reducer: reducer,
        environment: .init()
    )
}
