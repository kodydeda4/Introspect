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
                ForEach(PersonalityType.Group.allCases) { group in
                    Divider()
                        .padding(.horizontal)
                    
                    Text(group.rawValue)
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                        .padding(.bottom, 1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(group.description)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(PersonalityType.allCases.filter { $0.group == group }) { type in
                                NavigationLink(destination: PersonalityTypeDetailView(type: type)) {
                                    VStack(alignment: .leading) {
                                        Image(type.name.lowercased())
                                            .resizable()
                                            .scaledToFit()
                                            .padding()
                                            .background(type.group.associatedColor)

                                        Text(type.rawValue)
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                            .padding(.leading)

                                        Text(type.name)
                                            .bold()
                                            .foregroundColor(.primary)
                                            .padding([.leading, .bottom])
                                    }
                                    .background(Color(.secondarySystemGroupedBackground))
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .frame(height: 225)
                                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                }
                            }
                        }
                        .padding(16)
                        .padding(.bottom)
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
