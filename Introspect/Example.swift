//
//  Root.swift
//  Introspect
//
//  Created by Kody Deda on 4/6/21.
//

import SwiftUI
import ComposableArchitecture

// The comments make it seem longer than it actually is

struct Example {
    
    // Properties that mutate over time
    struct State: Equatable {
        var text = "Hello World"
        var textfield = ""
    }
    
    // Actions sent through UI
    enum Action: Equatable {
        case updateTextButtonTapped
        case updateTextfield(String)
    }
    
    // Misc. Methods
    struct Environment {
        func upperCase(_ string: String) -> String {
            return string.uppercased()
        }
    }
}

extension Example {
    static let reducer = Reducer<State, Action, Environment>.combine(
        Reducer { state, action, environment in
            
            // Mutate state through actions
            switch action {
            
            case .updateTextButtonTapped:
                state.text = environment.upperCase(state.textfield)
                return .none
                
            case let .updateTextfield(string):
                state.textfield = string
                return .none
            }
        }
    )
}

extension Example {
    // (not that important)
    static let defaultStore = Store(
        initialState: .init(),
        reducer: reducer,
        environment: .init()
    )
}

struct ExampleView: View {
    
    // Gives you access to State & Actions
    let store: Store<Example.State, Example.Action>
    
    
    var body: some View {
        // Gives access to State & Actions through the view itself
        WithViewStore(store) { viewStore in
            NavigationView {
                Form {
                    Text(viewStore.text)
                    TextField(
                        "Textfield",
                        text: viewStore.binding(
                            get: \.textfield,
                            send: Example.Action.updateTextfield
                        )
                    )
                    Button("Update Text") {
                        viewStore.send(.updateTextButtonTapped)
                    }

                }
                //.padding()
                .navigationBarTitle("Example")
            }
        }
    }
}

/*-----------------------------------------
 Show/Hide Previews:
 option + cmd + enter
 
 Resume Previews
 option + cmd + p
 ------------------------------------------*/

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView(store: Example.defaultStore)
    }
}
