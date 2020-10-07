//
//  MainViewController.swift
//  Stopwatch
//
//  Created by Denis on 8/9/20.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    //MARK: - Outlets & Variables
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    var myTimer = Timer()
    var timerIsOn = false
    var time: Double = 0.0
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set(0.0, forKey: "time")
        timeLabel.text = String(UserDefaults.standard.double(forKey: "time"))
    }
}

//MARK: - Actions
extension MainViewController {
    
    @IBAction func startStop(_ sender: UIButton) {
        
        if startButton.tag == 0 {
            startButton.setTitle("STOP", for: .normal)
            startButton.backgroundColor = .systemRed
            
            if timerIsOn == false {
                myTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timeChange), userInfo: nil, repeats: true)
                timerIsOn = true
            }
            
        } else {
            if startButton.tag == 1 {
                startButton.setTitle("START", for: .normal)
                startButton.backgroundColor = .systemGreen
                myTimer.invalidate()
                startButton.tag = 0
                timerIsOn = false
            }
        }
    }
    
    @IBAction func reset(_ sender: UIButton) {
        time = 0.0
        timeLabel.text = ("\(time)")
        startButton.setTitle("START", for: .normal)
        startButton.backgroundColor = .systemGreen
        timerIsOn = false
    }
    
    @objc func timeChange() {
        
        startButton.tag = 1

        time += 0.1
        timeLabel.text = String(format: "%.1f", time)
        UserDefaults.standard.set(time, forKey: "time")
        
    }
}

