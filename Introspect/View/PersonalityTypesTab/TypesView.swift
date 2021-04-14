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
                            .padding(.horizontal)
                        
                        Text(group.rawValue)
                            .font(.title)
                            .bold()
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(PersonalityType.allCases.filter { $0.group == group }) { type in
                                    NavigationLink(destination: SelectedTypeView(type: type)) {
                                        ZStack {
                                            type.group.associatedColor
                                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                                .padding()
                                            
                                            Image(type.imageURL)
                                                .resizable()
                                                .scaledToFit()
//                                                .shadow(radius: 3, y: 3)
//                                                .mask(Rectangle().offset(y: -50))
                                            
                                            VStack {
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
                                            .padding(.horizontal)
                                        }
                                        .padding(.vertical)
//                                        .shadow(color: Color.black.opacity(0.2), radius: 8)
                                        .frame(height: 225)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                        }
                        Text(group.description)
                            .font(.body)
                            .foregroundColor(.secondary)
                            .padding()
                    }
                }
            }
            .padding([.vertical])
            .navigationTitle("Personality Types")
            .toolbar {
                Button("Sort") {
                    
                }
            }
        }
    }
}


struct TypesViewView_Previews: PreviewProvider {
    static var previews: some View {
        TypesView(store: Root.defaultStore)
    }
}
