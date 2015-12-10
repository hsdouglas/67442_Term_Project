//
//  Timer.swift
//  adolessons
//
//  Created by Hannah Stucken Douglas on 12/10/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import Foundation

class Timer {
    
    private var startTime: NSDate?
    
    func start() {
        startTime = NSDate()
    }
    
    func stop() {
        startTime = nil
    }
    
    func isRunning() -> Bool {
        if (startTime != nil) {
            return true
        }
        else {
            return false
        }
    }
    
    var elapsedTime: NSTimeInterval {
        if let startTime = self.startTime {
            return -1 * startTime.timeIntervalSinceNow // could also just say -startTime.timeIntervalSinceNow
        } else {
            return 0
        }
    }
    
    var elapsedTimeAsString: String {
        // return the formatted string...
        
        let min = Int(elapsedTime / 60)
        let sec = Int(elapsedTime % 60)
        let millisec = Int((elapsedTime * 10) % 10)
        
        var time: String = String(format: "%02d:%02d.%d",min, sec, millisec)
        
        return time
    }
    
}