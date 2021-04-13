//
//  PersonalityType.swift
//  Introspect
//
//  Created by Kody Deda on 4/13/21.
//

import Foundation

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
        case .architect    : return "An Architect (INTJ) is a person with the Introverted, Intuitive, Thinking, and Judging personality traits. These thoughtful tacticians love perfecting the details of life, applying creativity and rationality to everything they do. Their inner world is often a private, complex one."
        case .logician     : return "A Logician (INTP) is someone with the Introverted, Intuitive, Thinking, and Prospecting personality traits. These flexible thinkers enjoy taking an unconventional approach to many aspects of life. They often seek out unlikely paths, mixing willingness to experiment with personal creativity."
        case .commander    : return "A Commander (ENTJ) is someone with the Extraverted, Intuitive, Thinking, and Judging personality traits. They are decisive people who love momentum and accomplishment. They gather information to construct their creative visions but rarely hesitate for long before acting on them."
        case .debater      : return "A Debater (ENTP) is a person with the Extraverted, Intuitive, Thinking, and Prospecting personality traits. They tend to be bold and creative, deconstructing and rebuilding ideas with great mental agility. They pursue their goals vigorously despite any resistance they might encounter."
        case .advocate     : return "An Advocate (INFJ) is someone with the Introverted, Intuitive, Feeling, and Judging personality traits. They tend to approach life with deep thoughtfulness and imagination. Their inner vision, personal values, and a quiet, principled version of humanism guide them in all things."
        case .mediator     : return "A Mediator (INFP) is someone who possesses the Introverted, Intuitive, Feeling, and Prospecting personality traits. These rare personality types tend to be quiet, open-minded, and imaginative, and they apply a caring and creative approach to everything they do."
        case .protagonist  : return "A Protagonist (ENFJ) is a person with the Extraverted, Intuitive, Feeling, and Judging personality traits. These warm, forthright types love helping others, and they tend to have strong ideas and values. They back their perspective with the creative energy to achieve their goals."
        case .campaigner   : return "A Campaigner (ENFP) is someone with the Extraverted, Intuitive, Feeling, and Prospecting personality traits. These people tend to embrace big ideas and actions that reflect their sense of hope and goodwill toward others. Their vibrant energy can flow in many directions."
        case .logistician  : return "A Logistician (ISTJ) is someone with the Introverted, Observant, Thinking, and Judging personality traits. These people tend to be reserved yet willful, with a rational outlook on life. They compose their actions carefully and carry them out with methodical purpose."
        case .defender     : return "A Defender (ISFJ) is someone with the Introverted, Observant, Feeling, and Judging personality traits. These people tend to be warm and unassuming in their own steady way. They’re efficient and responsible, giving careful attention to practical details in their daily lives."
        case .executive    : return "An Executive (ESTJ) is someone with the Extraverted, Observant, Thinking, and Judging personality traits. They possess great fortitude, emphatically following their own sensible judgment. They often serve as a stabilizing force among others, able to offer solid direction amid adversity."
        case .consul       : return "A Consul (ESFJ) is a person with the Extraverted, Observant, Feeling, and Judging personality traits. They are attentive and people-focused, and they enjoy taking part in their social community. Their achievements are guided by decisive values, and they willingly offer guidance to others."
        case .virtuoso     : return "A Virtuoso (ISTP) is someone with the Introverted, Observant, Thinking, and Prospecting personality traits. They tend to have an individualistic mindset, pursuing goals without needing much external connection. They engage in life with inquisitiveness and personal skill, varying their approach as needed."
        case .adventurer   : return "An Adventurer (ISFP) is a person with the Introverted, Observant, Feeling, and Prospecting personality traits. They tend to have open minds, approaching life, new experiences, and people with grounded warmth. Their ability to stay in the moment helps them uncover exciting potentials."
        case .entrepreneur : return "An Entrepreneur (ESTP) is someone with the Extraverted, Observant, Thinking, and Prospecting personality traits. They tend to be energetic and action-oriented, deftly navigating whatever is in front of them. They love uncovering life’s opportunities, whether socializing with others or in more personal pursuits."
        case .entertainer  : return "An Entertainer (ESFP) is a person with the Extraverted, Observant, Feeling, and Prospecting personality traits. These people love vibrant experiences, engaging in life eagerly and taking pleasure in discovering the unknown. They can be very social, often encouraging others into shared activities."
        }
    }
    
    var imageURL: String {
        self.name.lowercased()
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
        case .introversion:
            return "I"
        case .extroversion:
            return "E"
        case .sensing:
            return "S"
        case .intuition:
            return "N"
        case .thinking:
            return "T"
        case .feeling:
            return "F"
        case .judging:
            return "J"
        case .percieving:
            return "P"
        }
    }
}
