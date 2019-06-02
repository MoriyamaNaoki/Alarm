//
//  SubViewController.swift
//  AlermTest
//
//  Created by user on 2019/05/28.
//  Copyright © 2019年 user. All rights reserved.
//
import Foundation
import UIKit

class SubViewController: UIViewController {
    var currentTime = CurrentTime()
    var alarm = Alarm()
    var timeCheck = 0

    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        currentTime.delegate = self
        alarm.delegate = self
        
    }

    func updateTime(_ time:String) {
        timeLabel.text = time
        timeCheck = alarm.test()
        if timeCheck == 0 {
            changeView()
        }
    }
    
    func changeView() {
        //ポップアップ表示
        let myAlert = UIAlertController(title: "alert", message: "時間です。", preferredStyle: .alert)
        myAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        myAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(myAlert, animated: true, completion: nil)
        
    }

    @IBAction func closeBtnWasPressed(_ sender: UIButton)
    {
        //前の画面に戻る
        dismiss(animated: true, completion: nil)
    }
    


}
