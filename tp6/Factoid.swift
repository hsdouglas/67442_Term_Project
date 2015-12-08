//
//  Factoid.swift
//  tp6
//
//  Created by Hannah Stucken Douglas on 12/8/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation

struct Factoid {
    
    var factStatement: String
    var factReality: Bool
    
    init(fact: String, reality: Bool) {
        factStatement = fact
        factReality = reality
    }
}