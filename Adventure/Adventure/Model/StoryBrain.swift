//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation
var storyNumber = 0

struct StoryBrain {
    let stories = [
        Story(
            title: "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A pickup truck rumbles to a stop next to you. A man with a wide brimmed hat and sunglasses asks: 'Need a ride?'.",
            choice1: "Thanks for the help!", choice1Destination: 2,
            choice2: "I'll keep walking, Thanks", choice2Destination: 1
        ),
        Story(
            title: "He puts the truck in park, and unlocks the doors.",
            choice1: "I hop in the truck", choice1Destination: 2,
            choice2: "Wait, I know how to change a tire.", choice2Destination: 3
        ),
        Story(
            title: "As you begin to drive, the stranger starts talking about his favorite music. He asks you to open the glove box inside is a cassete tape of Elton John And Pink Flyod",
            choice1: "I love Elton John! Hand him the cassette tape.", choice1Destination: 5,
            choice2: "Pink Flyod is more your style", choice2Destination: 4
        ),
        Story(
            title: "What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?",
            choice1: "The", choice1Destination: 0,
            choice2: "End", choice2Destination: 0
        ),
        Story(
            title: "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.",
            choice1: "The", choice1Destination: 0,
            choice2: "End", choice2Destination: 0
        ),
        Story(
            title: "You bond with the strangeer while crooning verses of 'Can you feel the love tonight'. He drops you off at the next town.",
            choice1: "The", choice1Destination: 0,
            choice2: "End", choice2Destination: 0
        )
    ]
    
    

    
    
    
    
    
    
    
    mutating func nextStory(userChoice: String) {
        
        let currentStory = stories[storyNumber]
        if userChoice == currentStory.choice1 {
            storyNumber = currentStory.choice1Destination
        } else if userChoice == currentStory.choice2 {
            storyNumber = currentStory.choice2Destination
        }
    }
    
    func getTitle()->String{
        return stories[storyNumber].title
    }
    func getC1() ->String{
        stories[storyNumber].choice1
    }
    func getC2() -> String{
        stories[storyNumber].choice2
    }
    
    
    
    
}

