//
//  PersonalityType.swift
//  Introspect
//
//  Created by Kody Deda on 4/13/21.
//

import Foundation
import SwiftUI

enum PersonalityType: String, Equatable, CaseIterable, Identifiable {
    var id: PersonalityType { self }
    
    case architect    = "INTJ"
    case logician     = "INTP"
    case commander    = "ENTJ"
    case debater      = "ENTP"
    case advocate     = "INFJ"
    case mediator     = "INFP"
    case protagonist  = "ENFJ"
    case campaigner   = "ENFP"
    case logistician  = "ISTJ"
    case defender     = "ISFJ"
    case executive    = "ESTJ"
    case consul       = "ESFJ"
    case virtuoso     = "ISTP"
    case adventurer   = "ISFP"
    case entrepreneur = "ESTP"
    case entertainer  = "ESFP"
    
    var name: String {
        switch self {
        case .architect    : return "Architect"
        case .logician     : return "Logician"
        case .commander    : return "Commander"
        case .debater      : return "Debater"
        case .advocate     : return "Advocate"
        case .mediator     : return "Mediator"
        case .protagonist  : return "Protagonist"
        case .campaigner   : return "Campaigner"
        case .logistician  : return "Logistician"
        case .defender     : return "Defender"
        case .executive    : return "Executive"
        case .consul       : return "Consul"
        case .virtuoso     : return "Virtuoso"
        case .adventurer   : return "Adventurer"
        case .entrepreneur : return "Entrepreneur"
        case .entertainer  : return "Entertainer"
        }
    }
    
    var description: String {
        switch self {
        case .architect    : return "Imaginative and strategic thinkers, with a plan for everything."
        case .logician     : return "Innovative inventors with an unquenchable thirst for knowledge."
        case .commander    : return "Bold, imaginative, and strong-willed leaders, always finding a way - or making one."
        case .debater      : return "Smart and curious thinkers who cannot resist an intellectual challenge."
        case .advocate     : return "Quiet and mystical, yet very inspiring and tireless idealists."
        case .mediator     : return "Poetic, kind, and altruistic people, always eager to help a good cause."
        case .protagonist  : return "Charismatic and inspiring leaders, able to mesmerize their listeners."
        case .campaigner   : return "Enthusiastic, creative and sociable free spirits, who can always find a reason to smile."
        case .logistician  : return "Practical and fact-minded individuals, whose reliabilty cannot be doubted."
        case .defender     : return "Very dedicated and warm protectors, always ready to defend their loved ones."
        case .executive    : return "Excellent administrators, unsurpassed at managing things - or people."
        case .consul       : return "Extraordinarily caring, social and popular people, always eager to help."
        case .virtuoso     : return "Bold and practical experimenters, masters of all kinds of tools."
        case .adventurer   : return "Flexible and charming artists, always ready to explore and experience something new."
        case .entrepreneur : return "Smart, energetic and very perceptive people, who truly enjoy living on the edge."
        case .entertainer  : return "Spontaneous, energetic and enthusiastic people - life is never boring around them."
        }
    }
    
    var imageURL: String {
        self.name.lowercased()
    }
    var imageSelectedURL: String {
        "\(self.name.lowercased())_selected"
    }
    
    enum Group: String, Identifiable, CaseIterable {
        var id: Group { self }
        
        case analyst = "Analysts"
        case diplomat = "Diplomats"
        case sentinel = "Sentinels"
        case explorer = "Explorers"
        
        var description: String {
            switch self {
            case .analyst  : return "Fiercely independent, open-minded, strong-willed and imaginative types who often approach things from a utilitarian perspective."
            case .diplomat : return "Diplomatic, cooperative, and imaginative people who often play the role of harmonizers in their workplace or social circles."
            case .sentinel : return "Highly practical, hardworking, and cooperative types that embrace and create order, security and stability wherever they go."
            case .explorer : return "Spontaneous, utilitarian, crafty, and practical types that shine in situations that require quick reaction and ability to think on your feet."
            }
        }
        
        var associatedColor: Color {
            switch self {
            case .analyst  : return Color(.systemPurple)
            case .diplomat : return Color(.systemGreen)
            case .sentinel : return Color(.systemBlue)
            case .explorer : return Color(.systemOrange)
            }
        }
    }
    
    var group: Group {
        switch self {
        
        case .architect, .logician, .commander, .debater:
            return .analyst
            
        case .advocate, .mediator, .protagonist, .campaigner:
            return .diplomat
            
        case .logistician, .defender, .executive, .consul:
            return .sentinel
            
        case .virtuoso, .adventurer, .entrepreneur, .entertainer:
            return .explorer
        }
    }
}


enum PersonalitySpectrum: String, Identifiable, CaseIterable {
    var id: PersonalitySpectrum { self }
    
    case introversion
    case extroversion
    case sensing
    case intuition
    case thinking
    case feeling
    case judging
    case percieving
    
    var opposite: PersonalitySpectrum {
        switch self {
        case .introversion : return .extroversion
        case .extroversion : return .introversion
        case .sensing      : return .intuition
        case .intuition    : return .sensing
        case .thinking     : return .feeling
        case .feeling      : return .thinking
        case .judging      : return .percieving
        case .percieving   : return .judging
        }
    }
    
    var letter: String {
        switch self {
        case .introversion : return "I"
        case .extroversion : return "E"
        case .sensing      : return "S"
        case .intuition    : return "N"
        case .thinking     : return "T"
        case .feeling      : return "F"
        case .judging      : return "J"
        case .percieving   : return "P"
        }
    }
}
