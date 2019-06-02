import Foundation
import UIKit

class SubViewController: UIViewController {
    var currentTime = CurrentTime()
    var alarm = Alarm()
    var timeCheck = 0
    var timeMinutes = 0
    var timeSeconds = 0
    //現在時間表示
    @IBOutlet weak var timeLabel: UILabel!
    //残り時間表示
    @IBOutlet weak var alarmTimeLabel: UILabel!
    
    override func viewDidLoad() {
        currentTime.delegate = self
        alarm.delegate = self
    }

    //時間の更新
    func updateTime(_ time:String) {
        timeLabel.text = time
        timeCheck = alarm.timeCheck()
        if timeCheck == 0 {
            changeView()
        }
        if timeCheck != -1 {
            timeMinutes = timeCheck / 60
            timeSeconds = timeCheck % 60
            if timeMinutes != 0 {
                alarmTimeLabel.text = "時間まで　" + String(timeMinutes) + "分" + String(timeSeconds) + " 秒"
            } else {
                alarmTimeLabel.text = "時間まで　" + String(timeSeconds) + " 秒"
            }
        }
    }
    
    //ポップアップ表示
    func changeView() {
        let alert = UIAlertController(title: "", message: "時間です", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}
