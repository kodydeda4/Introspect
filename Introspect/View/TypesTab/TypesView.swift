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
                        Divider()
                        Text(group.rawValue)
                            .font(.title)
                            .bold()
                        
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(PersonalityType.allCases.filter { $0.group == group }) { type in
                                    PersonalityTypeView(type: type)
                                        .padding(.vertical)
                                        .shadow(color: Color.black.opacity(0.2), radius: 10, y: 1)
                                        .frame(height: 250)
                                }
                            }
                        }
                        Text(group.description)
                            .font(.body)
                            .foregroundColor(.secondary)
                            .padding(.vertical)
                    }
                    
                }

            }
            .padding()
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
            LinearGradient(gradient: Gradient(stops: [.init(color: gradientColor, location: 0), .init(color: Color(.systemBackground), location: 1)]), startPoint: .top, endPoint: .bottom)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
            
            Image(type.imageURL)
                .resizable()
                .scaledToFit()
                .shadow(radius: 2)
            
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
                .padding([.leading, .bottom], 6)
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
