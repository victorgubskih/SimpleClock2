//
//  ViewController.swift
//  SimpleClock2
//
//  Created by Victor on 03.10.2023.
//

import UIKit

class ViewController: UIViewController, UpdateTimeZoneDelegateProtocol {
   
    @IBOutlet private(set) var timeLabel: UILabel!
    var button = UIButton(type: .roundedRect)
    var buttonTimeZone = UIButton(type: .roundedRect)
    var buttonColor = UIButton(type: .roundedRect)
    var timer: Timer!
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatter.dateFormat = "HH:mm:ss"
        formatter.timeZone = TimeZone.current
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        
        updateTimeLabel()
        
        view.addSubview(button)
        button.frame = CGRect(x: 0, y: view.frame.height - 300, width: 110, height: 48)
        button.setTitle("Stop", for: .normal)
        button.center.x = view.center.x
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        
        view.addSubview(buttonTimeZone)
        buttonTimeZone.frame = CGRect(x: 0, y: view.frame.height - 200, width: 110, height: 48)
        buttonTimeZone.setTitle("Time Zone", for: .normal)
        buttonTimeZone.center.x = view.center.x
        buttonTimeZone.setTitleColor(.green, for: .normal)
        buttonTimeZone.addTarget(self, action: #selector(timeZoneAction(sender:)), for: .touchUpInside)
        buttonTimeZone.backgroundColor = .gray
        buttonTimeZone.layer.cornerRadius = 10
        
        view.addSubview(buttonColor)
        buttonColor.frame = CGRect(x: 0, y: view.frame.height - 100, width: 110, height: 48)
        buttonColor.setTitle("Color", for: .normal)
        buttonColor.center.x = view.center.x
        buttonColor.setTitleColor(.yellow, for: .normal)
        buttonColor.addTarget(self, action: #selector(colorAction(sender:)), for: .touchUpInside)
        buttonColor.backgroundColor = .gray
        buttonColor.layer.cornerRadius = 10
    }
    
    @objc func fireTimer() {
        updateTimeLabel()
    }
    
    func updateTimeLabel() {
        let currentDate = Date()
        let timeString = formatter.string(from:  currentDate)
        timeLabel.text = timeString
    }
    @objc func buttonAction(sender: UIButton) {
        if sender.title(for: .normal) == "Stop"  {
            sender.setTitle("Start", for: .normal)
            timer.invalidate()
        } else {
            sender.setTitle("Stop", for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        }
    }
    
    @objc func timeZoneAction(sender: UIButton) {
        let timeZoneControler = TimeZoneController()
        timeZoneControler.selectedTimeZone = formatter.timeZone
        timeZoneControler.delegate = self
        self.present(timeZoneControler, animated: true)
    }
    
    @objc func colorAction(sender: UIButton) {
        let selectColorControler = SelectColorControler()
        self.present(selectColorControler, animated: true)
        
    }
    
    func upgateTimeViewControler(timeZone: TimeZone) {
        formatter.timeZone = timeZone
        updateTimeLabel()
    }
    
}

