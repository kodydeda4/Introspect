//
//  ButtonStyle+Extensions.swift
//  Introspect
//
//  Created by Kody Deda on 4/6/21.
//

import SwiftUI

struct RoundedRectangleButtonStyle: ButtonStyle {
    enum Style: String, CaseIterable {
        case confirm
        case dismiss
        
        var bgColor: Color {
            switch self {
            case .confirm:
                return Color.accentColor
            case .dismiss:
                return Color(.secondarySystemBackground)
            }
        }
        var fgColor: Color {
            switch self {
            case .confirm:
                return Color.white
            case .dismiss:
                return Color.white
            }
        }
    }
    
    var style: Style
    
    func makeBody(configuration: Configuration) -> some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(height: 50)
            .foregroundColor(style.bgColor)
            .overlay(configuration.label.foregroundColor(style.fgColor))
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
  }
}

struct ButtonStyle_Extensions_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ForEach(RoundedRectangleButtonStyle.Style.allCases, id: \.self) {
                Button($0.rawValue) {}
                    .buttonStyle(RoundedRectangleButtonStyle(style: $0))
            }
        }
        .padding()
    }
}
