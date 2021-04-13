//
//  AssessmentResult.swift
//  Introspect
//
//  Created by Kody Deda on 4/13/21.
//

import Foundation

struct AssessmentResult: Equatable {
    var introversion           = 0
    var extroversion           = 0
    var sensing                = 0
    var intuition              = 0
    var thinking               = 0
    var feeling                = 0
    var judging                = 0
    var percieving             = 0
    
    var personalityType: PersonalityType {
        let ie = introversion > extroversion ? PersonalitySpectrum.introversion : PersonalitySpectrum.extroversion
        let sn = sensing      > intuition    ? PersonalitySpectrum.sensing      : PersonalitySpectrum.intuition
        let tf = thinking     > feeling      ? PersonalitySpectrum.thinking     : PersonalitySpectrum.feeling
        let jp = judging      > percieving   ? PersonalitySpectrum.judging      : PersonalitySpectrum.percieving
        
        let str = [ie, sn, tf, jp]
            .map(\.letter)
            .joined()

        return PersonalityType(rawValue: str)!
    }
}

