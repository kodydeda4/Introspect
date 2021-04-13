//
//  ProfileView.swift
//  Introspect
//
//  Created by Kody Deda on 4/6/21.
//

import SwiftUI
import ComposableArchitecture

struct TypesView: View {
    let store: Store<Root.State, Root.Action>

    var body: some View {
        WithViewStore(store) { viewStore in
            ScrollView {
                LazyVGrid(columns: [GridItem](repeating: .init(.flexible()), count: 2)) {
                    ForEach(PersonalityType.allCases) { type in
                        PersonalityTypeView(type: type)
                        .shadow(radius: 10)
                        .padding(6)
                    }
                }
            }
            //.padding()
            .navigationTitle("Personality Types")
            .toolbar {
                Button("Sort") {
                    
                }
            }
        }
    }
}

struct PersonalityTypeView: View {
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
        ZStack {
            LinearGradient(gradient: Gradient(stops: [.init(color: gradientColor, location: 0.075), .init(color: .black, location: 1)]), startPoint: .top, endPoint: .bottom)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
            
            Image(type.imageURL)
                .resizable()
                .scaledToFit()
                .shadow(radius: 1.5, y: 2)

            VStack {
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        Text(type.rawValue)
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        Text(type.name)
                            .bold()
                    }
                    Spacer()
                }
                .padding(6)
                .padding([.leading, .bottom], 4)
                .frame(maxWidth: .infinity)
                .background(Color(.secondarySystemBackground))
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal)
        }

    }
}


struct TypesViewView_Previews: PreviewProvider {
    static var previews: some View {
        TypesView(store: Root.defaultStore)
    }
}
