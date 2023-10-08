//
//  ViewController.swift
//  SimpleClock2
//
//  Created by Victor on 03.10.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private(set) var timeLabel: UILabel!
    var button = UIButton()
    var timer: Timer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
       
      
        updateTimeLabel()
        
        view.addSubview(button)
        button.frame = CGRect(x: 0, y: view.frame.height - 300, width: 110, height: 48)
        button.setTitle("Stop", for: .normal)
        button.center.x = view.center.x
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        
    }
    
    @objc func fireTimer() {
        updateTimeLabel()
    }
    
    func updateTimeLabel() {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        formatter.timeZone = TimeZone(identifier: "UTC-7")
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
    
   
    
}

