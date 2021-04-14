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
    
    @State var imageScale: CGFloat = 0.75
    @State var imageOpacity: Double = 0
    @State var textOpacity: Double = 0
    var imageAnimationDuration = 0.5

    var body: some View {
        FancyScrollView(
            title: "",
            headerHeight: 400,
            scrollUpHeaderBehavior: .parallax,
            scrollDownHeaderBehavior: .offset,
            header: {
                ZStack {
//                    LinearGradient(
//                        gradient: Gradient(stops: [
//                            .init(color: gradientColor, location: 0),
//                            .init(color: Color(DynamicColor(gradientColor).tinted().cgColor), location: 0.5)
//                        ]),
//                        startPoint: .topLeading,
//                        endPoint: .bottom
//                    )
                    Color(DynamicColor(gradientColor).tinted().cgColor)
                                        
                    VStack(alignment: .leading) {
                        Spacer()
                        Image(type.imageSelectedURL)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.vertical)
                            .scaleEffect(imageScale)
                        
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
                        .opacity(textOpacity)
                        .onAppear {
                            withAnimation(Animation.easeInOut(duration: imageAnimationDuration).delay(imageAnimationDuration)) {
                                textOpacity = 1
                            }
                        }
                    }
                    .scaleEffect(imageScale)
                    .opacity(imageOpacity)
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: imageAnimationDuration)) {
                            imageScale = 1
                            imageOpacity = 1
                        }
                    }
                    .foregroundColor(.white)
                    .padding()
                }
            }
        ) {
            VStack(alignment: .leading) {
                Text(
                    """
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                    """
                )
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
