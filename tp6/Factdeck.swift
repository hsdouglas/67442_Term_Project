//
//  Factdeck.swift
//  tp6
//
//  Created by Hannah Stucken Douglas on 12/8/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation

class Factdeck {
    
    var facts = [Factoid]()
    
    init() {
        let factData = [
            "puberty happens to everybody" : true,
            "during puberty, only boys grow hair in new places" : false,
            "girls hips widen during puberty" : true,
            "peer pressure is heightened during puberty" : true,
            "the physical changes in puberty are unnatural" : false
        ]
        
        // Now create a simple way to loop through the dictionary and create a Flashcard object
        // for each and add that object to the `cards` array we created as an instance variable.
        // This can be done in one line using a closure and I'd encourage you to do so.
        facts = map(factData) { Factoid(fact: $0, reality: $1) }
    }
    
    func drawRandomFact() -> Factoid? {
        if facts.isEmpty {  // shouldn't ever really be an issue; just being safe...
            return nil
        } else {
            // return a flashcard object from the deck cards
            return facts[Int(arc4random_uniform(UInt32(facts.count)))]
        }
    }
}
