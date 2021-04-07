//
//  ButtonStyle+Extensions.swift
//  Introspect
//
//  Created by Kody Deda on 4/6/21.
//

import SwiftUI

struct RoundedRectangleButtonStyle: ButtonStyle {
    var color: Color = Color(.secondarySystemBackground)
    
    func makeBody(configuration: Configuration) -> some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(height: 50)
            .foregroundColor(color)
            .overlay(configuration.label.foregroundColor(.white))
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}

struct ButtonStyle_Extensions_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack {
            Button("Tap Me") {}
                .buttonStyle(RoundedRectangleButtonStyle())

            Button("Tap Me") {}
                .buttonStyle(RoundedRectangleButtonStyle(color: .accentColor))
            
        }
        .padding()
    }
}
