//
//  PersonalityTypeView.swift
//  Introspect
//
//  Created by Kody Deda on 4/13/21.
//

import SwiftUI

struct PersonalityTypeView: View {
    let personalityType: PersonalityType
    
    var body: some View {
        VStack {
            HStack {
            Text(personalityType.name)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.accentColor)
                
                Text(personalityType.rawValue)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.secondary)

            }
            
    

            
            Text(personalityType.description)
                .foregroundColor(.secondary)
                .padding()
                .background(RoundedRectangle(cornerRadius: 16).foregroundColor(Color(.secondarySystemBackground)))
        }
        
    }
}

struct PersonalityTypeView_Previews: PreviewProvider {
    static var previews: some View {
//        ForEach(PersonalityType.allCases) {
//            PersonalityTypeView(personalityType: $0)
//        }
        PersonalityTypeView(personalityType: .architect)
    }
}
