import UIKit

class Alarm {
    //アラーム設定時間
    var selectedWakeUpTime:Date?
    var sleepTimer: Timer?
    static var time = 0
    weak var delegate: SubViewController?

    //決定ボタンを押したときに実行
    func runTimer() {
        Alarm.time = calulateInterval(userAwakeTime: selectedWakeUpTime!)
        if sleepTimer == nil {
            //毎秒updateTimerを実行
            sleepTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    }
    
    //アラーム時間か確認
    @objc private func updateTimer() {
        if Alarm.time != 0 {
            Alarm.time -= 1
        } else {
            Alarm.time = calulateInterval(userAwakeTime: selectedWakeUpTime!)
            sleepTimer?.invalidate()
        }
    }
    
    //現在時間との差から残り時間を返す
    private func calulateInterval(userAwakeTime:Date)-> Int {
        var interval = Int(userAwakeTime.timeIntervalSinceNow)
        if interval < 0 {
            interval = 86400 - (0 - interval)
        }
        
        let calender = Calendar.current
        let seconds = calender.component(.second, from: userAwakeTime)
        return interval - seconds
    }
    
    //アラームまでの時間
    func timeCheck()-> Int {
        return Alarm.time
    }
}
