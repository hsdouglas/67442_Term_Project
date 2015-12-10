//
//  Game.swift
//  tp6
//
//  Created by Hannah Stucken Douglas on 12/8/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation

class Game {
    
    /* values to keep track of and compare against the user's input */
    var currentValue: Bool = false
    var targetValue: Bool = false
    var question: String = "Initial question"
    var round: Int = 0
    var numCorrect: Int = 0
    
    /* only need to set the round score, because the targetValue is set by the GameViewController */
    func startNewRound() {
        round += 1
    }
    
    /* give the user a blank slate so that they are encouraged to improve performance */
    func startNewGame() {
        numCorrect = 0
        round = 0
        startNewRound()
    }
    
    /* user testing showed that number correct was more valuable than arbitrary points assignment for correct/incorrect answers */
    func calculateNumCorrect() {
        if currentValue == targetValue {
            numCorrect += 1
        }
    }
    
    /* prepare the title for the alert, based on the user's accuracy */
    func determineTitle() -> String {
        var title: String
        if currentValue == targetValue {
            title = "Correct"
        } else {
            title = "Incorrect"
        }
        if round == 5 {
            title += " ...all done!"
        }
        return title
    }
    
    /* prepare the message for the alert, based on the user's accuracy */
    func generateMessage() -> String {
        var message: String
        if round == 5 {
            message = "You have finished the quiz."
            
            /* Some additional last advice if the game is over */
            if ((round - numCorrect) == 0) {
                message += " Wowza, perfect score! 100%"
            } else if ((round - numCorrect) <= 2) {
                message += " Almost there. Keep studying!"
            } else {
                message += " Consider taking another look at the study materials. It's important to know about your body!"
            }
        } else if currentValue == targetValue {
            message = "It's great that you know so much!"
        } else {
            message = "Perhaps some studying is in order..."
        }

        return message
    }
    
}
