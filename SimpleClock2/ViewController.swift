//
//  ViewController.swift
//  SimpleClock2
//
//  Created by Victor on 03.10.2023.
//

import UIKit

class ViewController: UIViewController, UpdateTimeZoneDelegateProtocol, UpdateColorDelegateProtocol {
   
    @IBOutlet private(set) var clockView: LableClockView!
   
    @IBOutlet weak var startButton: UIButton!

    @IBOutlet weak var timeZoneButton: UIButton!
    
    @IBOutlet weak var colorButton: UIButton!
    
    var timer: Timer!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        
        clockView.updateTimeLabel()
    }
    
    @objc func fireTimer() {
        clockView.updateTimeLabel()
    }
    
   
    @IBAction func startAction(sender: UIButton) {
        if timer.isValid  {
            sender.setTitle("Start", for: .normal)
            timer.invalidate()
        } else {
            sender.setTitle("Stop", for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func timeZoneAction(sender: UIButton) {
        let timeZoneControler = TimeZoneController()
        //timeZoneControler.selectedTimeZone = formatter.timeZone
        timeZoneControler.delegate = self
        self.present(timeZoneControler, animated: true)
    }
    
    @IBAction func colorAction(sender: UIButton) {
        let selectColorControler = SelectColorControler()
        selectColorControler.delegate = self
        self.present(selectColorControler, animated: true)
        
    }
    
    func upgateTimeViewControler(timeZone: TimeZone) {
        //formatter.timeZone = timeZone
        clockView.updateTimeLabel()
    }
    func buttonTapedAt(color: UIColor) {
        colorButton.setTitleColor(color, for: .reserved)
        //timeLabel.textColor = color
    }
    
    
}

