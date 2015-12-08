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
        score += 1
    }
    
    func determineTitle() -> String {
        return "amazing!"
    }
    
    func generateMessage() -> String {
        let message = "The value of the slider is: \(currentValue) \nThe target value is: \(targetValue)"
        return message
    }
    
}
