//
//  SelectedTypeView.swift
//  Introspect
//
//  Created by Kody Deda on 4/13/21.
//

import SwiftUI
import FancyScrollView

struct SelectedTypeView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let type: PersonalityType
    @State var animating = false
    
    var body: some View {
        FancyScrollView(
            headerHeight: 400,
            header: {
                VStack(alignment: .leading) {
                    Spacer()
                    
                    Image(type.imageSelectedURL)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                        .scaleEffect(animating ? 1 : 0)
                    
                    Text(type.rawValue)
                        .bold()
                        .foregroundColor(Color(.lightText))
                    
                    Text(type.name)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    
                    Text(type.description)
                        .font(.caption)
                        .foregroundColor(.white)
                }
                .animation(Animation.spring(), value: animating)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(type.group.associatedColor)
            }
        ) {
            VStack(alignment: .leading) {
                Text(type.headline)
                    .font(.title3)
                    .bold()
                
                Divider()
                
                Text(type.bodyText)
                    .foregroundColor(.secondary)
            }
            .padding()
        }
        .onAppear { animating.toggle() }
        .gesture(
            DragGesture().onEnded {
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





