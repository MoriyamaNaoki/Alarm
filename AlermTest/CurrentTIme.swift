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
    
    //現在時刻表示
    @objc private func updateCurrentTime() {
        df.dateFormat = "HH:mm"
        df.timeZone = TimeZone.current
        let timezoneDate = df.string(from: Date())
        currentTime = timezoneDate
        delegate?.updateTime(currentTime!)
    }
}
