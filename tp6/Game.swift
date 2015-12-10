//
//  Game.swift
//  tp6
//
//  Created by Hannah Stucken Douglas on 12/8/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation

class Game {
    
    var currentValue: Bool = true
    var targetValue: Bool = true
    var question: String = "Initial question"
    var score: Int = 0
    var round: Int = 0
    
    func startNewRound() {
        round += 1
        currentValue = true
    }
    
    func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }
    
    func calculateScore() {
        if currentValue == targetValue {
            score += 15
        } else {
            score -= 10
        }
    }
    
    func determineTitle() -> String {
        var title: String
        if currentValue == targetValue {
            title = "That is correct!"
        } else {
            title = "That is incorrect."
        }
        return title
    }
    
    func generateMessage() -> String {
        var message: String
        if round == 10 {
            message = "You have finished the quiz!"
        } else if currentValue == targetValue {
            message = "Knowing about your health is extremely important."
        } else {
            message = "Time to study up! Use the info link in the homepage."
        }
        return message
    }
    
    func casting(b: Bool) -> String {
        var statement: String
        
        if (b == true) {
            statement = "true"
        } else {
            statement = "false"
        }
        
        return statement
    }
    
}
