//
//  ViewController.swift
//  AlermTest
//
//  Created by user on 2019/05/28.
//  Copyright © 2019年 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let alarm = Alarm()
    
    @IBOutlet weak var sleepTimePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //時間表示
        sleepTimePicker.datePickerMode = UIDatePicker.Mode.time
        //現在時間を表示
        sleepTimePicker.setDate(Date(), animated: false)
    }

    @IBAction func alarmBtnWasPressed(_ sender: UIButton) {
        alarm.selectedWakeUpTime = sleepTimePicker.date
        alarm.runTimer()  
    }

}
