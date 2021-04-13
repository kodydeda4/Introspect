//
//  SelectedTypeView.swift
//  Introspect
//
//  Created by Kody Deda on 4/13/21.
//

import SwiftUI
import ComposableArchitecture
import FancyScrollView


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
    
    
    var body: some View {
        FancyScrollView(
            title: "",
            headerHeight: 350,
            scrollUpHeaderBehavior: .parallax,
            scrollDownHeaderBehavior: .offset,
            header: {
                ZStack {
                    LinearGradient(gradient: Gradient(stops: [.init(color: gradientColor, location: 0), .init(color: Color(.systemBackground), location: 1)]), startPoint: .top, endPoint: .bottom)
                    
                    
                    Image(type.imageURL)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .shadow(radius: 10)
                        .frame(width: 300)
                        .offset(x: -50, y: 50)
                }
            }
        ) {
            VStack(alignment: .leading) {
                
                HStack {
                    Text(type.name)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.accentColor)
                    
                    Text(type.rawValue)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.secondary)
                }
                .background(Color(.systemBackground))
                Divider()
                
                Text(type.description)
                    .foregroundColor(.secondary)
                //.padding()
                //.background(RoundedRectangle(cornerRadius: 20).foregroundColor(Color(.secondarySystemBackground)))
            }
            .padding()
        }
        .gesture(
            DragGesture()
                .onEnded {
                    if $0.translation.width > 100 {
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
