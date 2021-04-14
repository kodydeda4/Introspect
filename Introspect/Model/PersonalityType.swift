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

            Architects derive much of their self-esteem from their knowledge and mental acuity. In school, people with this personality type may have been called “bookworms” or “nerds.” But rather than taking these labels as insults, many Architects embrace them. They are confident in their ability to teach themselves about – and master – any topic that interests them, whether that’s coding or capoeira or classical music.

            Architects can be single-minded, with little patience for frivolity, distractions, or idle gossip. That said, it would be a mistake to stereotype these personalities as dull or humorless. Many Architects are known for their irreverent wit, and beneath their serious exteriors, they often have a sharp, delightfully sarcastic sense of humor.
            """
            
        case .logician: return """
            Logicians often lose themselves in thought – which isn’t necessarily a bad thing. People with this personality type hardly ever stop thinking. From the moment they wake up, their minds buzz with ideas, questions, and insights. At times, they may even find themselves conducting full-fledged debates in their own heads.

            From the outside, Logicians may seem to live in a never-ending daydream. They have a reputation for being pensive, detached, and a bit reserved. That is, until they try to train all of their mental energy on the moment or the person at hand, which can be a bit uncomfortable for everyone. But regardless of which mode they’re in, Logicians are Introverts and tend to get tired out by extensive socializing. After a long day, they crave time alone to consult their own thoughts.

            But it would be a mistake to think that Logicians are unfriendly or uptight. When they connect with someone who can match their mental energy, these personalities absolutely light up, leaping from one thought to another. Few things energize them like the opportunity to swap ideas or enjoy a lively debate with another curious, inquiring soul.
            """
        case .commander: return """
            If there’s anything Commanders love, it’s a good challenge, big or small, and they firmly believe that given enough time and resources, they can achieve any goal. This quality makes people with the Commander personality type brilliant entrepreneurs, and their ability to think strategically and hold a long-term focus while executing each step of their plans with determination and precision makes them powerful business leaders. This determination is often a self-fulfilling prophecy, as Commanders push their goals through with sheer willpower where others might give up and move on, and their Extraverted (E) nature means they are likely to push everyone else right along with them, achieving spectacular results in the process.

            At the negotiating table, be it in a corporate environment or buying a car, Commanders are dominant, relentless, and unforgiving. This isn’t because they are coldhearted or vicious per se – it’s more that Commander personalities genuinely enjoy the challenge, the battle of wits, the repartee that comes from this environment, and if the other side can’t keep up, that’s no reason for Commanders to fold on their own core tenet of ultimate victory.

            If there’s anyone Commanders respect, it’s someone who is able to stand up to them intellectually, who is able to act with a precision and quality equal to their own. Commander personalities have a particular skill in recognizing the talents of others, and this helps in both their team-building efforts (since no one, no matter how brilliant, can do everything alone), and to keep Commanders from displaying too much arrogance and condescension. However, they also have a particular skill in calling out others’ failures with a chilling degree of insensitivity, and this is where Commanders really start to run into trouble.
            """
            
        case .debater: return """
            No one loves the process of mental sparring more than the Debater personality type, as it gives them a chance to exercise their effortlessly quick wit, broad accumulated knowledge base, and capacity for connecting disparate ideas to prove their points. Debaters are the ultimate devil’s advocate, thriving on the process of shredding arguments and beliefs and letting the ribbons drift in the wind for all to see. They don’t always do this because they are trying to achieve some deeper purpose or strategic goal, though. Sometimes it’s for the simple reason that it’s fun.

            Playing the devil’s advocate helps people with the Debater personality type to not only develop a better sense of others’ reasoning, but a better understanding of opposing ideas – since Debaters are the ones arguing them.

            This tactic shouldn’t be confused with the sort of mutual understanding Diplomat personalities seek – Debaters, like all Analyst personality types, are on a constant quest for knowledge, and what better way to gain it than to attack and defend an idea, from every angle, from every side?
            """
            
        case .advocate: return """
            Advocates are the rarest personality types of all. Still, Advocates leave their mark on the world. They have a deep sense of idealism and integrity, but they aren’t idle dreamers – they take concrete steps to realize their goals and make a lasting impact.

            Advocates’ unique combination of personality traits makes them complex and quite versatile. For example, Advocates can speak with great passion and conviction, especially when standing up for their ideals. At other times, however, they may choose to be soft-spoken and understated, preferring to keep the peace rather than challenge others.

            Advocates generally strive to do what’s right – and they want to help create a world where others do the right thing as well. People with this personality type may feel called to use their strengths – including creativity, imagination, and sensitivity – to uplift others and spread compassion. Concepts like egalitarianism and karma can mean a great deal to Advocates.

            Advocates may see helping others as their purpose in life. They are troubled by injustice, and they typically care more about altruism than personal gain. As a result, Advocates tend to step in when they see someone facing unfairness or hardship. Many people with this personality type also aspire to fix society’s deeper problems, in the hope that unfairness and hardship can become things of the past.
            """
            
        case .mediator: return """
            Although they may seem quiet or unassuming, Mediators (INFPs) have vibrant, passionate inner lives. Creative and imaginative, they happily lose themselves in daydreams, inventing all sorts of stories and conversations in their minds. These personalities are known for their sensitivity – Mediators can have profound emotional responses to music, art, nature, and the people around them.

            Idealistic and empathetic, Mediators long for deep, soulful relationships, and they feel called to help others. But because this personality type makes up such a small portion of the population, Mediators may sometimes feel lonely or invisible, adrift in a world that doesn’t seem to appreciate the traits that make them unique.

            Mediators share a sincere curiosity about the depths of human nature. Introspective to the core, they’re exquisitely attuned to their own thoughts and feelings, but they yearn to understand the people around them as well. Mediators are compassionate and nonjudgmental, always willing to hear another person’s story. When someone opens up to them or turns to them for comfort, they feel honored to listen and be of help.

            Empathy is among this personality type’s greatest gifts, but at times it can be a liability. The troubles of the world weigh heavily on Mediators’ shoulders, and these personalities can be vulnerable to internalizing other people’s negative moods or mindsets. Unless they learn to set boundaries, Mediators may feel overwhelmed by just how many wrongs there are that need to be set right.
            """
            
        case .protagonist: return """
            Protagonists are natural-born leaders, full of passion and charisma. Forming around two percent of the population, they are oftentimes our politicians, our coaches and our teachers, reaching out and inspiring others to achieve and to do good in the world. With a natural confidence that begets influence, Protagonists take a great deal of pride and joy in guiding others to work together to improve themselves and their community.

            People are drawn to strong personalities, and Protagonists radiate authenticity, concern and altruism, unafraid to stand up and speak when they feel something needs to be said. They find it natural and easy to communicate with others, especially in person, and their Intuitive (N) trait helps people with the Protagonist personality type to reach every mind, be it through facts and logic or raw emotion. Protagonists easily see people’s motivations and seemingly disconnected events, and are able to bring these ideas together and communicate them as a common goal with an eloquence that is nothing short of mesmerizing.

            The interest Protagonists have in others is genuine, almost to a fault – when they believe in someone, they can become too involved in the other person’s problems, place too much trust in them. Luckily, this trust tends to be a self-fulfilling prophecy, as Protagonists’ altruism and authenticity inspire those they care about to become better themselves. But if they aren’t careful, they can overextend their optimism, sometimes pushing others further than they’re ready or willing to go.

            Protagonists are vulnerable to another snare as well: they have a tremendous capacity for reflecting on and analyzing their own feelings, but if they get too caught up in another person’s plight, they can develop a sort of emotional hypochondria, seeing other people’s problems in themselves, trying to fix something in themselves that isn’t wrong. If they get to a point where they are held back by limitations someone else is experiencing, it can hinder Protagonists’ ability to see past the dilemma and be of any help at all. When this happens, it’s important for Protagonists to pull back and use that self-reflection to distinguish between what they really feel, and what is a separate issue that needs to be looked at from another perspective.
            """
            
        case .campaigner: return """
            More than just sociable people-pleasers though, Campaigners, like all their Diplomat cousins, are shaped by their Intuitive (N) quality, allowing them to read between the lines with curiosity and energy. They tend to see life as a big, complex puzzle where everything is connected – but unlike Analyst personality types, who tend to see that puzzle as a series of systemic machinations, Campaigners see it through a prism of emotion, compassion and mysticism, and are always looking for a deeper meaning.

            Many other types are likely to find these qualities irresistible, and if they’ve found a cause that sparks their imagination, Campaigners will bring an energy that oftentimes thrusts them into the spotlight, held up by their peers as a leader and a guru – but this isn’t always where independence-loving Campaigners want to be. Worse still if they find themselves beset by the administrative tasks and routine maintenance that can accompany a leadership position. Campaigners’ self-esteem is dependent on their ability to come up with original solutions, and they need to know that they have the freedom to be innovative – they can quickly lose patience or become dejected if they get trapped in a boring role.

            Luckily, Campaigners know how to relax, and they are perfectly capable of switching from a passionate, driven idealist in the workplace to that imaginative and enthusiastic free spirit on the dance floor, often with a suddenness that can surprise even their closest friends. Being in the mix also gives them a chance to connect emotionally with others, giving them cherished insight into what motivates their friends and colleagues. They believe that everyone should take the time to recognize and express their feelings, and their empathy and sociability make that a natural conversation topic.

            The Campaigner personality type needs to be careful, however – if they rely too much on their intuition, assume or anticipate too much about a friend’s motivations, they can misread the signals and frustrate plans that a more straightforward approach would have made simple. This kind of social stress is the bugbear that keeps harmony-focused Diplomats awake at night. Campaigners are very emotional and sensitive, and when they step on someone’s toes, they both feel it.

            Campaigners will spend a lot of time exploring social relationships, feelings and ideas before they find something that really rings true. But when they finally do find their place in the world, their imagination, empathy and courage are likely to produce incredible results.
            """
            
        case .logistician: return """
            The Logistician personality type is thought to be the most abundant, making up around 13% of the population. Their defining characteristics of integrity, practical logic and tireless dedication to duty make Logisticians a vital core to many families, as well as organizations that uphold traditions, rules and standards, such as law offices, regulatory bodies and military. People with the Logistician personality type enjoy taking responsibility for their actions, and take pride in the work they do – when working towards a goal, Logisticians hold back none of their time and energy completing each relevant task with accuracy and patience.

            Logisticians don’t make many assumptions, preferring instead to analyze their surroundings, check their facts and arrive at practical courses of action. Logistician personalities are no-nonsense, and when they’ve made a decision, they will relay the facts necessary to achieve their goal, expecting others to grasp the situation immediately and take action. Logisticians have little tolerance for indecisiveness, but lose patience even more quickly if their chosen course is challenged with impractical theories, especially if they ignore key details – if challenges becomes time-consuming debates, Logisticians can become noticeably angry as deadlines tick nearer.
            """
            
        case .defender: return """
            The Defender personality type is quite unique, as many of their qualities defy the definition of their individual traits. Though sensitive, Defenders have excellent analytical abilities; though reserved, they have well-developed people skills and robust social relationships; and though they are generally a conservative type, Defenders are often receptive to change and new ideas. As with so many things, people with the Defender personality type are more than the sum of their parts, and it is the way they use these strengths that defines who they are.

            There’s hardly a better type to make up such a large proportion of the population, nearly 13%. Combining the best of tradition and the desire to do good, Defenders are found in lines of work with a sense of history behind them, such as medicine, academics and charitable social work.

            Defender personalities (especially Turbulent ones) are often meticulous to the point of perfectionism, and though they procrastinate, they can always be relied on to get the job done on time. Defenders take their responsibilities personally, consistently going above and beyond, doing everything they can to exceed expectations and delight others, at work and at home.
            """
            
        case .executive: return """
            Executives are representatives of tradition and order, utilizing their understanding of what is right, wrong and socially acceptable to bring families and communities together. Embracing the values of honesty, dedication and dignity, people with the Executive personality type are valued for their clear advice and guidance, and they happily lead the way on difficult paths. Taking pride in bringing people together, Executives often take on roles as community organizers, working hard to bring everyone together in celebration of cherished local events, or in defense of the traditional values that hold families and communities together.

            Demand for such leadership is high in democratic societies, and forming no less than 11% of the population, it’s no wonder that many of America’s presidents have been Executives. Strong believers in the rule of law and authority that must be earned, Executive personalities lead by example, demonstrating dedication and purposeful honesty, and an utter rejection of laziness and cheating, especially in work. If anyone declares hard, manual work to be an excellent way to build character, it is Executives.

            Executives are aware of their surroundings and live in a world of clear, verifiable facts – the surety of their knowledge means that even against heavy resistance, they stick to their principles and push an unclouded vision of what is and is not acceptable. Their opinions aren’t just empty talk either, as Executives are more than willing to dive into the most challenging projects, improving action plans and sorting details along the way, making even the most complicated tasks seem easy and approachable.

            However, Executives don’t work alone, and they expect their reliability and work ethic to be reciprocated – people with this personality type meet their promises, and if partners or subordinates jeopardize them through incompetence or laziness, or worse still, dishonesty, they do not hesitate to show their wrath. This can earn them a reputation for inflexibility, a trait shared by all Sentinel personalities, but it’s not because Executives are arbitrarily stubborn, but because they truly believe that these values are what make society work.
            """
            
        case .consul: return """
            People who share the Consul personality type are, for lack of a better word, popular – which makes sense, given that it is also a very common personality type, making up twelve percent of the population. In high school, Consuls are the cheerleaders and the quarterbacks, setting the tone, taking the spotlight and leading their teams forward to victory and fame. Later in life, Consuls continue to enjoy supporting their friends and loved ones, organizing social gatherings and doing their best to make sure everyone is happy.

            Discussing scientific theories or debating European politics isn’t likely to capture Consuls’ interest for too long. Consuls are more concerned with fashion and their appearance, their social status and the standings of other people. Practical matters and gossip are their bread and butter, but Consuls do their best to use their powers for good.

            Consuls are altruists, and they take seriously their responsibility to help and to do the right thing. Unlike their Diplomat relatives however, people with the Consul personality type will base their moral compass on established traditions and laws, upholding authority and rules, rather than drawing their morality from philosophy or mysticism. It’s important for Consuls to remember though, that people come from many backgrounds and perspectives, and what may seem right to them isn’t always an absolute truth.

            Consuls love to be of service, enjoying any role that allows them to participate in a meaningful way, so long as they know that they are valued and appreciated. This is especially apparent at home, and Consuls make loyal and devoted partners and parents. Consul personalities respect hierarchy, and do their best to position themselves with some authority, at home and at work, which allows them to keep things clear, stable and organized for everyone.
            """
            
        case .virtuoso: return """
            Virtuosos love to explore with their hands and their eyes, touching and examining the world around them with cool rationalism and spirited curiosity. People with this personality type are natural Makers, moving from project to project, building the useful and the superfluous for the fun of it, and learning from their environment as they go. Often mechanics and engineers, Virtuosos find no greater joy than in getting their hands dirty pulling things apart and putting them back together, just a little bit better than they were before.

            Virtuosos explore ideas through creating, troubleshooting, trial and error and first-hand experience. They enjoy having other people take an interest in their projects and sometimes don’t even mind them getting into their space. Of course, that’s on the condition that those people don’t interfere with Virtuosos’ principles and freedom, and they’ll need to be open to Virtuosos returning the interest in kind.

            Virtuosos enjoy lending a hand and sharing their experience, especially with the people they care about, and it’s a shame they’re so uncommon, making up only about five percent of the population. Virtuoso women are especially rare, and the typical gender roles that society tends to expect can be a poor fit – they’ll often be seen as tomboys from a young age.
            """
            
        case .adventurer: return """
            Adventurer personalities are true artists, but not necessarily in the typical sense where they’re out painting happy little trees. Often enough though, they are perfectly capable of this. Rather, it’s that they use aesthetics, design and even their choices and actions to push the limits of social convention. Adventurers enjoy upsetting traditional expectations with experiments in beauty and behavior – chances are, they’ve expressed more than once the phrase “Don’t box me in!”

            Adventurers live in a colorful, sensual world, inspired by connections with people and ideas. These personalities take joy in reinterpreting these connections, reinventing and experimenting with both themselves and new perspectives. No other type explores and experiments in this way more. This creates a sense of spontaneity, making Adventurers seem unpredictable, even to their close friends and loved ones.

            Despite all this, Adventurers are definitely Introverts, surprising their friends further when they step out of the spotlight to be by themselves to recharge. Just because they are alone though, doesn’t mean people with the Adventurer personality type sit idle – they take this time for introspection, assessing their principles. Rather than dwelling on the past or the future, Adventurers think about who they are. They return from their cloister, transformed.

            Adventurers live to find ways to push their passions. Riskier behaviors like gambling and extreme sports are more common with this personality type than with others. Fortunately their attunement to the moment and their environment allows them to do better than most. Adventurers also enjoy connecting with others, and have a certain irresistible charm.

            However, if a criticism does get through, it can end poorly. Some Adventurers can handle kindly phrased commentary, valuing it as another perspective to help push their passions in new directions. But if the comments are more biting and less mature, Adventurer personalities can lose their tempers in spectacular fashion.

            Adventurers are sensitive to others’ feelings and value harmony. When faced with criticism, it can be a challenge for people with this type to step away from the moment long enough to not get caught up in the heat of the moment. But living in the moment goes both ways, and once the heightened emotions of an argument cool, Adventurers can usually call the past the past and move on as though it never occurred.
            """
            
        case .entrepreneur: return """
            Entrepreneurs always have an impact on their immediate surroundings – the best way to spot them at a party is to look for the whirling eddy of people flitting about them as they move from group to group. Laughing and entertaining with a blunt and earthy humor, Entrepreneur personalities love to be the center of attention. If an audience member is asked to come on stage, Entrepreneurs volunteer – or volunteer a shy friend.

            Theory, abstract concepts and plodding discussions about global issues and their implications don’t keep Entrepreneurs interested for long. Entrepreneurs keep their conversation energetic, with a good dose of intelligence, but they like to talk about what is – or better yet, to just go out and do it. Entrepreneurs leap before they look, fixing their mistakes as they go, rather than sitting idle, preparing contingencies and escape clauses.

            Entrepreneurs are the likeliest personality type to make a lifestyle of risky behavior. They live in the moment and dive into the action – they are the eye of the storm. People with the Entrepreneur personality type enjoy drama, passion, and pleasure, not for emotional thrills, but because it’s so stimulating to their logical minds. They are forced to make critical decisions based on factual, immediate reality in a process of rapid-fire rational stimulus response.

            This makes school and other highly organized environments a challenge for Entrepreneurs. It certainly isn’t because they aren’t smart, and they can do well, but the regimented, lecturing approach of formal education is just so far from the hands-on learning that Entrepreneurs enjoy. It takes a great deal of maturity to see this process as a necessary means to an end, something that creates more exciting opportunities.

            Also challenging is that to Entrepreneurs, it makes more sense to use their own moral compass than someone else’s. Rules were made to be broken. This is a sentiment few high school instructors or corporate supervisors are likely to share, and can earn Entrepreneur personalities a certain reputation. But if they minimize the trouble-making, harness their energy, and focus through the boring stuff, Entrepreneurs are a force to be reckoned with.
            """
            
        case .entertainer: return """
            If anyone is to be found spontaneously breaking into song and dance, it is the Entertainer personality type. Entertainers get caught up in the excitement of the moment, and want everyone else to feel that way, too. No other personality type is as generous with their time and energy as Entertainers when it comes to encouraging others, and no other personality type does it with such irresistible style.

            Entertainers love the spotlight, and all the world’s a stage. Many famous people with the Entertainer personality type are indeed actors, but they love putting on a show for their friends too, chatting with a unique and earthy wit, soaking up attention and making every outing feel a bit like a party. Utterly social, Entertainers enjoy the simplest things, and there’s no greater joy for them than just having fun with a good group of friends.

            It’s not just talk either – Entertainers have the strongest aesthetic sense of any personality type. From grooming and outfits to a well-appointed home, Entertainer personalities have an eye for fashion. Knowing what’s attractive the moment they see it, Entertainers aren’t afraid to change their surroundings to reflect their personal style. Entertainers are naturally curious, exploring new designs and styles with ease.

            Though it may not always seem like it, Entertainers know that it’s not all about them – they are observant, and very sensitive to others’ emotions. People with this personality type are often the first to help someone talk out a challenging problem, happily providing emotional support and practical advice. However, if the problem is about them, Entertainers are more likely to avoid a conflict altogether than to address it head-on. Entertainers usually love a little drama and passion, but not so much when they are the focus of the criticisms it can bring.
            """
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
