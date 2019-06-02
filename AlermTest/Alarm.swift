//
//  Alarm.swift
//  AlermTest
//
//  Created by user on 2019/05/29.
//  Copyright © 2019年 user. All rights reserved.
//

import UIKit

class Alarm {
    //アラーム設定時間
    var selectedWakeUpTime:Date?
    var sleepTimer: Timer?
    static var seconds = 0
    weak var delegate: SubViewController?

    func runTimer() {
        
        Alarm.seconds = calulateInterval(userAwakeTime: selectedWakeUpTime!)
        
        if sleepTimer == nil {
            sleepTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    }
    
    @objc private func updateTimer() {
        if Alarm.seconds != 0 {
            Alarm.seconds -= 1
            
        } else {
            Alarm.seconds = calulateInterval(userAwakeTime: selectedWakeUpTime!)
            sleepTimer?.invalidate()
            sleepTimer = nil
            
        }
    }
    
    private func calulateInterval(userAwakeTime:Date)-> Int {
        var interval = Int(userAwakeTime.timeIntervalSinceNow)
        if interval < 0 {
            interval = 86400 - (0 - interval)
        }
        
        let calender = Calendar.current
        let seconds = calender.component(.second, from: userAwakeTime)
        print(interval)
        print(seconds)
        return interval - seconds
    }
    
    
    func stopTimer() {
        if sleepTimer != nil {
            sleepTimer!.invalidate()
            sleepTimer = nil
        }
    }
    
     func test()-> Int {
        
        return Alarm.seconds
    }
}
