//
//  SelectedTypeView.swift
//  Introspect
//
//  Created by Kody Deda on 4/13/21.
//

import SwiftUI
import FancyScrollView

struct SelectedTypeView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let type: PersonalityType
    @State var animating = false
    
    var body: some View {
        FancyScrollView(
            headerHeight: 400,
            header: {
                VStack(alignment: .leading) {
                    Image(type.name.lowercased() + "_selected")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                        .scaleEffect(animating ? 1 : 0)
                    
                    Text(type.rawValue)
                        .bold()
                        .foregroundColor(Color(.lightText))
                    
                    Text(type.name)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    
                    Text(type.description)
                        .foregroundColor(.white)
                }
                .animation(Animation.spring(), value: animating)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .background(type.group.associatedColor)
            }
        ) {
            VStack(alignment: .leading) {
                Text(type.headline)
                    .bold()
                
                Divider()
                
                Text(type.bodyText)
                    .foregroundColor(.secondary)
            }
            .padding()
        }
        .onAppear { animating.toggle() }
        .gesture(
            DragGesture().onEnded {
                if $0.translation.width > 60 {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        )
    }
}

struct SelectedTypeView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedTypeView(type: PersonalityType.debater)
    }
}

// MARK:- PersonalityType Text-Blurbs

fileprivate extension PersonalityType {
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
    
    var headline: String {
        switch self {
        case .architect    : return "A Thirst for Knowledge"
        case .logician     : return "The Life of the Mind"
        case .commander    : return "Happiness Lies in the Joy of Achievement"
        case .debater      : return "There Are no Rules Here – We’re Trying to Accomplish Something!"
        case .advocate     : return "Standing Up for What’s Right"
        case .mediator     : return "The Gift of Empathy"
        case .protagonist  : return "Firm Believers in the People"
        case .campaigner   : return "You Can Change the World With Just an Idea"
        case .logistician  : return "Associate With Those of Good Quality if You Esteem Your Reputation..."
        case .defender     : return "We Must Be Seen to Be Believed"
        case .executive    : return "Good Order Is The Foundation Of All Things"
        case .consul       : return "Respecting the Wisdom of Leadership"
        case .virtuoso     : return "Dare to Differ"
        case .adventurer   : return "Meaning Is in Every Expression of Life"
        case .entrepreneur : return "Never Confuse Movement With Action"
        case .entertainer  : return "We Are All of Us Stars..."
        }
    }
    
    var bodyText: String {
        switch self {
        case .architect: return """
            These personalities can be both the boldest of dreamers and the bitterest of pessimists. Architects believe that, through willpower and intelligence, they can achieve even the most challenging of goals. But they may be cynical about human nature more generally, assuming that most people are lazy, unimaginative, or simply doomed to mediocrity.
            """
            
        case .logician: return """
            Logicians often lose themselves in thought – which isn’t necessarily a bad thing. People with this personality type hardly ever stop thinking. From the moment they wake up, their minds buzz with ideas, questions, and insights. At times, they may even find themselves conducting full-fledged debates in their own heads.
            """
        case .commander: return """
            If there’s anything Commanders love, it’s a good challenge, big or small, and they firmly believe that given enough time and resources, they can achieve any goal. This quality makes people with the Commander personality type brilliant entrepreneurs, and their ability to think strategically and hold a long-term focus while executing each step of their plans with determination and precision makes them powerful business leaders. This determination is often a self-fulfilling prophecy, as Commanders push their goals through with sheer willpower where others might give up and move on, and their Extraverted (E) nature means they are likely to push everyone else right along with them, achieving spectacular results in the process.
            """
            
        case .debater: return """
            No one loves the process of mental sparring more than the Debater personality type, as it gives them a chance to exercise their effortlessly quick wit, broad accumulated knowledge base, and capacity for connecting disparate ideas to prove their points. Debaters are the ultimate devil’s advocate, thriving on the process of shredding arguments and beliefs and letting the ribbons drift in the wind for all to see. They don’t always do this because they are trying to achieve some deeper purpose or strategic goal, though. Sometimes it’s for the simple reason that it’s fun.
            """
            
        case .advocate: return """
            Advocates generally strive to do what’s right – and they want to help create a world where others do the right thing as well. People with this personality type may feel called to use their strengths – including creativity, imagination, and sensitivity – to uplift others and spread compassion. Concepts like egalitarianism and karma can mean a great deal to Advocates.
            """
            
        case .mediator: return """
            Although they may seem quiet or unassuming, Mediators (INFPs) have vibrant, passionate inner lives. Creative and imaginative, they happily lose themselves in daydreams, inventing all sorts of stories and conversations in their minds. These personalities are known for their sensitivity – Mediators can have profound emotional responses to music, art, nature, and the people around them.
            """
            
        case .protagonist: return """
            Protagonists are natural-born leaders, full of passion and charisma. Forming around two percent of the population, they are oftentimes our politicians, our coaches and our teachers, reaching out and inspiring others to achieve and to do good in the world. With a natural confidence that begets influence, Protagonists take a great deal of pride and joy in guiding others to work together to improve themselves and their community.
            """
            
        case .campaigner: return """
            More than just sociable people-pleasers though, Campaigners, like all their Diplomat cousins, are shaped by their Intuitive (N) quality, allowing them to read between the lines with curiosity and energy. They tend to see life as a big, complex puzzle where everything is connected – but unlike Analyst personality types, who tend to see that puzzle as a series of systemic machinations, Campaigners see it through a prism of emotion, compassion and mysticism, and are always looking for a deeper meaning.
            """
            
        case .logistician: return """
            The Logistician personality type is thought to be the most abundant, making up around 13% of the population. Their defining characteristics of integrity, practical logic and tireless dedication to duty make Logisticians a vital core to many families, as well as organizations that uphold traditions, rules and standards, such as law offices, regulatory bodies and military. People with the Logistician personality type enjoy taking responsibility for their actions, and take pride in the work they do – when working towards a goal, Logisticians hold back none of their time and energy completing each relevant task with accuracy and patience.
            """
            
        case .defender: return """
            The Defender personality type is quite unique, as many of their qualities defy the definition of their individual traits. Though sensitive, Defenders have excellent analytical abilities; though reserved, they have well-developed people skills and robust social relationships; and though they are generally a conservative type, Defenders are often receptive to change and new ideas. As with so many things, people with the Defender personality type are more than the sum of their parts, and it is the way they use these strengths that defines who they are.
            """
            
        case .executive: return """
            Executives are representatives of tradition and order, utilizing their understanding of what is right, wrong and socially acceptable to bring families and communities together. Embracing the values of honesty, dedication and dignity, people with the Executive personality type are valued for their clear advice and guidance, and they happily lead the way on difficult paths. Taking pride in bringing people together, Executives often take on roles as community organizers, working hard to bring everyone together in celebration of cherished local events, or in defense of the traditional values that hold families and communities together.
            """
            
        case .consul: return """
            Consuls are altruists, and they take seriously their responsibility to help and to do the right thing. Unlike their Diplomat relatives however, people with the Consul personality type will base their moral compass on established traditions and laws, upholding authority and rules, rather than drawing their morality from philosophy or mysticism. It’s important for Consuls to remember though, that people come from many backgrounds and perspectives, and what may seem right to them isn’t always an absolute truth.
            """
            
        case .virtuoso: return """
            Virtuosos explore ideas through creating, troubleshooting, trial and error and first-hand experience. They enjoy having other people take an interest in their projects and sometimes don’t even mind them getting into their space. Of course, that’s on the condition that those people don’t interfere with Virtuosos’ principles and freedom, and they’ll need to be open to Virtuosos returning the interest in kind.
            """
            
        case .adventurer: return """
            Adventurer personalities are true artists, but not necessarily in the typical sense where they’re out painting happy little trees. Often enough though, they are perfectly capable of this. Rather, it’s that they use aesthetics, design and even their choices and actions to push the limits of social convention. Adventurers enjoy upsetting traditional expectations with experiments in beauty and behavior – chances are, they’ve expressed more than once the phrase “Don’t box me in!”
            """
            
        case .entrepreneur: return """
            Entrepreneurs are the likeliest personality type to make a lifestyle of risky behavior. They live in the moment and dive into the action – they are the eye of the storm. People with the Entrepreneur personality type enjoy drama, passion, and pleasure, not for emotional thrills, but because it’s so stimulating to their logical minds. They are forced to make critical decisions based on factual, immediate reality in a process of rapid-fire rational stimulus response.
            """
            
        case .entertainer: return """
            Entertainers love the spotlight, and all the world’s a stage. Many famous people with the Entertainer personality type are indeed actors, but they love putting on a show for their friends too, chatting with a unique and earthy wit, soaking up attention and making every outing feel a bit like a party. Utterly social, Entertainers enjoy the simplest things, and there’s no greater joy for them than just having fun with a good group of friends.
            """
        }
    }
    
}











