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
            Text(personalityType.title)
                .font(.title)
                .bold()
            
            Text(personalityType.description)
        }
    }
}

struct PersonalityTypeView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(PersonalityType.allCases) {
            PersonalityTypeView(personalityType: $0)
        }
    }
}
