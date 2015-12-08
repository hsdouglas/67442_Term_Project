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
    var targetValue: Bool = false
    var question: String = "Initial question"
    var score: Int = 0
    var round: Int = 0
    
    func startNewRound() {
        round += 1
        targetValue = false
        currentValue = true
    }
    
    func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }
    
    func calculateScore() {
        if currentValue == targetValue {
            score += 100
        } else {
            score -= 10
        }
    }
    
    func determineTitle() -> String {
        return "amazing!"
    }
    
    func generateMessage() -> String {
        return "This is the message!"
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
