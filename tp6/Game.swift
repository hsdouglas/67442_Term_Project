//
//  Game.swift
//  tp6
//
//  Created by Hannah Stucken Douglas on 12/8/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation

class Game {
    
    var currentValue: Bool = false
    var targetValue: Bool = false
    var question: String = "Initial question"
    var score: Int = 0
    var round: Int = 0
    var numCorrect: Int = 0
    
    func startNewRound() {
        round += 1
    }
    
    func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }
    
    func calculateScore() {
        if currentValue == targetValue {
            score += 15
            numCorrect += 1
        } else {
            score -= 10
        }
    }
    
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
    
    func generateMessage() -> String {
        var message: String
        if round == 5 {
            message = "You have finished the quiz."
            
            /* Some additional last advice */
            if ((round - numCorrect) == 0) {
                message += " Wowza, perfect score! 100%"
            } else if ((round - numCorrect) <= 2) {
                message += " Almost there. Keep studying!"
            } else {
                message += " Consider taking another look at the study materials. It's important to know about your body!"
            }
        } else if currentValue == targetValue {
            message = "You're awesome!"
        } else {
            message = "Perhaps some studying is in order..."
        }

        return message
    }
    
}
