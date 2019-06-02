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
    
    //決定ボタン
    @IBAction func alarmBtnWasPressed(_ sender: UIButton) {
        alarm.selectedWakeUpTime = sleepTimePicker.date
        alarm.runTimer()  
    }

}
