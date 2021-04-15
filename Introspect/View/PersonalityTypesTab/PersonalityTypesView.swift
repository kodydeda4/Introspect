//
//  ProfileView.swift
//  Introspect
//
//  Created by Kody Deda on 4/6/21.
//

import SwiftUI
import ComposableArchitecture

struct PersonalityTypesView: View {
    let store: Store<Root.State, Root.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(PersonalityType.Group.allCases) { group in
                        Divider()
                            .padding(.horizontal)
                        
                        Text(group.rawValue)
                            .font(.title)
                            .bold()
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(PersonalityType.allCases.filter { $0.group == group }) { type in
                                    NavigationLink(destination: PersonalityTypeDetailView(type: type)) {
                                        ZStack {
                                            type.group.associatedColor
                                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                                .padding(.leading)
                                            
                                            Image(type.name.lowercased())
                                                .resizable()
                                                .scaledToFit()
                                            
                                            VStack(alignment: .leading) {
                                                Spacer()
                                                HStack {
                                                    VStack(alignment: .leading) {
                                                        Text(type.rawValue)
                                                            .font(.caption)
                                                            .foregroundColor(.secondary)
                                                        
                                                        Text(type.name)
                                                            .bold()
                                                            .foregroundColor(.primary)
                                                    }
                                                    Spacer()
                                                }
                                                .padding(6)
                                                .padding([.leading, .bottom], 6)
                                                .frame(maxWidth: .infinity)
                                                .background(Color(.secondarySystemBackground))
                                            }
                                            .clipShape(RoundedRectangle(cornerRadius: 20))
                                            .padding(.leading)
                                        }
                                        
                                        .padding(.vertical)
                                        .frame(height: 225)
                                    }
                                }
                            }
                        }
                        Text(group.description)
                            .font(.body)
                            .foregroundColor(.secondary)
                            .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("Personality Types")
            .toolbar {
                Button("Sort") {
                    
                }
            }
        }
    }
}

struct PersonalityTypesView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalityTypesView(store: Root.defaultStore)
    }
}
