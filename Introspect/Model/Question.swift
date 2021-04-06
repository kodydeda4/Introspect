//
//  Question.swift
//  Introspect
//
//  Created by Kody Deda on 4/6/21.
//

import Foundation

struct Question: Equatable {
    var content: String
    var answered: Bool = false
}

extension Question {
    static var allCases: [Question] = [
        Question(content: "Question 1"),
        Question(content: "Question 2"),
    ]
}
