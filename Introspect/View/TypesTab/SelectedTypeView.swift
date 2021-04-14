//
//  SelectedTypeView.swift
//  Introspect
//
//  Created by Kody Deda on 4/13/21.
//

import SwiftUI
import ComposableArchitecture
import FancyScrollView
import DynamicColor

struct SelectedTypeView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let type: PersonalityType
    var gradientColor: Color {
        switch type.group {
        case .analyst  : return Color.purple
        case .diplomat : return Color.green
        case .sentinel : return Color.blue
        case .explorer : return Color.orange
        }
    }
    
    @State var doneAnimatingImage: Bool = false
    @State var doneAnimatingText: Bool = false
    var animDuration = 0.6

    var body: some View {
        FancyScrollView(
            title: "",
            headerHeight: 400,
            scrollUpHeaderBehavior: .parallax,
            scrollDownHeaderBehavior: .offset,
            header: {
                ZStack {
                    type.group.associatedColor
                                        
                    VStack(alignment: .leading) {
                        Spacer()
                        Image(type.imageSelectedURL)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                            .scaleEffect(doneAnimatingImage ? 1 : 0)
                        
                        VStack(alignment: .leading) {
                            Text(type.rawValue)
                                .bold()
                                .foregroundColor(Color(.lightText))
                            
                            Text(type.name)
                                .font(.largeTitle)
                                .bold()
                            
                            Text(type.description)
                                .font(.caption)
                        }
                        .opacity(doneAnimatingText ? 1 : 0)
                        .animation(Animation.easeInOut(duration: animDuration*0.75).delay(animDuration), value: doneAnimatingText)
                    }
                    .scaleEffect(doneAnimatingImage ? 1 : 0)
                    .opacity(doneAnimatingImage ? 1 : 0)
                    .animation(Animation.spring(), value: doneAnimatingImage)
                    .onAppear {
                        doneAnimatingImage.toggle()
                        doneAnimatingText.toggle()
                    }
                    .foregroundColor(.white)
                    .padding()
                }
            }
        ) {
            VStack(alignment: .leading) {
                Text(String.loremIpsum)
                    .foregroundColor(.secondary)
            }
            .padding()
        }
        .gesture(
            DragGesture()
                .onEnded {
                    if $0.translation.width > 60 {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
        )
    }
}

struct SelectedTypeView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedTypeView(type: PersonalityType.architect)
    }
}
