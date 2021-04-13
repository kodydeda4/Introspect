//
//  AssessmentResult.swift
//  Introspect
//
//  Created by Kody Deda on 4/13/21.
//

import Foundation

struct PersonalityType: Equatable {
    var introversion           = 0
    var extroversion           = 0
    var sensing                = 0
    var intuition              = 0
    var thinking               = 0
    var feeling                = 0
    var judging                = 0
    var percieving             = 0
    
    var personalityType: String {
        let ie = introversion > extroversion ? PersonalitySpectrum.introversion : PersonalitySpectrum.extroversion
        let sn = sensing      > intuition    ? PersonalitySpectrum.sensing      : PersonalitySpectrum.intuition
        let tf = thinking     > feeling      ? PersonalitySpectrum.thinking     : PersonalitySpectrum.feeling
        let jp = judging      > percieving   ? PersonalitySpectrum.judging      : PersonalitySpectrum.percieving
        
        return [ie, sn, tf, jp]
            .map(\.letter)
            .joined()
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
