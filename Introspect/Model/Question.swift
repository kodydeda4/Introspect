//
//  Question.swift
//  Introspect
//
//  Created by Kody Deda on 4/6/21.
//

import Foundation

struct Question: Equatable, Identifiable, CaseIterable {
    var id: String { content }
    
    var content: String
    var response: String?
    var responses: [String]
}

extension Question {
    static var allCases: [Question] = [
        Question(
            content: "What's your favorite color?",
            responses: [
                "Red",
                "Blue",
                "greeN"
            ]
        ),
        Question(
            content: "What's your favorite shape?",
            responses: [
                "Square",
                "Circle",
                "triangle",
                "reCTANGLE"
            ]
        ),
    ]
}
