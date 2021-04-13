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
                        ZStack {
                            Color(.secondarySystemBackground)
                                
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

                        //.padding()
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


struct TypesViewView_Previews: PreviewProvider {
    static var previews: some View {
        TypesView(store: Root.defaultStore)
    }
}
