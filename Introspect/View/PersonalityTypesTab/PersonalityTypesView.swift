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
                        .font(.title)
                        .bold()
                        .padding(.horizontal)
                        .padding(.bottom, 1)
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
                                            .shadow(color: Color.black.opacity(0.3), radius: 10, x: -5, y: 5)
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
                                    .shadow(radius: 6)
                                }
                                
                            }
                        }
                        .padding(16)
                    }
                    
                    Text(group.txt)
                        .font(.headline)
                        .opacity(0.8)
                        .padding(.horizontal)
                        .padding(.bottom, 1)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    
                    Text(group.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding([.horizontal, .bottom])
                        .frame(maxWidth: .infinity, alignment: .leading)

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

fileprivate extension PersonalityType.Group {
    var txt: String {
        switch self {
        
        case .analyst  : return "Intuitive Thinking"
        case .diplomat : return "Intuitive Feeling"
        case .sentinel : return "Sensing Judging"
        case .explorer : return "Sensing Percieving"
            
        }
    }
}


struct PersonalityTypesView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalityTypesView(store: Root.defaultStore)
    }
}
