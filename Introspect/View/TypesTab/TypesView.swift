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
    
    func txt(_ group: PersonalityType.Group) -> String {
        switch group {
        
        case .analyst:
            return "Independent, imaginative, and strong-willed"
        case .diplomat:
            return "Diplomatic, cooperative, and friendly"
        case .sentinel:
            return "Practical, hardworking and orderly"
        case .explorer:
            return "Spontaneous, utilitarian, and practical"
        }
    }
    
    func txt2(_ group: PersonalityType.Group) -> String {
        switch group {
        
        case .analyst:
            return "Analysts often approach things from a utilitarian perspective."
        case .diplomat:
            return "Diplomats like to play the role of harmonizers in their workplace and social lives."
        case .sentinel:
            return "Sentinels embrace and create order, security, and stability wherever they go."
        case .explorer:
            return "Explorers shine in situations that require practicality and the ability to think on your feet."
        }
    }
    
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
                                        PersonalityTypeView(type: type)
                                        .padding(.vertical)
                                        .shadow(color: Color.black.opacity(0.2), radius: 10, y: 1)
                                        .frame(height: 300)
                                    }
                                }
                            }
                        }
                        
                        Text(txt(group))
                            .font(.title3)
                            .bold()
                            .foregroundColor(.secondary)
                            .padding(.horizontal)

                        Text(txt2(group))
                            .font(.body)
                            .foregroundColor(.secondary)
                            .padding(.vertical, 2)
                            .padding(.bottom)
                            .padding(.horizontal)
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
        
    }
}


struct TypesViewView_Previews: PreviewProvider {
    static var previews: some View {
        TypesView(store: Root.defaultStore)
    }
}
