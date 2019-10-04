//
//  TimerViewController.swift
//  stop watch
//
//  Created by ahmad$$ on 10/4/19.
//  Copyright © 2019 ahmad. All rights reserved.
//

import UIKit
class TimerViewController: UIViewController {
    var isTimerRunning = false
    var counter = 60
    var timerNumberInText = ""
    var istimerpaused = false
    var timer = Timer()
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var timerDurationTextField: UITextField!
    @IBOutlet weak var startPauseResumeButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelButton.isEnabled = false
        startPauseResumeButton.isEnabled = true
        istimerpaused = false
        isTimerRunning = false
        
    }
    
    
    
    @IBAction func StartPauseAndResumeButtonPressed(_ sender: UIButton) {
        // start button functionality
        
        if !isTimerRunning {
            cancelButton.isEnabled = true
            //startPauseResumeButton.isEnabled = true
            counter = Int(timerDurationTextField.text!)! * 3600
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
            isTimerRunning = true
            startPauseResumeButton.setTitle("Pause", for: .normal)
            // pause button functionality
        }else if isTimerRunning && !istimerpaused{
            timer.invalidate()
            istimerpaused = true
            startPauseResumeButton.setTitle("Resume", for: .normal)
            // resume button functionality
        }else if istimerpaused && isTimerRunning {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
            startPauseResumeButton.setTitle("Pause", for: .normal)
            istimerpaused = false
        }
    }
    
   
    @IBAction func cancelButtonPressed(_ sender: Any) {
        isTimerRunning = false
        istimerpaused = false
        cancelButton.isEnabled = false
        timer.invalidate()
        counter = 0
        timerLabel.text = "00:00.00"
        startPauseResumeButton.setTitle("Start", for: .normal)

        
    }
    
    @objc func runTimer(){
        if counter > 0 {
            counter -= 1
            
            //  let floorCounter = Int(floor(counter))
            let hour = counter / 3600
            var hourString = "\(hour) "
            if hour < 10 {
                var hourString = "0\(hour) "
            }
            
            // arrange the timer to appear like 00:00.00
            let minute = (counter % 3600 ) / 60
            var minuteString = "\(minute)"
            if minute < 10 {
                minuteString = "0\(minute)"
            }
            let second = (counter%3600) % 60
            var secondString = "\(second)"
            if second < 10 {
                secondString = "0\(second)"
            }
            
            //%.1f to appear 22:23.1 & "%.2f" to appear 22:23.13
            //let decisecond = String(format:"%.2f" , counter ).components(separatedBy: ".").last!
            timerNumberInText = "\(hourString):\(minuteString):\(secondString)"
            timerLabel.text = timerNumberInText
            
            
        }else{
            timer.invalidate()
        }
    }
}
