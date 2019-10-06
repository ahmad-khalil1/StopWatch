//
//  TimerViewController.swift
//  stop watch
//
//  Created by ahmad$$ on 10/4/19.
//  Copyright © 2019 ahmad. All rights reserved.
//

import UIKit
class TimerViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    var timesArray = [[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23],[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59],[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59]]
    var hour: Int = 0
    var minute = 0
    var second = 0
    var isTimerRunning = false
    var counter = 0
    var timerNumberInText = ""
    var istimerpaused = false
    var timer = Timer()
    //let pickerView = UIPickerView()
    
    @IBOutlet weak var timerLabel: UILabel!
  //  @IBOutlet weak var timerDurationTextField: UITextField!
    @IBOutlet weak var startPauseResumeButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
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
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
            isTimerRunning = true
            startPauseResumeButton.setTitle("Pause", for: .normal)
            counter = (hour*3600)+(minute*60)+(second)
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
    
    //Marke:- UIpickerViewDataSource Methods
    
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
      return timesArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return timesArray[component].count
    }
    //MARK :- UIpickerViewDelgate Methods
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(timesArray[component][row])

    }

    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        hour = timesArray[0][pickerView.selectedRow(inComponent: 0)]
        minute = timesArray[1][pickerView.selectedRow(inComponent: 1)]
        second = timesArray[2][pickerView.selectedRow(inComponent: 2)]
    
        
        
    }

//    func pickerView(_pickerView: UIPickerView,
//                    accessibilityLabelForComponent component: Int) -> String?{
//        if component = 0{
//         return
//        }else if component = 1 {
//
//        }else if component = 2{
//
    //        }}
//
    
}

