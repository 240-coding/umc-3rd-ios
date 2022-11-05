//
//  ViewController.swift
//  Week6
//
//  Created by 이서영 on 2022/11/05.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var firstDatePicker: UIDatePicker!
    @IBOutlet var firstLabel: UILabel!
    
    @IBOutlet var secondDatePicker: UIDatePicker!
    @IBOutlet var secondLabel: UILabel!
    
    var firstTimer = Timer()
    var secondTimer = Timer()
    
    var isFirstRunning = true
    var isSecondRunning = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func pressFirstStartButton(_ sender: Any) {
        var countDownTime = Int(firstDatePicker.countDownDuration)
        isFirstRunning = true
        DispatchQueue.global().async {
            let runLoop = RunLoop.current
            self.firstTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] timer in
                countDownTime -= 1
                DispatchQueue.main.async {
                    let hour = countDownTime / 3600
                    let minute = (countDownTime % 3600) / 60
                    let second = (countDownTime % 3600) % 60
                    self?.firstLabel.text = "\(hour)시간 \(minute)분 \(second)초 뒤에 알람이 울려요"
                }
                if countDownTime <= 0 {
                    self?.isFirstRunning = false
                    timer.invalidate()
                    DispatchQueue.main.async {
                        self?.firstLabel.text = "알람이 울립니다🚨"
                    }
                    return
                }
            })
            while self.isFirstRunning {
                runLoop.run(until: Date().addingTimeInterval(0.1))
            }
            
        }
    }
    
    @IBAction func pressFirstStopButton(_ sender: Any) {
        isFirstRunning = false
        firstTimer.invalidate()
        firstLabel.text = "알람을 울릴 시간을 선택해주세요⏰"
    }
    
}

