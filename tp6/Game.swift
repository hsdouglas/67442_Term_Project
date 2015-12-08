//
//  Game.swift
//  tp6
//
//  Created by Hannah Stucken Douglas on 12/8/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation

class Game {

//    let factDict = Factdeck()
//    var fact: Factoid?
    
    var currentValue: Bool = true
    var targetValue: Bool = false
    var question: String = "Initial question"
    var score: Int = 0
    var round: Int = 0
    
    func startNewRound() {
        round += 1
        targetValue = false
        currentValue = true
//        resetFactInformation()
//        question = fact.factStatement
//        targetValue = fact.factReality
//        //question = resetFactInformation().factStatement
//        //targetValue = resetFactInformation().factReality
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
        return "This is the message!"
    }
    
    
//    func resetFactInformation() {
//
//        if let temp = factDict.drawRandomFact() {
//            self.fact = temp
//        }
//    }
    
    
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
