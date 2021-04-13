//
//  PersonalityTypeView.swift
//  Introspect
//
//  Created by Kody Deda on 4/13/21.
//

import SwiftUI
import ComposableArchitecture

struct AssessmentResultsView: View {
    let store: Store<Assessment.State, Assessment.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            
            VStack {
                Image(viewStore.personalityType.imageURL)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                
            
                
                HStack {
                    Text(viewStore.personalityType.name)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.accentColor)
                    
                    Text(viewStore.personalityType.rawValue)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.secondary)
                }
                .padding()
                
                Text(viewStore.personalityType.description)
                    .foregroundColor(.secondary)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20).foregroundColor(Color(.secondarySystemBackground)))
                                    
                Spacer()
                
                Button("Finished") {
                    viewStore.send(.finishedButtonTapped)
                }
                .buttonStyle(RoundedRectangleButtonStyle(color: .accentColor))
                .padding()
            }
            .padding()
        }
    }
}

struct PersonalityTypeView_Previews: PreviewProvider {
    static var previews: some View {
        //        ForEach(PersonalityType.allCases) {
        //            PersonalityTypeView(personalityType: $0)
        //        }
        AssessmentResultsView(store: Assessment.defaultStore)
    }
}
