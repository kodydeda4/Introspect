//
//  Progressbar.swift
//  Introspect
//
//  Created by Kody Deda on 4/7/21.
//

import SwiftUI

public struct Progressbar: View {
    var percentage: CGFloat
    var action: () -> Void
    public var body: some View {
        VStack(alignment: .trailing) {
            Button(action: { action() }) {
                Text("\(Int(percentage * 100).description)% Complete")
                    .bold()
            }
            ZStack {
                GeometryReader { geometry in
                    Rectangle().frame(width: min(geometry.size.width, geometry.size.width) , height: geometry.size.height)
                        .foregroundColor(Color(.secondarySystemBackground))
                        .cornerRadius(geometry.size.width/7)
                        .opacity(0.5)
                        .shadow(radius: 1)
                    
                    
                    Color.accentColor
                        .mask(Rectangle()
                                .cornerRadius(geometry.size.width/7)
                                .animation(.linear, value: percentage)
                        )
                        .frame(width: min(geometry.size.width*percentage, geometry.size.width) , height: geometry.size.height)
                }
            }
            .frame(height: 10)
        }
    }
}


struct Progressbar_Previews: PreviewProvider {
    static var previews: some View {
        Progressbar(
            percentage: 1.0,
            action: {}
        )
    }
}
