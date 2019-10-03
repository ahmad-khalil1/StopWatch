//
//  ViewController.swift
//  stop watch
//
//  Created by ahmad$$ on 9/27/19.
//  Copyright © 2019 ahmad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var restButton: UIButton!

    @IBOutlet weak var lapTimeLabel: UILabel!
    
    var timer = Timer()
    var counter = 0.0
    var lapCounter = 1
    var timerStringText = ""
    var timerIsRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.isEnabled = true
        //stopButton.isEnabled = false
        restButton.isEnabled = false
        
        
    }
    
//
//    @IBAction func stopButtonPressed(_ sender: UIButton) {
//        startButton.isEnabled = true
//        stopButton.isEnabled = false
//        restButton.isEnabled = true
//        timerIsRunning = false
//        timer.invalidate()
//
//
//
//    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        //resting the timer functionality
        if !timerIsRunning {
            startButton.isEnabled = true
            //stopButton.isEnabled = false
            restButton.isEnabled = false
            timerIsRunning = false
            timer.invalidate()
            counter = 0.0
            timeLabel.text = "00:00.00"
            lapTimeLabel.text = ""
        // take the lap time functionality
        }else{
            lapTimeLabel.text? += "lap\(lapCounter)                                           \(timerStringText) \n" ?? "lap\(lapCounter)                                           \(timerStringText) \n"
            lapCounter += 1
        }
        
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        // Starting the timer functionality
        if !timerIsRunning {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(runTime), userInfo: nil, repeats: true)
            //stopButton.isEnabled = true
            restButton.isEnabled = true
            // startButton.isEnabled = false
            startButton.setTitle("stop", for: .normal)
            restButton.setTitle("lap", for: .normal)
            timerIsRunning=true
            
        // stoping the time functionality
        }else{
            //startButton.isEnabled = true
            //stopButton.isEnabled = false
            restButton.isEnabled = true
            timerIsRunning = false
            timer.invalidate()
            startButton.setTitle("start", for: .normal)
            restButton.setTitle("reset", for: .normal)
        }
        
    
    }
    
    
    @objc func runTime() {
        
        counter += 0.01
        let floorCounter = Int(floor(counter))
        //       let hour = floorCounter / 3600
        //        var hourString = "\(hour) "
        //        if hour < 10 {
        //        var hourString = "0\(hour) "
        //        }
        
        // arrange the timer to appear like 00:00.00
        let minute = (floorCounter % 3600 ) / 60
        var minuteString = "\(minute)"
        if minute < 10 {
            minuteString = "0\(minute)"
        }
        let second = (floorCounter%3600) % 60
        var secondString = "\(second)"
        if second < 10 {
            secondString = "0\(second)"
        }
        
        //%.1f to appear 22:23.1 & "%.2f" to appear 22:23.13
        let decisecond = String(format:"%.2f" , counter ).components(separatedBy: ".").last!
        timerStringText = "\(minuteString):\(secondString).\(decisecond)"
        timeLabel.text = timerStringText
        
        
        
    }
    
    // MARK :- laps table view Methods
    
    
    
    
    

}

