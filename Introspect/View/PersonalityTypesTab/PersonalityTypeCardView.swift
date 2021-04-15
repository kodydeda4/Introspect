//
//  PersonalityCardView.swift
//  Introspect
//
//  Created by Kody Deda on 4/14/21.
//

import SwiftUI

struct PersonalityTypeCardView: View {
    var type: PersonalityType
    
    var body: some View {
        ZStack {
            type.group.associatedColor
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
            
            Image(type.imageURL)
                .resizable()
                .scaledToFit()
            
            VStack(alignment: .leading) {
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        Text(type.rawValue)
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        Text(type.name)
                            .bold()
                            .foregroundColor(.primary)
                    }
                    Spacer()
                }
                .padding(6)
                .padding([.leading, .bottom], 6)
                .frame(maxWidth: .infinity)
                .background(Color(.secondarySystemBackground))
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal)
        }
    }
}

struct PersonalityTypeCardView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalityTypeCardView(type: PersonalityType.architect)
    }
}
