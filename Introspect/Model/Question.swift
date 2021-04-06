//
//  Question.swift
//  Introspect
//
//  Created by Kody Deda on 4/6/21.
//

import Foundation

struct Question: Equatable {
    var content: String
    var answered: String?
    var options: [String]
}

extension Question {
    static var allCases: [Question] = [
        Question(
            content: "What's your favorite color?",
            options: [
                "Red",
                "Blue",
                "greeN"
            ]
        ),
        Question(
            content: "What's your favorite shape?",
            options: [
                "Square",
                "Circle",
                "triangle",
                "reCTANGLE"
            ]
        ),
    ]
}
