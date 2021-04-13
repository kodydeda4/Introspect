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
                VStack(alignment: .leading) {
                    ForEach(PersonalityType.Group.allCases) { group in
                        Text(group.rawValue)
                            .font(.title)
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(PersonalityType.allCases.filter { $0.group == group }) { type in
                                    PersonalityTypeView(type: type)
                                        .frame(height: 250)
                                        .padding(.vertical)
                                        .shadow(color: Color.black.opacity(0.2), radius: 20)
                                        .padding(.vertical)
                                        
                                }
                            }
                            .padding(.horizontal)
                            
                        }
                        
                        
                    }
                    
                }
                .padding()
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
                    //            RadialGradient(gradient: Gradient(colors: [gradientColor, Color(.black)]), center: .center, startRadius: 50, endRadius: 500)

            LinearGradient(gradient: Gradient(stops: [.init(color: gradientColor, location: 0), .init(color: Color(.systemBackground), location: 1)]), startPoint: .top, endPoint: .bottom)
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
