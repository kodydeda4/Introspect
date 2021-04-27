//
//  Question.swift
//  Introspect
//
//  Created by Kody Deda on 4/6/21.
//

import Foundation
import SwiftUI

struct Question: Equatable, Identifiable, CaseIterable {
    var id: String { content }
    
    var tendsToward: PersonalitySpectrum
    var content: String
    var response: Response?
    
    enum Response: Int, Identifiable, CaseIterable {
        var id: Response { self }
        case stronglyAgree    =  3
        case agree            =  2
        case somewhatAgree    =  1
        case undecided        =  0
        case somewhatDisagree = -1
        case disagree         = -2
        case stronglyDisagree = -3        
    }
}

extension Question {
    static var allCases: [Question] = [
        Question(tendsToward: .introversion, content: "You spend a lot of your free time exploring various random topics that pique your interest."),
        Question(tendsToward: .introversion, content: "Seeing other people cry can easily make you feel like you want to cry too."),
        Question(tendsToward: .extroversion, content: "You often make a backup plan for a backup plan."),
        Question(tendsToward: .extroversion, content: "You usually stay calm, even under a lot of pressure."),
        Question(tendsToward: .sensing,      content: "At social events, you rarely try to introduce yourself to new people and mostly talk to the ones you already know."),
        Question(tendsToward: .sensing,      content: "You prefer to completely finish one project before starting another."),
        Question(tendsToward: .intuition,    content: "You like to use organizing tools like schedules and lists."),
        Question(tendsToward: .intuition,    content: "Even a small mistake can cause you to doubt your overall abilities and knowledge."),
        Question(tendsToward: .thinking,     content: "You feel comfortable just walking up to someone you find interesting and striking up a conversation."),
        Question(tendsToward: .thinking,     content: "You are not too interested in discussing various interpretations and analyses of creative works."),
        Question(tendsToward: .feeling,      content: "You are more inclined to follow your head than your heart."),
        Question(tendsToward: .feeling,      content: "You usually prefer just doing what you feel like at any given moment instead of planning a particular daily routine."),
        Question(tendsToward: .judging,      content: "You rarely worry about whether you make a good impression on people you meet."),
        Question(tendsToward: .judging,      content: "You enjoy participating in group activities."),
        Question(tendsToward: .percieving,   content: "You like books and movies that make you come up with your own interpretation of the ending."),
        Question(tendsToward: .percieving,   content: "Your happiness comes more from helping others accomplish things than your own accomplishments."),
        Question(tendsToward: .introversion, content: "You are interested in so many things that you find it difficult to choose what to try next."),
        Question(tendsToward: .introversion, content: "You are prone to worrying that things will take a turn for the worse."),
        Question(tendsToward: .introversion, content: "You avoid leadership roles in group settings."),
        Question(tendsToward: .introversion, content: "You are definitely not an artistic type of person."),
        Question(tendsToward: .introversion, content: "You think the world would be a better place if people relied more on rationality and less on their feelings."),
        Question(tendsToward: .introversion, content: "You prefer to do your chores before allowing yourself to relax."),
        Question(tendsToward: .introversion, content: "You enjoy watching people argue."),
        Question(tendsToward: .introversion, content: "You tend to avoid drawing attention to yourself."),
        Question(tendsToward: .introversion, content: "Your mood can change very quickly."),
        Question(tendsToward: .introversion, content: "You lose patience with people who are not as efficient as you."),
        Question(tendsToward: .introversion, content: "You often end up doing things at the last possible moment."),
        Question(tendsToward: .introversion, content: "You have always been fascinated by the question of what, if anything, happens after death."),
        Question(tendsToward: .introversion, content: "You usually prefer to be around others rather than on your own."),
        Question(tendsToward: .introversion, content: "You become bored or lose interest when the discussion gets highly theoretical."),
        Question(tendsToward: .introversion, content: "You find it easy to empathize with a person whose experiences are very different from yours."),
        Question(tendsToward: .introversion, content: "You usually postpone finalizing decisions for as long as possible."),
        Question(tendsToward: .introversion, content: "You rarely second-guess the choices that you have made."),
        Question(tendsToward: .introversion, content: "After a long and exhausting week, a lively social event is just what you need."),
        Question(tendsToward: .introversion, content: "You enjoy going to art museums."),
        Question(tendsToward: .introversion, content: "You often have a hard time understanding other people’s feelings."),
        Question(tendsToward: .introversion, content: "You like to have a to-do list for each day."),
        Question(tendsToward: .introversion, content: "You rarely feel insecure."),
        Question(tendsToward: .introversion, content: "You avoid making phone calls."),
        Question(tendsToward: .introversion, content: "You often spend a lot of time trying to understand views that are very different from your own."),
        Question(tendsToward: .introversion, content: "In your social circle, you are often the one who contacts your friends and initiates activities."),
        Question(tendsToward: .introversion, content: "If your plans are interrupted, your top priority is to get back on track as soon as possible."),
        Question(tendsToward: .introversion, content: "You are still bothered by mistakes that you made a long time ago."),
        Question(tendsToward: .introversion, content: "You rarely contemplate the reasons for human existence or the meaning of life."),
        Question(tendsToward: .introversion, content: "Your emotions control you more than you control them."),
        Question(tendsToward: .introversion, content: "You take great care not to make people look bad, even when it is completely their fault."),
        Question(tendsToward: .introversion, content: "Your personal work style is closer to spontaneous bursts of energy than organized and consistent efforts."),
        Question(tendsToward: .introversion, content: "When someone thinks highly of you, you wonder how long it will take them to feel disappointed in you."),
        Question(tendsToward: .introversion, content: "You would love a job that requires you to work alone most of the time."),
        Question(tendsToward: .introversion, content: "You believe that pondering abstract philosophical questions is a waste of time."),
        Question(tendsToward: .introversion, content: "You feel more drawn to places with busy, bustling atmospheres than quiet, intimate places."),
        Question(tendsToward: .introversion, content: "You know at first glance how someone is feeling."),
        Question(tendsToward: .introversion, content: "You often feel overwhelmed."),
        Question(tendsToward: .introversion, content: "You complete things methodically without skipping over any steps."),
        Question(tendsToward: .introversion, content: "You are very intrigued by things labeled as controversial."),
        Question(tendsToward: .introversion, content: "You would pass along a good opportunity if you thought someone else needed it more."),
        Question(tendsToward: .introversion, content: "You struggle with deadlines."),
        Question(tendsToward: .introversion, content: "You feel confident that things will work out for you."),
    ]
}
