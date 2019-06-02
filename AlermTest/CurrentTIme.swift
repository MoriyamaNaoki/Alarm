//
//  CurrentTIme.swift
//  AlermTest
//
//  Created by user on 2019/05/29.
//  Copyright © 2019年 user. All rights reserved.
//

import UIKit

class CurrentTime {
    var timer: Timer?
    var df = DateFormatter()
    var currentTime: String?
    weak var delegate: SubViewController?
    
    init() {
        if timer == nil {
            //1秒ごとに実行
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCurrentTime), userInfo: nil, repeats: true)
        }
    }
    
    @objc private func updateCurrentTime() {
        //現在時刻表示
        df.dateFormat = "HH:mm"
        df.timeZone = TimeZone.current
        let timezoneDate = df.string(from: Date())
        currentTime = timezoneDate
        delegate?.updateTime(currentTime!)
    }

}
